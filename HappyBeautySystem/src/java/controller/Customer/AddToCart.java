package controller.Customer;

import common.CommonDAO;
import dal.CartDAO;

import dal.ProductDAO;
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
import java.util.List;
import model.Cart;
import model.Product;
import model.ProductCart;
import model.User;

// ToanLV
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        ProductDAO daoProduct = new ProductDAO();
        CommonDAO commonDAO = new CommonDAO();
        CartDAO cart = new CartDAO();
        String service = request.getParameter("service");
        User inforUser = (User) session.getAttribute("inforUserLogin");
        try (PrintWriter out = response.getWriter()) {
            // Add to Cart
            if (inforUser == null) {
                response.sendRedirect("login");
            } else {
                if (service != null && service.equals("addToCart")) {
                    String idProduct = request.getParameter("id");
                    //chek login
                    if (idProduct == null || idProduct.isEmpty()) {
                        out.println("Invalid product ID");
                        return;
                    }

                    try {
                        int idInt = Integer.parseInt(idProduct);
                        int userId = inforUser.getUserId();

                        Cart checkCart = cart.getCartByUserIdAndProductId(userId, idInt);
                        if (checkCart == null) {
                            Product pro = daoProduct.getProductById(idInt);
                            if (pro == null) {
                                out.println("Product not found");
                                return;
                            }
                            String dateTimeNow = commonDAO.getDateTimeNow();
                            Cart newCartAdd = new Cart(pro.getProductId(), 1, userId, dateTimeNow);
                            cart.addCart(newCartAdd);
                        } else {
                            cart.updateQuantity(userId, idInt);
                        }
                        response.sendRedirect("AddToCart?service=showCart");
                        return;
                    } catch (NumberFormatException e) {
                        out.println("Invalid product ID format");
                        return;
                    }

                }
            }
            // Show all cart
            if (service.equals("showCart")) {
                //chek login
                int userId = inforUser.getUserId();
                List<Cart> listCart = cart.getAllCartsByUserId(userId);
                request.setAttribute("listCart", listCart);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/shop-cart.jsp");
                dispatcher.forward(request, response);

                return;
            }
            // Delete multi cart
            if (service.equals("deleteCart")) {
                //chek login
                String idProduct = request.getParameter("productId");
                String userId = request.getParameter("userId");
                String quantity = request.getParameter("quantity");
                int idInt = Integer.parseInt(idProduct);
                int userIdInt = Integer.parseInt(userId);
                cart.deleteCart(idInt, userIdInt);
                response.sendRedirect("AddToCart?service=showCart");

            }
//            if ("updateQuantity".equals(service)) {
//                int productId = Integer.parseInt(request.getParameter("productId"));
//                int userId = Integer.parseInt(request.getParameter("userId"));
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//
//                // Assuming 'cart' is an instance of your Cart class
//                cart.updateQuantityChange(userId, productId, quantity);
//
//                // Send empty response or any confirmation if needed
//                response.getWriter().print("Quantity updated successfully");
//            }
            if ("updateQuantity".equals(service)) {
                int cartId = Integer.parseInt(request.getParameter("cartId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Assuming you retrieve price from database or request attributes
                double price = Double.parseDouble(request.getParameter("price"));

                // Update quantity in the database
                CartDAO cartDAO = new CartDAO();
                cartDAO.updateQuantity(cartId, quantity);

                // Respond to the client (optional)
                response.getWriter().print("Quantity updated successfully");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
