package il.ac.kinneret.certificateSigningServer.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Utility methods for the Certificate Signing file server tool.
 * @author Michael J. May
 * @version 5785
 */
public class Utils {
    /**
     * Parses command line arguments to the program.  Looks for parameters in the format
     * -field=value
     *
     * @param args The parameters provided to be parsed
     * @return The parsed parameters in a Map
     */
    public static Map<String, String> parseArguments(String[] args) {

        HashMap<String, String> properties = new HashMap<>();
        for (String part : args) {
            try {
                // parse this by =
                String[] parts = part.split("=");
                // put the part after the - in the key value
                properties.put(parts[0].substring(parts[0].indexOf("-") + 1), parts[1]);
            } catch (ArrayIndexOutOfBoundsException | NullPointerException e) {
                throw new IllegalArgumentException("Parameter provided is not in the correct format: " + part);
            }
        }
        return properties;
    }
}