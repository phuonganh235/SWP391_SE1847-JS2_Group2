package controller.Authentication;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        UserDAO dao = new UserDAO();
        String service = request.getParameter("service");
        if (service == null || service.isEmpty()) {
            request.getRequestDispatcher("/ViewUser/login.jsp").forward(request, response);
            return;
        }
        if (service.equals("login")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                request.getRequestDispatcher("/ViewUser/login.jsp").forward(request, response);
            } else {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                User u = dao.login(username, password);
                if (u != null) {
                    request.setAttribute("check", "success");
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("inforUserLogin", u);
                    response.sendRedirect("home");
                } else {// Handle incorrect login
                    request.setAttribute("check", "fail");
                    request.getRequestDispatcher("/ViewUser/login.jsp").forward(request, response);
                }
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
