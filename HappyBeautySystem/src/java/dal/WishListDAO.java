package dal;

import model.WishList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phthh
 */
public class WishListDAO extends DBContext {

    // Adds a new WishList entry to the database
    public void addWishList(WishList wishList) {
        String sql = "INSERT INTO [Wishlist] (ProductId, UserId, CreateDate) VALUES (?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, wishList.getProductId());
            st.setInt(2, wishList.getUserId());
            st.setString(3, wishList.getCreateDate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get all wishlist by userID
    public List<WishList> getAllWishListByUserId(int userId) {
        List<WishList> wishList = new ArrayList<>();
        String sql = "WITH List AS (\n"
                + "    SELECT wl.WishlistId, p.ProductId, p.CategoryId, wl.CreateDate\n"
                + "    FROM Wishlist wl\n"
                + "    INNER JOIN Product p ON p.ProductId = wl.ProductId\n"
                + "    WHERE wl.UserId = ? AND p.isActive = 1\n"
                + ")\n"
                + "SELECT l.*\n"
                + "FROM List l\n"
                + "INNER JOIN Category c ON l.CategoryId = c.CategoryId\n"
                + "WHERE c.isActive = 1;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int wishListId = rs.getInt("WishlistId");
                int productId = rs.getInt("ProductId");
                String createDate = rs.getString("CreateDate");

                // Create a wishlist object from the queried data
                WishList WishList = new WishList(wishListId, productId, userId, createDate);
                wishList.add(WishList);
            }

            // Close ResultSet and PreparedStatement
            rs.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return wishList;
    }

    // Delete all wishlist by userID
    public void deleteWishListByUserId(int userId) {
        String sql = "DELETE FROM Wishlist WHERE UserId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.executeUpdate(); // execute DELETE sql
            // Close PreparedStatement
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Delete cart by productID and userID
    public void deleteWishListByProductIdAndUserId(int productId, int userId) {
        String sql = "DELETE FROM Wishlist WHERE ProductId = ? AND UserId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, userId);
            st.executeUpdate(); // execute DELETE sql
            // Close PreparedStatement
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Counts the number of reviews for a specific product ID in the Feedback table
    public int countFavouriteByProductId(int productId) {
        String sql = "SELECT COUNT(*) FROM Wishlist WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    //Test
    public static void main(String[] args) {
        WishListDAO dao = new WishListDAO();
//        dao.deleteWishListByProductIdAndUserId(1, 6);
        List<WishList> list = dao.getAllWishListByUserId(5);
        for (WishList product : list) {
            System.out.println(product);
        }
    }
}
