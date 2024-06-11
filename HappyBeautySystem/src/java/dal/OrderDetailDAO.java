package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import java.sql.*;
import java.util.ArrayList;

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

    //GetList
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT OrderId, ProductId, Quantity, Price FROM OrderDetail WHERE OrderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int productId = resultSet.getInt("ProductId");
                    int quantity = resultSet.getInt("Quantity");
                    float price = resultSet.getFloat("Price");
                    OrderDetail orderDetail = new OrderDetail(orderId, productId, quantity, price);
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    //Get order 
    public OrderDetail getOrderDetailByOrderIdAndProductId(int orderId, int productId) {
        OrderDetail orderDetail = null;
        String sql = "SELECT OrderId, ProductId, Quantity, Price FROM OrderDetail WHERE OrderId = ? AND ProductId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            statement.setInt(2, productId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int quantity = resultSet.getInt("Quantity");
                    float price = resultSet.getFloat("Price");
                    orderDetail = new OrderDetail(orderId, productId, quantity, price);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetail;
    }
    // delete for orderID
    public boolean deleteOrderDetailsByOrderId(int orderId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM OrderDetail WHERE OrderId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    //
    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> lis = dao.getOrderDetailsByOrderId(2003);
        for (OrderDetail li : lis) {
            System.out.println(li.getQuantity());
        }
    }
}
