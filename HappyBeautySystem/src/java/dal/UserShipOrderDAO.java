package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
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
    
    public static void main(String[] args) {
        
    }
}
