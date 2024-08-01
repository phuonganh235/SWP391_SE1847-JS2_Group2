package controller.Authentication;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 *
 * @author admin
 */
public class PasswordUtil {
    public static String encodePassword(String password) {
        try {
            // Bước 1: Mã hóa bằng Base64
            String base64Encoded = Base64.getEncoder().encodeToString(password.getBytes());

            // Bước 2: Mã hóa bằng MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] mdBytes = md.digest(base64Encoded.getBytes());

            // Chuyển byte array thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : mdBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error encoding password", e);
        }
    }
}
