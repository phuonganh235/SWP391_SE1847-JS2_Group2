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
            if (service != null && service.equals("addToCart")) {
                String idProduct = request.getParameter("id");
                //chek login
                if (inforUser == null) {
                    response.sendRedirect("login");
                } else {
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
                if (inforUser == null) {
                    response.sendRedirect("login");
                } else {
                    int userId = inforUser.getUserId();
                    List<Cart> listCart = cart.getAllCartsByUserId(userId);
                    request.setAttribute("listCart", listCart);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/shop-cart.jsp");
                    dispatcher.forward(request, response);
                }
                return;
            }
            // Delete multi cart
            if (service.equals("deleteCart")) {
                //chek login
                if (inforUser == null) {
                    response.sendRedirect("login");
                } else {
                    String idProduct = request.getParameter("productId");
                    int idProductInt = Integer.parseInt(idProduct);
                    String userId = request.getParameter("userId");
                    String quantity = request.getParameter("quantity");
                    int quantityInt = Integer.parseInt(quantity);
                    //
                    daoProduct.updateProductQuantityPlus(idProductInt, quantityInt);
                    //
                    int idInt = Integer.parseInt(idProduct);
                    int userIdInt = Integer.parseInt(userId);
                    cart.deleteCart(idInt, userIdInt);
                    response.sendRedirect("AddToCart?service=showCart");
                }
            }
            // Update quantity
            if (service.equals("updateQuantity")) {
                //chek login
                if (inforUser == null) {
                    response.sendRedirect("login");
                } else {
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    int userId = Integer.parseInt(request.getParameter("userId"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    cart.updateQuantityChange(userId, productId, quantity);

                    response.getWriter().print("");
                }
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
