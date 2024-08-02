package controller.Authentication;

import dal.PoitCustomerDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
        PoitCustomerDAO pointDao = new PoitCustomerDAO();
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
                     int points = pointDao.getCustomerPoints(u.getUserId());
                    request.setAttribute("check", "success");
                    
                    session.setAttribute("Point", points);
                    
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("inforUserLogin", u);
                    
                    String remember = request.getParameter("remember-me");
                    if ("on".equals(remember)) {
                        Cookie userCookie = new Cookie("username", username);
                        Cookie passCookie = new Cookie("password", password);
                        userCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
                        passCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
                        response.addCookie(userCookie);
                        response.addCookie(passCookie);
                    } else {
                        Cookie userCookie = new Cookie("username", "");
                        Cookie passCookie = new Cookie("password", "");
                        userCookie.setMaxAge(0);
                        passCookie.setMaxAge(0);
                        response.addCookie(userCookie);
                        response.addCookie(passCookie);
                    }
                    
                    response.sendRedirect("home");
                    session.setAttribute("inforUser", u);
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
