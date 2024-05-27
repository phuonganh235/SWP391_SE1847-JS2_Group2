package dal;

import model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//ToanLV
public class CartDAO extends DBContext {

    // Adds a new cart entry to the database
    public void addCart(Cart cart) {
        String sql = "INSERT INTO cart (ProductId, Quantity, UserId, CreateDate) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart.getProductId());
            st.setInt(2, cart.getQuantity());
            st.setInt(3, cart.getUserId());
            st.setString(4, cart.getCreateDate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Updates quantity 
    public void updateQuantity(int userId, int productId) {
        String sql = "UPDATE cart SET Quantity = Quantity+1 WHERE UserId = ? AND ProductId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get cart by userid and productid
    public Cart getCartByUserIdAndProductId(int userId, int productId) {
        String sql = "SELECT * FROM cart WHERE UserId = ? AND ProductId = ?";
        Cart cart = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Tạo đối tượng Cart từ dữ liệu trong ResultSet
                cart = new Cart(
                        rs.getInt("ProductId"),
                        rs.getInt("Quantity"),
                        rs.getInt("UserId"),
                        rs.getString("CreateDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cart;
    }

    // Retrieves all cart entries for a specific user by userId
    public List<Cart> getAllCartsByUserId(int userId) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE UserId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("CartId");
                int productId = rs.getInt("ProductId");
                int quantity = rs.getInt("Quantity");
                String createDate = rs.getString("CreateDate");

                // Tạo đối tượng Cart từ dữ liệu được truy vấn
                Cart cart = new Cart(cartId, productId, quantity, userId, createDate);
                carts.add(cart);
            }

            // Đóng ResultSet và PreparedStatement
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carts;
    }

    //Toanlv
    public void deleteCartsByUserId(int userId) {
        String sql = "DELETE FROM cart WHERE UserId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate(); // Thực thi câu lệnh DELETE

            // Đóng PreparedStatement
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Deletes a specific cart entry by productId and userId
    public void deleteCart(int productId, int userId) {
        String sql = "DELETE FROM cart WHERE ProductId = ? AND UserId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Updates the quantity of a specific product in the cart for a specific user
    public void updateQuantityChange(int userId, int productId, int quantity) {
        String sql = "UPDATE cart SET Quantity = ? WHERE UserId = ? AND ProductId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, userId);
            st.setInt(3, productId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //main method to test
    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        dao.deleteCartsByUserId(5);
    }
}
