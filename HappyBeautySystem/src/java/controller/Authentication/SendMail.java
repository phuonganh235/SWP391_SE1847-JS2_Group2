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
            mess.setText("Registered successfully.Please verify your account using this code: ");
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
                    + "Congratulations! You have successfully registered an account on Happy Beauty WebPages. Welcome to our community!"
                    + "\n" + "We are excited to have you on board and provide you with opportunities to explore and apply for various job positions. With our user-friendly platform and extensive job listings, we aim to make your job search journey efficient and rewarding.\n"
                    + "Here are some key features you can access with your new account:\n"
                    + "- Explore a wide range of job listings tailored to your preferences.\n"
                    + "- Save and track your favorite job postings.\n"
                    + "- Receive personalized job recommendations based on your profile.\n"
                    + "- Connect with recruiters and potential employers.\n" + "If you have any questions or need assistance, feel free to reach out to our support team at [support email].\n"
                    + "Once again, welcome to JobSearching WebPages! We wish you success in your job search journey.\n"
                    + "Best regards,\n" + "ITJob.";

            mess.setText(text);
            Transport.send(mess);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
