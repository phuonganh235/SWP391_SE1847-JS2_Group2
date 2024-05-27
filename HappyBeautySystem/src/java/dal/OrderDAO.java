package dal;

import java.beans.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.Product;
import java.sql.ResultSet;
import model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO extends DBContext {

    public int insertOrderGetID(Order order) {
        int orderId = 0;
        String sql = "INSERT INTO Orders (UserId, PaymentId, OrderDate, IsCancel, CustomerName, CustomerAddress, CustomerPhoneNumber, Statuss) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pre = connection.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
            pre.setInt(1, order.getUserId());
            pre.setInt(2, order.getPaymentId());
            pre.setString(3, order.getOrderDate());
            pre.setBoolean(4, order.isIsCancel());
            pre.setString(5, order.getCustomerName());
            pre.setString(6, order.getCustomerAddress());
            pre.setString(7, order.getCustomerPhoneNumber());
            pre.setInt(8, order.getStatuss());

            int n = pre.executeUpdate();
            if (n > 0) {
                try (ResultSet resultSet = pre.getGeneratedKeys()) {
                    if (resultSet.next()) {
                        orderId = resultSet.getInt(1);
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderId;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        Order order = new Order(5, 1, "2024-10-10", true, "ToanLEE", "HaNoi", "0355725201", 1);
        int a = dao.insertOrderGetID(order);
        System.out.println(a);
    }
}
