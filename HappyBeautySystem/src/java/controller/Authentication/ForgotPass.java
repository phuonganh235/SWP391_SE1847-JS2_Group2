package controller.Authentication;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;

@WebServlet(name="ForgotPass", urlPatterns={"/forgotpass"})
public class ForgotPass extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String fromEmail = "anhptphe170125@fpt.edu.vn";
        final String password = "eajp ikhz sqcw jxrc";
        String toEmail = request.getParameter("email");
        int otpvalue = 0;

        if (toEmail != null && !toEmail.isEmpty()) {
            try {
                Random random = new Random();
                otpvalue = 100000 + random.nextInt(900000);

                Properties pr = new Properties();
                pr.setProperty("mail.smtp.host", "smtp.gmail.com");
                pr.setProperty("mail.smtp.port", "587");
                pr.setProperty("mail.smtp.auth", "true");
                pr.setProperty("mail.smtp.starttls.enable", "true");

                Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                    protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new jakarta.mail.PasswordAuthentication(fromEmail, password);
                    }
                });
                Message mess = new MimeMessage(session);
                mess.setHeader("Content-type", "text/html; charset=UTF-8");
                mess.setFrom(new InternetAddress(fromEmail));
                mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
                mess.setSubject("Verify your password");
                mess.setText("Your OTP is: " + otpvalue);
                Transport.send(mess);

                request.setAttribute("message", "OTP is sent to your email id");
                HttpSession mySession = request.getSession();
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", toEmail);
                response.sendRedirect("validateotp");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "There was an error sending the email. Please try again.");
                request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Please enter a valid email address.");
            request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
