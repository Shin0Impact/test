package il.ac.kinneret.certificateSigningServer;

import il.ac.kinneret.certificateSigningServer.util.ByteManipulation;
import il.ac.kinneret.certificateSigningServer.util.ServerConstants;
import il.ac.kinneret.certificateSigningServer.util.Utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Map;

/**
 * Command-line server tool for receiving a signed and encrypted file,
 * verifying the signature, unwrapping the key, and decrypting it.
 * @author Team
 * @version 1.0
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

        String ip = params.get("ip");
        int port = Integer.parseInt(params.get("port"));
        String tempfile = params.get("tempfile");
        String outfile = params.get("outfile");
        String keystorePath = params.get("keystore");
        String password = params.get("pwd");
        String privateAlias = params.get("privateAlias");
        String publicAlias = params.get("publicAlias");

        try (ServerSocket serverSocket = new ServerSocket(port)) {
            System.out.println("Listening");
            Socket clientSocket = serverSocket.accept();
            System.out.println("Received connection from " + clientSocket.getRemoteSocketAddress());

            DataInputStream dis = new DataInputStream(clientSocket.getInputStream());

            int sigLen = dis.readInt();
            byte[] signature = new byte[sigLen];
            dis.readFully(signature);

            int wrappedKeyLen = dis.readInt();
            byte[] wrappedKey = new byte[wrappedKeyLen];
            dis.readFully(wrappedKey);

            int ivLen = dis.readInt();
            byte[] iv = new byte[ivLen];
            dis.readFully(iv);

            int fileLen = dis.readInt();
            byte[] encFile = new byte[fileLen];
            dis.readFully(encFile);

            Files.write(Paths.get(tempfile), encFile);

            KeyStore ks = KeyStore.getInstance("PKCS12");
            ks.load(new FileInputStream(keystorePath), password.toCharArray());

            // Use provided aliases instead of hardcoded ones
            PrivateKey privateKey = (PrivateKey) ks.getKey(privateAlias, password.toCharArray());
            Certificate clientCert = ks.getCertificate(publicAlias);
            if (clientCert == null) {
                throw new RuntimeException("Client certificate not found for alias '" + publicAlias + "'.");
            }
            PublicKey clientPublicKey = clientCert.getPublicKey();
            String subject = ((X509Certificate) clientCert).getSubjectX500Principal().getName();

            Signature verifier = Signature.getInstance("SHA256withRSA");
            verifier.initVerify(clientPublicKey);
            verifier.update(encFile);

            if (verifier.verify(signature)) {
                System.out.println("Signature valid from subject " + subject);
            } else {
                System.out.println("Error: Signature invalid for subject " + subject);
                return;
            }

            Cipher unwrapCipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding");
            unwrapCipher.init(Cipher.UNWRAP_MODE, privateKey);
            SecretKey aesKey = (SecretKey) unwrapCipher.unwrap(wrappedKey, "AES", Cipher.SECRET_KEY);
            System.out.println("Unwrapped key: " + ByteManipulation.bytesToHex(aesKey.getEncoded()));

            Cipher aesCipher = Cipher.getInstance("AES/GCM/NoPadding");
            aesCipher.init(Cipher.DECRYPT_MODE, aesKey, new GCMParameterSpec(128, iv));
            byte[] decrypted = aesCipher.doFinal(encFile);

            Files.write(Paths.get(outfile), decrypted);
            System.out.println("Decrypted file successfully");
            System.out.println("Stopped listening");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }


    private static void showUsage() {
        System.out.println("Usage: CertificateSigningServer-5785 -ip=s -port=p -tempfile=t -outfile=f -keystore=k " +
                "-pwd=password -privateAlias=privA -publicAlias=pubA");
    }
}
