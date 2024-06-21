package controller.Product;

import common.CommonDAO;
import dal.WishListDAO;

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
import model.WishList;
import model.Product;
//import model.ProductCart;
import model.User;

public class FavouriteList extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        ProductDAO daoProduct = new ProductDAO();
        CommonDAO commonDAO = new CommonDAO();
        WishListDAO wishlist = new WishListDAO();
        String service = request.getParameter("service");
        User inforUser = (User) session.getAttribute("inforUserLogin");
        try (PrintWriter out = response.getWriter()) {
            // Add to WishList
            if (inforUser == null) {
                response.sendRedirect("login");
            } else {
                if (service != null && service.equals("addWishList")) {
                    String idProduct = request.getParameter("id");
                    //chek login
                    if (idProduct == null || idProduct.isEmpty()) {
                        out.println("Invalid product ID");
                        return;
                    }
                    try {
                        int idInt = Integer.parseInt(idProduct);
                        int userId = inforUser.getUserId();
                        Product pro = daoProduct.getProductById(idInt);
                        if (pro == null) {
                            out.println("Product not found");
                            return;
                        }

                        // Retrieve the user's current wishlist
                        List<WishList> userWishlist = wishlist.getAllWishListByUserId(userId);

                        // Check if the product is already in the wishlist
                        boolean isProductInWishlist = false;
                        for (WishList wish : userWishlist) {
                            if (wish.getProductId() == pro.getProductId()) {
                                isProductInWishlist = true;
                                break;
                            }
                        }

                        // If the product is not in the wishlist, add it
                        if (!isProductInWishlist) {
                            String dateTimeNow = commonDAO.getDateTimeNow();
                            WishList newWishList = new WishList(pro.getProductId(), userId, dateTimeNow);
                            wishlist.addWishList(newWishList);
                        }
                        
                        response.sendRedirect("wishlist?service=showWishList");
                        return;
                    } catch (NumberFormatException e) {
                        out.println("Invalid product ID format");
                        return;
                    }
                }
            }
            // Show all wishlist
            if (service.equals("showWishList")) {
                // Chek login
                int userId = inforUser.getUserId();
                List<WishList> wishList = wishlist.getAllWishListByUserId(userId);
                request.setAttribute("wishList", wishList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/wishlist.jsp");
                dispatcher.forward(request, response);

                return;
            }
            // Delete all wishlist
            if (service.equals("deleteAllWishList")) {
                //chek login
                int userId = inforUser.getUserId();
//                String idProduct = request.getParameter("productId");
//                String userId = request.getParameter("userId");
//                int idInt = Integer.parseInt(idProduct);
//                int userIdInt = Integer.parseInt(userId);
                wishlist.deleteWishListByUserId(userId);
                response.sendRedirect("wishlist?service=showWishList");
            }
            // Delete wishlist by productId and userId
            if (service.equals("deleteWishList")) {
                //chek login
                String idProduct = request.getParameter("productId");
                String userId = request.getParameter("userId");
                int idInt = Integer.parseInt(idProduct);
                int userIdInt = Integer.parseInt(userId);
                wishlist.deleteWishListByProductIdAndUserId(idInt, userIdInt);
                response.sendRedirect("wishlist?service=showWishList");
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
