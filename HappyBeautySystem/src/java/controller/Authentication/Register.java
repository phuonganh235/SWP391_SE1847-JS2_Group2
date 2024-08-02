package controller.Authentication;

import common.CommonDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.regex.Pattern;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            request.getRequestDispatcher("ViewUser/register.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommonDAO daoDate = new CommonDAO();
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String postCode = request.getParameter("postCode");
        HttpSession session = request.getSession();

        String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";

        UserDAO dao = new UserDAO();
        boolean hasError = false;

        if (!Pattern.matches(emailPattern, email)) {
            request.setAttribute("emailError", "Invalid email format!");
            hasError = true;
        } else if (dao.checkExistEmail(email, 2)) {
            request.setAttribute("emailError", "Email đã tồn tại! Vui lòng sử dụng email khác.");
            hasError = true;
        }

        if (!Pattern.matches(mobilePattern, mobile)) {
            request.setAttribute("mobileError", "Số điện thoại di động Việt Nam không hợp lệ!");
            hasError = true;
        }

        if (!Pattern.matches(passwordPattern, password)) {
            request.setAttribute("passwordError", "Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.");
            hasError = true;
        }

        if (dao.getUserByUsername(username) != null) {
            request.setAttribute("usernameError", "Tên người dùng đã tồn tại!");
            hasError = true;
        }

        if (hasError) {
            // Set all form fields as attributes to preserve user input
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("mobile", mobile);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("postCode", postCode);

            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

           String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        
         User u = new User();
        u.setName(name);
        u.setUsername(username);
        u.setPassword(encodedPassword);
        u.setMobile(mobile);
        u.setEmail(email);
        u.setAddress(address);
        u.setPostCode(postCode);
        u.setRoleId(2);
        String date = daoDate.getDateTimeNow();
        
        dao.register(name, username, encodedPassword, mobile, email, address, postCode, date, 2, 1, "");
        session.setAttribute("message", "Register successfully, please enter Username and Password to login.");
        response.sendRedirect("login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
