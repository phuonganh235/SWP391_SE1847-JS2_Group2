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

@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {
// ID USER IN SESSION

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        ProductDAO daoProduct = new ProductDAO();
        CommonDAO commonDAO = new CommonDAO();
        CartDAO cart = new CartDAO();
        String service = request.getParameter("service");
        User inforUser = (User) session.getAttribute("inforUser");
        try (PrintWriter out = response.getWriter()) {
            if (service != null && service.equals("addToCart")) {
                String idProduct = request.getParameter("id");
                if (idProduct == null || idProduct.isEmpty()) {
                    out.println("Invalid product ID");
                    return;
                }

                try {
                    int idInt = Integer.parseInt(idProduct);
                    int userId = 4;  // Thay giá trị này khi có thông tin người dùng

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

            if (service.equals("showCart")) {
                int userId = 4;  // Thay giá trị này khi có thông tin người dùng
                List<Cart> listCart = cart.getAllCartsByUserId(userId);
                request.setAttribute("listCart", listCart);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/shop-cart.jsp");
                dispatcher.forward(request, response);
                return;
            }
            if (service.equals("deleteCart")) {
                String idProduct = request.getParameter("productId");
                String userId = request.getParameter("userId");
                int idInt = Integer.parseInt(idProduct);
                int userIdInt = Integer.parseInt(userId);
                // String userID = ...
                cart.deleteCart(idInt, userIdInt);
                response.sendRedirect("AddToCart?service=showCart");
            }
            if (service.equals("updateQuantity")) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Gọi hàm cập nhật số lượng sản phẩm trong giỏ hàng từ DAO
                cart.updateQuantityChange(userId, productId, quantity);

                response.getWriter().print("");
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
