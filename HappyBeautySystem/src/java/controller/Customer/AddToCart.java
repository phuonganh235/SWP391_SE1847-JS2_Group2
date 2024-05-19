package controller.Customer;

import dal.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import model.ProductCart;

@WebServlet(name="AddToCart", urlPatterns={"/AddToCart"})
public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        DAOProduct daoProduct = new DAOProduct();
        String service = request.getParameter("service");
        try (PrintWriter out = response.getWriter()) {
//            if(!service.isEmpty()){
//            response.sendRedirect("ViewUser/shop-cart.jsp");
//            }
            if (service.equals("addToCart")) {
                String id = request.getParameter("id");
                ProductCart proCart = (ProductCart) session.getAttribute("cart_" + id);
                if (proCart == null) {
                    ArrayList<Product> arrProduct = daoProduct.getProductsByQuery("select * from Product where ProductId=" + Integer.parseInt(id));
                    if (arrProduct.isEmpty()) {
                        out.println("Product not found");
                        return;
                    }
                    Product pro = arrProduct.get(0);
                    proCart = new ProductCart();
                    proCart.setProduct_id(pro.getProductId());
                    proCart.setProduct_name(pro.getProductName());
                    proCart.setPrice(pro.getPrice());
                    proCart.setQuantity(1);
                    session.setAttribute("cart_" + id, proCart);
                } else {
                    proCart.setQuantity(proCart.getQuantity() + 1);
                    session.setAttribute("cart_" + id, proCart);
                }
                response.sendRedirect("ViewUser/shop-cart.jsp");  
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
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
