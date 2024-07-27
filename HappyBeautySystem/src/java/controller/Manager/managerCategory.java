package controller.Manager;

import dal.CategoryDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Category;

public class managerCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO dao = new CategoryDAO();
        UserDAO uDao = new UserDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (uDao.getRole(username, password) == 1 || uDao.getRole(username, password) == 4) {
            // Default service to "listall" if no service parameter is provided
            if (service == null) {
                service = "listall";
            }
            //Listing all Category 
            if (service.equals("listall")) {
                ArrayList<Category> cat = dao.getAllCategories();
                request.setAttribute("listCat", cat);
                request.getRequestDispatcher("ViewAdmin/manageCategory.jsp").forward(request, response);
            }
            //Adding a new category
            if (service.equals("add")) {
                String catIdStr = request.getParameter("categoryId");
                Integer categoryId = null;
                if (catIdStr != null && !catIdStr.trim().isEmpty()) {
                    try {
                        categoryId = Integer.parseInt(catIdStr);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
                String catName = request.getParameter("categoryName");
                String catImgUrl = request.getParameter("srcImg");
                boolean isActive = request.getParameter("isActive") != null;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String createDate = sdf.format(new Date());
                Category cat = new Category(categoryId, catName, catImgUrl, isActive, createDate);
                dao.addCategory(cat);
                response.sendRedirect("managercategory");
            }
            //Updating a category
            if (service.equals("update")) {
                int catId = Integer.parseInt(request.getParameter("id"));
                Category cat = dao.getCategoryById(catId);
                request.setAttribute("cat", cat);
                request.getRequestDispatcher("managercategory?service=listall").forward(request, response);
            }
            //Editing a category
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
            //Deleting a category
            if (service.equals("delete")) {
                int catId = Integer.parseInt(request.getParameter("id"));
                dao.updateCategoryActiveStatus(catId, false);
                response.sendRedirect("managercategory");
            }
            //Searching a category
            if (service.equals("search")) {
                String txt = request.getParameter("txt");
                ArrayList<Category> searchCat = dao.searchByName(txt);
                request.setAttribute("listCat", searchCat);
                request.getRequestDispatcher("ViewAdmin/manageCategory.jsp").forward(request, response);
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
