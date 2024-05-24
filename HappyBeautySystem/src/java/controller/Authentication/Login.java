package controller.Authentication;

import dal.DAOProduct;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import model.ProductCart;
import model.User;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        String service = request.getParameter("service");
        if (service == null) {
            request.getRequestDispatcher("ViewUser/login.jsp").forward(request, response);
        }
        if (service.equals("login")) {
            User u = dao.login(username, password);
            if (u != null) {
                request.setAttribute("check", "success");
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                session.setAttribute("inforUser", u);
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                request.setAttribute("check", "fail");
                request.getRequestDispatcher("/ViewUser/login.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
