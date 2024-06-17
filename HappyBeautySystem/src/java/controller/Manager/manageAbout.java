
package controller.Manager;

import dal.AboutDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.About;

public class manageAbout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                AboutDAO dao = new AboutDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listall";
        }
        if (service.equals("listall")) {
            ArrayList<About> about = dao.getAllAbouts();
            request.setAttribute("about", about);
            request.getRequestDispatcher("/ViewAdmin/manageAbout.jsp").forward(request, response);
        }
        
        if (service.equals("add")) {
            String aboutIdStr = request.getParameter("aboutId");
            Integer aboutId = null;
            if (aboutIdStr != null && !aboutIdStr.trim().isEmpty()) {
                try {
                    aboutId = Integer.parseInt(aboutIdStr);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String aboutUrl = request.getParameter("imageURL");
            About about = new About(aboutId, title, content, aboutUrl);
            dao.addAbout(about);
            response.sendRedirect("manageabout");
        }
        
        if (service.equals("update")) {
            int aboutId = Integer.parseInt(request.getParameter("id"));
            About about = dao.getAboutById(aboutId);
            request.setAttribute("about", about);
            request.getRequestDispatcher("ViewAdmin/updateAbout.jsp").forward(request, response);
        }
        //Editing a about
        if (service.equals("edit")) {
            int aboutId = Integer.parseInt(request.getParameter("aboutId"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String aboutUrl = request.getParameter("imageURL");
            About about = new About(aboutId, title, content, aboutUrl);
            dao.updateAbout(about);
            response.sendRedirect("manageabout");
        }
        //Deleting a about
        if (service.equals("delete")) {
            int aboutId = Integer.parseInt(request.getParameter("id"));
            dao.deleteAbout(aboutId);
            response.sendRedirect("manageabout");
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
    }

}
