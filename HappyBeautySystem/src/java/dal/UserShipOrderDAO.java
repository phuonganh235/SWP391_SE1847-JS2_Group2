package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;
//Toan LV code

public class UserShipOrderDAO extends DBContext {

    // Add new 
    public boolean addUserShipOrder(int orderID, int userID, String date, int staffID) {
        String sql = "insert into User_Ship_Order (OrderId, UserId, DateShip, StaffId) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            statement.setInt(2, userID);
            statement.setString(3, date);
            statement.setInt(4, staffID);
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get list of orderIDs by userID
    public ArrayList<Integer> getOrderIDsByUserID(int userID) {
        ArrayList<Integer> orderIDs = new ArrayList<>();
        String sql = "SELECT OrderId FROM User_Ship_Order WHERE UserId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                orderIDs.add(rs.getInt("OrderId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderIDs;
    }

    public static void main(String[] args) {

    }
}
