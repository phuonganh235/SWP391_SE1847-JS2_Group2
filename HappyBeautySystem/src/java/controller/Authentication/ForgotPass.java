package controller.Authentication;

import dal.UserDAO;
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

        if (toEmail != null && !toEmail.isEmpty()) {
            UserDAO userDAO = new UserDAO();
            if (userDAO.emailExistsInDatabase(toEmail)) {
                try {
                    Random random = new Random();
                    int otpvalue = 100000 + random.nextInt(900000);

                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");

                    Session session = Session.getInstance(props, new Authenticator() {
                        @Override
                        protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                            return new jakarta.mail.PasswordAuthentication(fromEmail, password);
                        }
                    });

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(fromEmail));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                    message.setSubject("Mật khẩu đặt lại OTP");
                    message.setText("Mã OTP để đặt lại mật khẩu của bạn là: " + otpvalue);

                    Transport.send(message);

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("otp", otpvalue);
                    httpSession.setAttribute("email", toEmail);
                    response.sendRedirect("validateotp");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Đã xảy ra lỗi khi gửi email. Vui lòng thử lại.");
                    request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Email này chưa được đăng ký trong hệ thống của chúng tôi.");
                request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Vui lòng nhập địa chỉ email hợp lệ.");
            request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "ForgotPass Servlet handles password reset requests";
    }
}