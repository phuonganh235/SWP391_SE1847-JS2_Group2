package controller.Staff;

import dal.NewsDAO;
import model.News;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp; // Import java.sql.Timestamp
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddNews", urlPatterns = {"/addnews"})
public class AddNews extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        NewsDAO newsDAO = new NewsDAO();
        String service = request.getParameter("service");

        if (service == null) {
            request.getRequestDispatcher("/ViewStaff/addNews.jsp").forward(request, response);
            return;
        }

        if (service.equals("addnews")) {
            String submit = request.getParameter("submit");
            if (submit == null) { // Hiển thị form thêm tin tức
                ResultSet rsCate = newsDAO.getData("SELECT * FROM Category");
                request.setAttribute("rsCate", rsCate);
                request.getRequestDispatcher("/ViewStaff/addNews.jsp").forward(request, response);
            } else { // Xử lý khi người dùng submit form
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String imgUrl = request.getParameter("ImageURL");
                int categoryID = Integer.parseInt(request.getParameter("CategoryID"));

                Timestamp createTime = new Timestamp(System.currentTimeMillis());

                News news = new News(0, title, content, createTime, imgUrl, false, true, null, categoryID);

                boolean result = newsDAO.addNews(news);
                if (result) {
                    request.setAttribute("message", "News added successfully!");
                } else {
                    request.setAttribute("message", "Failed to add news.");
                }
                response.sendRedirect("home"); 
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
        return "Servlet to handle adding news";
    }
}
