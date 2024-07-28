/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author phuan
 */
public class EmailUtility {

    public static void sendEmail(String recipientEmail, String subject, String message) throws Exception {

        final String username = "anhptphe170125@fpt.edu.vn";
        final String appPassword = "eajp ikhz sqcw jxrc";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, appPassword);
            }
        });

        try {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            mimeMessage.setSubject(username);
            mimeMessage.setContent(message, "text/plain; charset=UTF-8");
            mimeMessage.setHeader("Subject", subject);
            mimeMessage.setHeader("Content-Type", "text/plain; charset=UTF-8");

            Transport.send(mimeMessage);
            System.err.println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
