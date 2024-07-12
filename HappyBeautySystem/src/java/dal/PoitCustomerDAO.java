package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PoitCustomerDAO extends DBContext {

    // Method to check if a UserID exists
    public boolean checkUserIDExists(int userID) {
        String sql = "SELECT COUNT(*) FROM poitCustomer WHERE UserID = ?";
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
        String sql = "INSERT INTO poitCustomer (UserID, Ponit) VALUES (?, ?)";
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
        String sql = "UPDATE poitCustomer SET Ponit = Ponit + ? WHERE UserID = ?";
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
    
    public static void main(String[] args) {
        PoitCustomerDAO dap = new PoitCustomerDAO();
        dap.addOrUpdatePoitCustomer(4, 20);
    }
}
