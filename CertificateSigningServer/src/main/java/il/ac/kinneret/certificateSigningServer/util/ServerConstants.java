package il.ac.kinneret.certificateSigningServer.util;

/**
 * Useful Server string constants for the certificate signing tool.
 *
 * @author Michael J. May
 * @version 5785
 */
public class ServerConstants {
    public static final String PRIVATE_KEY_ALIAS = "privateAlias";
    public static final String IP = "ip";
    public static final String PORT = "port";
    public static final String TEMPFILE = "tempfile";
    public static final String OUTFILE = "outfile";
    public static final String LISTENING = "Listening";
    public static final String RECEIVED_CONNECTION_FROM = "Received connection from %s%n";
    public static final String ERROR_WRITING_ENCRYPTED_DATA_FILE = "Error writing encrypted data file: %s%n";
    public static final String ERROR_LISTENING_FOR_CONNECTION = "Error listening for connection: %s%n";
    public static final String RSA_SUITE = "RSA/ECB/OAEPWithSHA-256AndMGF1Padding";
    public static final String ERROR_UNWRAPPING_KEY = "Error unwrapping key: %s%n";
    public static final String UNWRAPPED_KEY = "Unwrapped key: %s%n";
    public static final String AES_SUITE = "AES/GCM/NoPadding";
    public static final String ERROR_INSTANTIATING_CIPHER = "Error instantiating cipher: %s%n";
    public static final String DECRYPTED_FILE_SUCCESSFULLY = "Decrypted file successfully";
    public static final String DECRYPTING_FILE_FAILED = "Decrypting file failed";
    public static final String ERROR_LISTENING = "Error listening: %s%n";
    public static final String STOPPED_LISTENING = "Stopped listening";
    public static final String KEY_STORE = "keystore";
    public static final String KEY_STORE_PASSWORD = "pwd";
    public static final String PUBLIC_KEY_ALIAS = "publicAlias";
    public static final String SERVER_USAGE = """
            Usage: CertificateSigningServer-5785 -ip=s -port=p -tempfile=t -outfile=f -keystore=k -pwd=password -privateAlias=privA -publicAlias=pubA
            ip and port for server listening
            tempfile where encrypted file is stored
            outfile where the decrypted file is stored
            password is the keystore password
            keystore must be of type PKCS12
            privateAlias is the alias for the private key in the keystore
            publicAlias is the alias for the public key in the keystore""";
    public static final String MISSING_PARAMETER = "Missing parameter";
    public static final String SIGNING_ALGORITHM = "SHA256withRSA";
    public static final String ERROR_RETRIEVING_ALIAS_TYPE = "Error retrieving alias type: %s%n";
    public static final String KEY_STORE_ERROR = "Key store error: %s%n";
    public static final String CERTIFICATE_ERROR = "Certificate error: %s%n";
    public static final String BAD_ALGORITHM = "Bad algorithm: %s%n";
    public static final String FILE_READ_OR_WRITE_ERROR = "File read or write error: %s%n";
    public static final String ERROR_RETRIEVING_ENTRY = "Error retrieving entry: %s%n";
    public static final String ERROR_RETRIEVING_CERTIFICATE = "Error retrieving certificate: %s%n";
    public static final String ERROR_RETRIEVING_ALIAS_ATTRIBUTES = "Error retrieving alias attributes: %s%n";
    public static final String CANT_ACCESS_KEY_STORE = "Error: Can't access key store: %s%n";
    public static final String ERROR_OPENING_KEY_STORE = "Error opening key store";
    public static final String ERROR_LOADING_PRIVATE_KEY_ENTRY_IS_NOT_A_PRIVATE_KEY_ENTRY = "Error loading private key entry. %s is not a private key entry%n";
    public static final String ERROR_LOADING_PUBLIC_KEY_CERTIFICATE = "Error loading public key certificate: %s%n";
    public static final String ERROR_SIGNATURE_INVALID = "Error: Signature invalid for subject %s%n";
    public static final String SIGNATURE_VALID = "Signature valid from subject %s%n";
    public static final String ERROR_UNKNOWN_SIGNING_ALGORITHM = "Error: Unknown signing algorithm: %s%n";
    public static final String ERROR_INVALID_KEY_PROVIDED = "Error: Invalid key provided: %s%n";
    public static final String ERROR_SIGNING = "Error signing: %s%n";
    public static final String ERROR_READING_FILE = "Error reading file: %s%n";
}
