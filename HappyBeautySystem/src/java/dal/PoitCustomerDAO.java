package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PoitCustomer;

public class PoitCustomerDAO extends DBContext {

    // Method to check if a UserID exists
    public boolean checkUserIDExists(int userID) {
        String sql = "SELECT COUNT(*) FROM PoitCustomer WHERE UserId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to add a new poitCustomer
    public boolean addPoitCustomer(int userID, int point) {
        String sql = "INSERT INTO PoitCustomer (UserId, Point) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, point);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to update point for an existing UserID
    public boolean updatePoitCustomer(int userID, int point) {
        String sql = "UPDATE PoitCustomer SET Point = Point + ? WHERE UserId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, point);
            st.setInt(2, userID);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to add or update poitCustomer
    public boolean addOrUpdatePoitCustomer(int userID, int point) {
        if (checkUserIDExists(userID)) {
            return updatePoitCustomer(userID, point);
        } else {
            return addPoitCustomer(userID, point);
        }
    }

    public int getCustomerPoints(int userId) {
        int points = 0;
        String sql = "SELECT Point FROM [dbo].[PoitCustomer] WHERE UserId = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                points = rs.getInt("Point");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return points;
    }

    public void subtractPoints(int userId, int points) {

        String sql = "UPDATE [dbo].[PoitCustomer] SET Point = Point - ? WHERE UserId = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, points);
            st.setInt(2, userId);
          st.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        PoitCustomerDAO dao = new PoitCustomerDAO();
       
        int userId = 16; 
      int point =  dao.getCustomerPoints(userId);
        System.out.println("poiint" + point);
       
    }
}
