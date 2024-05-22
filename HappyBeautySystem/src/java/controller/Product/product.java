/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Product;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author phthh
 */
public class product extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet product at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        ProductDAO d = new ProductDAO();
        if (action.equals("")) {
            ArrayList<Product> productList = d.getAllProduct();
            request.setAttribute("productList", productList);
        
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }
        if (action.equalsIgnoreCase("productdetail")) {
            String product_id = request.getParameter("product_id");
            int productId = Integer.parseInt(product_id);
            ProductDAO c = new ProductDAO();
            Product product = c.getProductById(productId);
            request.setAttribute("ProductData", product);
            request.getRequestDispatcher("/ViewUser/product-details.jsp").forward(request, response);
        }
        
        if(action.equalsIgnoreCase("search")){
            String text = request.getParameter("text");
            ArrayList<Product> productList = d.searchProductByCategory(text);
//            ArrayList<Category> category = d.getCategory();
//            int page, numperpage = 9;
//            int size = productList.size();
//            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
//            String xpage = request.getParameter("page");
//            if (xpage == null) {
//                page = 1;
//            } else {
//                page = Integer.parseInt(xpage);
//            }
//            int start, end;
//            start = (page - 1) * numperpage;
//            end = Math.min(page * numperpage, size);
//            List<Entity.Product> product = d.getListByPage(productList, start, end);
//            request.setAttribute("page", page);
//            request.setAttribute("num", num);
//            request.setAttribute("CategoryData", category);
//            request.setAttribute("ProductData", product);
            request.setAttribute("ProductData", productList);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
//        response.sendRedirect("/ViewUser/shop.jsp");
    }
 

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
