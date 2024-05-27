package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//ToanLV
public class OrderDetailDAO extends DBContext {

    // Add new 
    public boolean addOrderDetail(int orderId, int productId, int quantity, float price) {
        String sql = "INSERT INTO OrderDetail (OrderId, ProductId, Quantity, Price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            statement.setInt(2, productId);
            statement.setInt(3, quantity);
            statement.setFloat(4, price);
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        boolean check = dao.addOrderDetail(3, 1, 3, 200);
        System.out.println(check);
    }
}
