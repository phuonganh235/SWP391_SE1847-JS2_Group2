package controller.Manager;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Category;
import model.Product;

public class manager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO dao = new ProductDAO();
        CategoryDAO daoC = new CategoryDAO();
        String service = request.getParameter("service");
        // Default service to "listall" if no service parameter is provided
        if (service == null) {
            service = "listall";
        }
        // Listing all products
        if (service.equals("listall")) {
            ArrayList<Product> product = dao.getAllProduct();
            request.setAttribute("listP", product);
            ArrayList<Category> cat = daoC.getAllCategories();
            request.setAttribute("listCat", cat);
            request.getRequestDispatcher("ViewAdmin/manageProduct.jsp").forward(request, response);
        }
        // Adding a new product
        if (service.equals("add")) {
            String productIdStr = request.getParameter("productId");
            Integer productId = null;
            if (productIdStr != null && !productIdStr.trim().isEmpty()) {
                try {
                    productId = Integer.parseInt(productIdStr);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            String productName = request.getParameter("productName");  
            String shortDes = request.getParameter("shortDes");
            String longDes = request.getParameter("longDes");
            String addDes = request.getParameter("addDes");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            String companyName = request.getParameter("companyName");
            int cateId = Integer.parseInt(request.getParameter("cateId"));
            int subCateId = Integer.parseInt(request.getParameter("subCateId"));
            int sold = Integer.parseInt(request.getParameter("sold"));
            boolean isCustomized = request.getParameter("isCustomized") != null;
            boolean isActive = request.getParameter("isActive") != null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createDate = sdf.format(new Date());
            String pathImage = request.getParameter("pathImage");
            Product product = new Product(productId, productName, shortDes, longDes, addDes, price, quantity,
                    size, color, companyName, cateId, subCateId, sold, isCustomized, isActive, createDate, pathImage);
            dao.addProduct(product);
            response.sendRedirect("manager");
        }
        //Updating a product
        if (service.equals("update")) {
            int productId = Integer.parseInt(request.getParameter("id"));
            Product p = dao.getProductById(productId);
            request.setAttribute("product", p);
            ArrayList<Category> cat = daoC.getAllCategories();
            request.setAttribute("listCat", cat);
            request.getRequestDispatcher("ViewAdmin/updateProduct.jsp").forward(request, response);
        }
        //Editing a product
        if (service.equals("edit")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String shortDes = request.getParameter("shortDes");
            String longDes = request.getParameter("longDes");
            String addDes = request.getParameter("addDes");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            String companyName = request.getParameter("companyName");
            int cateId = Integer.parseInt(request.getParameter("cateId"));
            int subCateId = Integer.parseInt(request.getParameter("subCateId"));
            int sold = Integer.parseInt(request.getParameter("sold"));
            boolean isCustomized = request.getParameter("isCustomized") != null;
            boolean isActive = request.getParameter("isActive") != null;
            String createDate = request.getParameter("createDate");
            String pathImage = request.getParameter("pathImage");
            Product product = new Product(productId, productName, shortDes, longDes, addDes, price, quantity,
                    size, color, companyName, cateId, subCateId, sold, isCustomized, isActive, createDate, pathImage);
            dao.updateProduct(product);
            response.sendRedirect("manager");
        }
        //Deleting a product
        if (service.equals("delete")) {
            int productId = Integer.parseInt(request.getParameter("id"));
            dao.deleteProduct(productId);
            response.sendRedirect("manager");
        }
        //Searching product by name
        if (service.equals("search")){
            String txt = request.getParameter("txt");
            ArrayList<Product> searchProduct = dao.searchProductByNameToManage(txt);
            request.setAttribute("listP", searchProduct);
            request.getRequestDispatcher("ViewAdmin/manageProduct.jsp").forward(request, response);
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
