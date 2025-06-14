package il.ac.kinneret.certificateSigningClient;

import il.ac.kinneret.certificateSigningClient.util.ByteManipulation;
import il.ac.kinneret.certificateSigningClient.util.Utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.cert.Certificate;
import java.util.Map;

/**
 * Client tool that encrypts, signs, wraps, and sends a file securely to a server using Java PKI.
 */
public class Main {
    public static void main(String[] args) {
        Map<String, String> params;
        try {
            params = Utils.parseArguments(args);
        } catch (Exception e) {
            showUsage();
            return;
        }

        String dest = params.get("dest");
        int port = Integer.parseInt(params.get("port"));
        String aesHex = params.get("aeskey");
        String ivHex = params.get("iv");
        String infile = params.get("infile");
        String keystorePath = params.get("keystore");
        String password = params.get("pwd");
        String privateAlias = params.get("privateAlias");
        String publicAlias = params.get("publicAlias");

        try {
            byte[] aesKeyBytes = ByteManipulation.hexToBytes(aesHex);
            byte[] iv = ByteManipulation.hexToBytes(ivHex);
            byte[] inputData = Files.readAllBytes(Paths.get(infile));

            SecretKey aesKey = new SecretKeySpec(aesKeyBytes, "AES");
            Cipher aesCipher = Cipher.getInstance("AES/GCM/NoPadding");
            aesCipher.init(Cipher.ENCRYPT_MODE, aesKey, new GCMParameterSpec(128, iv));
            byte[] encrypted = aesCipher.doFinal(inputData);
            System.out.println("Encryption succeeded");

            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(new FileInputStream(keystorePath), password.toCharArray());

            Certificate serverCert = ks.getCertificate(publicAlias);
            if (serverCert == null) {
                throw new RuntimeException("❌ Certificate with alias '" + publicAlias + "' not found in keystore.");
            }
            PublicKey serverPub = serverCert.getPublicKey();
            Cipher wrapCipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding");
            wrapCipher.init(Cipher.WRAP_MODE, serverPub);
            byte[] wrappedKey = wrapCipher.wrap(aesKey);
            System.out.println("Wrapped key: " + ByteManipulation.bytesToHex(wrappedKey));

            char[] entryPassword = privateAlias.equalsIgnoreCase("alicekey") ? "alicepwd".toCharArray() :
                    privateAlias.equalsIgnoreCase("bobkey") ? "bobpwd".toCharArray() :
                            password.toCharArray(); // fallback

            PrivateKey clientPriv = (PrivateKey) ks.getKey(privateAlias, entryPassword);

            if (clientPriv == null) {
                throw new RuntimeException("❌ Private key with alias '" + privateAlias + "' not found or wrong password.");
            }

            Signature signer = Signature.getInstance("SHA256withRSA");
            signer.initSign(clientPriv);
            signer.update(encrypted);
            byte[] signature = signer.sign();
            System.out.println("Encrypted file signature: " + ByteManipulation.bytesToHex(signature));

            Socket socket = new Socket(dest, port);
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());

            dos.writeInt(signature.length);
            dos.write(signature);

            dos.writeInt(wrappedKey.length);
            dos.write(wrappedKey);

            dos.writeInt(iv.length);
            dos.write(iv);

            dos.writeInt(encrypted.length);
            dos.write(encrypted);

            System.out.println("File sent");
            dos.close();
            socket.close();

        } catch (Exception e) {
            System.out.println("Input or output error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void showUsage() {
        System.out.println("Usage: CertificateSigningClient-5785 -dest=s -port=p -aeskey=key -iv=iv -publicAlias=pubA " +
                "-privateAlias=privA -infile=f -keystore=k -pwd=pass");
    }
}
