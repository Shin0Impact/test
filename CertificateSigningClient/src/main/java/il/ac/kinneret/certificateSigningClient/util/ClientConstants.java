package il.ac.kinneret.certificateSigningClient.util;

/**
 * Constants for the client program in the certificate signing tool
 *
 * @author Michael J. May
 * @version 2025
 */
public class ClientConstants {
    public static final String IN_FILE = "infile";
    public static final String PRIVATE_KEY_ALIAS = "privateAlias";
    public static final String IV = "iv";
    public static final String SERVER_IP = "dest";
    public static final String AES_KEY = "aeskey";
    public static final String SERVER_PORT = "port";
    public static final String MISSING_PARAMETER = "Missing parameter";
    public static final String RSA_SUITE = "RSA/ECB/OAEPWithSHA-256AndMGF1Padding";
    public static final String ERROR_WRAPPING_THE_AES_KEY = "Error wrapping the AES key: %s%n";
    public static final String WRAPPED_KEY = "Wrapped key: %s%n";
    public static final String ERROR_CREATING_OUTPUT_TEMPORARY_FILE = "Error creating output temporary file: %s%n";
    public static final String AES_GCM_NO_PADDING = "AES/GCM/NoPadding";
    public static final String ERROR_ENCRYPTING_FILE = "Error encrypting file";
    public static final String ENCRYPTION_SUCCEEDED = "Encryption succeeded";
    public static final String ERROR_INSTANTIATING_CIPHER = "Error instantiating cipher: %s%n";
    public static final String ERROR_ENCRYPTING_FILE_MESSAGE = "Error encrypting file: %s%n";
    public static final String CANT_CONTACT_THE_SERVER = "Can't contact the server: %s%n";
    public static final String CANT_READ_ENCRYPTED_FILE = "Can't read encrypted file: %s%n";
    public static final String INPUT_OR_OUTPUT_ERROR = "Input or output error: %s%n";
    public static final String CLIENT_USAGE = """
            Usage: CertificateSigningClient-5785 -dest=s -port=p -aeskey=key -iv=iv -publicAlias=pubA -privateAlias=privA -infile=f -keystore=k -pwd=pass
            aeskey in hexadecimal format
            iv in hexadecimal format
            keystore must be of type PKCS12
            password is the keystore password
            privateAlias is the alias for the private key in the keystore
            publicAlias is the alias for the public key in the keystore""";
    public static final String KEY_STORE = "keystore";
    public static final String KEY_STORE_PASSWORD = "pwd";
    public static final String PUBLIC_KEY_ALIAS = "publicAlias";
    public static final String SIGNING_ALGORITHM = "SHA256withRSA";
    public static final String ERROR_LOADING_PRIVATE_KEY_ENTRY_IS_NOT_A_PRIVATE_KEY_ENTRY = "Error loading private key entry. %s is not a private key entry%n";
    public static final String ERROR_LOADING_PUBLIC_KEY_CERTIFICATE = "Error loading public key certificate: %s%n";
    public static final String ERROR_UNKNOWN_SIGNING_ALGORITHM = "Error unknown signing algorithm: %s%n";
    public static final String ERROR_INVALID_KEY = "Error invalid key: %s%n";
    public static final String ERROR_SIGNING = "Error signing: %s%n";
    public static final String ERROR_SIGNING_FILE = "Error signing file: %s%n";
    public static final String FILE_SIGNATURE = "Encrypted file signature: %s%n";
    public static final String FILE_AND_SIGNATURE_SENT = "Encrypted file and signature sent";
    public static final String KEY_STORE_ERROR = "Key store error: %s%n";
    public static final String CERTIFICATE_ERROR = "Certificate error: %s%n";
    public static final String BAD_ALGORITHM = "Bad algorithm: %s%n";
    public static final String FILE_READ_OR_WRITE_ERROR = "File read or write error: %s%n";
    public static final String ERROR_RETRIEVING_ENTRY = "Error retrieving entry: %s%n";
    public static final String ERROR_RETRIEVING_CERTIFICATE = "Error retrieving certificate: %s%n";
    public static final String ERROR_RETRIEVING_ALIAS_ATTRIBUTES = "Error retrieving alias attributes: %s%n";
    public static final String CANT_ACCESS_KEY_STORE = "Error: Can't access key store: %s%n";
    public static final String KEY_WRAPPED_FOR = "Key wrapped for %s%n";
}
