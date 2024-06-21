package controller.Staff;

import dal.NewsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.News;

/**
 *
 * @author admin
 */
@WebServlet(name="HideNews", urlPatterns={"/hidenews"})
public class HideNews extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    NewsDAO newsDAO = new NewsDAO();
    String service = request.getParameter("service");

    if (service == null) {
        response.sendRedirect("home");
        return;
    }
    if (service.equals("hideNews")) {
        int newsID = Integer.parseInt(request.getParameter("newsID"));
        newsDAO.hideNews(newsID); // Perform the hide operation in DAO
        // Update isActive to 0 in the displayed newsList
        List<News> newsList = newsDAO.viewAllNews(); // Example method to get all news
        for (News news : newsList) {
            if (news.getNewsId() == newsID) {
                news.setIsActive(false);
                break;
            }
        }
        response.sendRedirect("home");
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
