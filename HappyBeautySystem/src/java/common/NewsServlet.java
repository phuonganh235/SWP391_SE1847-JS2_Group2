package common;

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

@WebServlet(name = "NewsServlet", urlPatterns = {"/news"})
public class NewsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        NewsDAO newsDAO = new NewsDAO();
        String service = request.getParameter("service");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (uDao.getRole(username) == 2 || uDao == null) {
            if (service == null || service.isEmpty()) {
                service = "viewAllNews";
            }

            if (service.equals("viewAllNews")) {
                ArrayList<News> newsList = newsDAO.viewAllNews();

                // Lọc ra các bài viết có isActive là true
                ArrayList<News> filteredNewsList = new ArrayList<>();
                for (News news : newsList) {
                    if (news.isIsActive()) {
                        filteredNewsList.add(news);
                    }
                }

                request.setAttribute("newsList", filteredNewsList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewUser/blog.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("login");
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
