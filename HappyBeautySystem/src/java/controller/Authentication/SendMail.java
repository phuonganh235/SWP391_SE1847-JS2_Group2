package controller.Authentication;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
import model.User;

public class SendMail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        return String.format("%06d", number);
    }

    public boolean sendEmail(User u) {
        boolean test = false;

        String toEmail = u.getUsername();
        final String fromEmail = "anhptphe170125@fpt.edu.vn";
        final String password = "eajp ikhz sqcw jxrc";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            
            Session ses = Session.getInstance(pr, new Authenticator() {
               @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            
            Message mess = new MimeMessage(ses);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("User Email Verification");
//            mess.setText("Registered successfully.Please verify your account using this code: " + u.getCode());
            Transport.send(mess);
            test = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    void sendEmail(String email, String name) {

        String toEmail = email;
        final String fromEmail = "anhptphe170125@fpt.edu.vn";
        final String password = "eajp ikhz sqcw jxrc";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject(" Welcome to Happy Beauty WebPages!");
            String text = "Dear [" + name + "]\n"
                    + "Congratulations! You have successfully registered an account on Happy Beauty WebPages. Welcome to our community!";

            mess.setText(text);
            Transport.send(mess);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
