/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Product;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author phthh
 */
public class product extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        ProductDAO d = new ProductDAO();
        CategoryDAO c = new CategoryDAO();
        if (action.equals("")) {
            ArrayList<Product> productList = d.getAllProduct();
            ArrayList<Category> categoryList = c.getAllCategories();
//          Pagination
            int page = 0, numperpage = 9;
            int size = productList.size();
            // Number of pages needed for each page with 9 product sections
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            // Index of the first product on the page 
            start = (page - 1) * numperpage;
            // The end index cannot exceed the number of products
            end = Math.min(page * numperpage, size);
            ArrayList<Product> productByPage = d.getListByPage(productList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("productList", productByPage);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("listByCategory")) {
            String category_id = request.getParameter("category_id");
            int category_id1 = Integer.parseInt(category_id);
            ArrayList<Product> productList = d.getProductByCategory(category_id1);
            ArrayList<Category> category = c.getAllCategories();
            int page = 0, numperpage = 9;
            int size = productList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            ArrayList<Product> product = d.getListByPage(productList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("categoryList", category);
            request.setAttribute("productList", product);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("productdetail")) {
            String product_id = request.getParameter("product_id");

            int productId = Integer.parseInt(product_id);
            int product_category = Integer.parseInt(request.getParameter("product_category"));
            CategoryDAO dao = new CategoryDAO();
            int countReview = d.countReview(productId);

//            Retrieve products by id
            Product product = d.getProductById(productId);

//            Get products with the same category: To get common products
            ArrayList<Product> productByCategory = d.getProductByCategory(product_category);

//           To retrieve the product category
            Category cat = dao.getCategoryById(product_category);
            request.setAttribute("Category", cat);

            request.setAttribute("ProductData", product);
            request.setAttribute("countReview", countReview);
            request.setAttribute("ProductCategory", productByCategory);
            request.setAttribute("Category", cat);
            request.getRequestDispatcher("/ViewUser/product-details.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO d = new ProductDAO();
        CategoryDAO c = new CategoryDAO();
        String service = request.getParameter("service") == null ? "" : request.getParameter("service");
        if (service.equalsIgnoreCase("search")) {
            String text = request.getParameter("text");
            ArrayList<Product> productList = d.searchProductByName(text);
            request.setAttribute("productList", productList);

            ArrayList<Category> category = c.getAllCategories();
//            Pagination
            int page = 0, numperpage = 9;
            int size = productList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//number of page
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            ArrayList<Product> productByPage = d.getListByPage(productList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("categoryList", category);
            request.setAttribute("productList", productByPage);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        //Search products by price
        if (service.equalsIgnoreCase("searchPrice")) {
            String fromPrice = request.getParameter("fromPrice");
            String toPrice = request.getParameter("toPrice");
            ArrayList<Category> category = c.getAllCategories();

            Double from, to;
            try {
                from = (fromPrice == null || fromPrice.equals("")) ? null : Double.parseDouble(fromPrice);
                to = (toPrice == null || toPrice.equals("")) ? null : Double.parseDouble(toPrice);
                ArrayList<Product> listP = d.search(from, to);
                //            Pagination
                int page = 0, numperpage = 9;
                int size = listP.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//number of page
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> productByPage = d.getListByPage(listP, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", productByPage);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
