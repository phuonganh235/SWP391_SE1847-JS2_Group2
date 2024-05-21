package controller.Authentication;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import model.User;

public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            request.getRequestDispatcher("ViewUser/register.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String postCode = request.getParameter("postCode");
        String roleId = request.getParameter("roleId");
        UserDAO dao = new UserDAO();

        if (dao.getUserByUsername(username) != null || dao.checkExistEmail(email) == false) {
            HttpSession session = request.getSession();
            String err = "Username or Email has already exists!";
            session.setAttribute("error", err);
            request.getRequestDispatcher("/ViewUser/register.jsp").forward(request, response);
        } else {
            User u = new User();
            u.setName(name);
            u.setUsername(username);
            u.setPassword(password);
            u.setMobile(mobile);
            u.setEmail(email);
            u.setAddress(address);
            u.setPostCode(postCode);
            u.setRoleId(2);

            java.util.Date today = new Date();
            dao.register(name, username, password, mobile, email, address, postCode, new java.sql.Date(today.getTime()), 2);
            String message = "Register successfully, please enter Username and Password to login.";
            HttpSession session = request.getSession();
            session.setAttribute("message", message);
            response.sendRedirect("login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
