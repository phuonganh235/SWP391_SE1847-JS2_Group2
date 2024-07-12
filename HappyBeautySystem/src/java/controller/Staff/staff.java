package controller.Staff;

import dal.NewsDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.News;

/**
 *
 * @author admin
 */
@WebServlet(name = "Staff", urlPatterns = {"/staff"})
public class staff extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pr = response.getWriter();
            UserDAO uDao = new UserDAO();
            NewsDAO newsDAO = new NewsDAO();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");

            if (uDao.getRole(username, password) == 4) {
                ArrayList<News> newsList = newsDAO.viewAllNews();
                request.setAttribute("newsList", newsList);
                
                request.getRequestDispatcher("/ViewStaff/staffManagement.jsp").forward(request, response);
            }else{
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            e.printStackTrace();
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