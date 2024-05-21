
package controller.Manager;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;

public class managerCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO dao = new CategoryDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listall";
        }
        if (service.equals("listall")) {
            ArrayList<Category> cat = dao.getAllCategories();
            request.setAttribute("listCat", cat);
            request.getRequestDispatcher("ViewAdmin/manageCategory.jsp").forward(request, response);
        }
        if (service.equals("add")) {
            int catId = Integer.parseInt(request.getParameter("categoryId"));
            String catName = request.getParameter("categoryName");
            String catImgUrl = request.getParameter("categoryImageUrl");
            boolean isActive = request.getParameter("isActive") != null;
            String createDate = request.getParameter("createDate");
            Category cat = new Category(catId, catName, catImgUrl, isActive, createDate);
            dao.addCategory(cat);
            response.sendRedirect("managercategory");
        }
        if (service.equals("update")) {
            int catId = Integer.parseInt(request.getParameter("id"));
            Category cat = dao.getCategoryById(catId);
            request.setAttribute("cat", cat);
            request.getRequestDispatcher("ViewAdmin/updateCategory.jsp").forward(request, response);
        }
        if (service.equals("edit")) {
            int catId = Integer.parseInt(request.getParameter("categoryId"));
            String catName = request.getParameter("categoryName");
            String catImgUrl = request.getParameter("categoryImageUrl");
            boolean isActive = request.getParameter("isActive") != null;
            String createDate = request.getParameter("createDate");
            Category cat = new Category(catId, catName, catImgUrl, isActive, createDate);
            dao.updateCategory(cat);
            response.sendRedirect("managercategory");
        }
        if (service.equals("delete")) {
            int catId = Integer.parseInt(request.getParameter("id"));
            dao.deleteCategory(catId);
            response.sendRedirect("managercategory");
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
