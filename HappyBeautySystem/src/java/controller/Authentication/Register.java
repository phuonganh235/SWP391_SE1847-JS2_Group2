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

        if (!Pattern.matches(emailPattern, email)) {
            session.setAttribute("error", "Invalid email format!");
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

        if (!Pattern.matches(mobilePattern, mobile)) {
            session.setAttribute("error", "Invalid Vietnam mobile number!");
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

        if (!Pattern.matches(passwordPattern, password)) {
            session.setAttribute("error", "Password must be at least 8 characters long and include at least one letter, one number, and one special character.");
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();

        if (dao.getUserByUsername(username) != null) {
            session.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

        if (!dao.checkExistEmail(email)) {
            session.setAttribute("error", "Email already exists!");
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
            return;
        }

        User u = new User();
        u.setName(name);
        u.setUsername(username);
        u.setPassword(password);
        u.setMobile(mobile);
        u.setEmail(email);
        u.setAddress(address);
        u.setPostCode(postCode);
        u.setRoleId(2);
        String date = daoDate.getDateTimeNow();
        dao.register(name, username, password, mobile, email, address, postCode, date, 2 ,1,"");
        session.setAttribute("message", "Register successfully, please enter Username and Password to login.");
        response.sendRedirect("login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
