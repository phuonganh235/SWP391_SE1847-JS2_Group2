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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

//ToanLV 
public class OrderDAO extends DBContext {

    // Insert
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

    // get order by userid and status
    public List<Order> getOrdersByUserIdAndStatus(int userId, int status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE UserId = ? AND Statuss = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, userId);
            pre.setInt(2, status);

            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderId"));
                    order.setUserId(rs.getInt("UserId"));
                    order.setPaymentId(rs.getInt("PaymentId"));
                    order.setOrderDate(rs.getString("OrderDate"));
                    order.setIsCancel(rs.getBoolean("IsCancel"));
                    order.setCustomerName(rs.getString("CustomerName"));
                    order.setCustomerAddress(rs.getString("CustomerAddress"));
                    order.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                    order.setStatuss(rs.getInt("Statuss"));

                    orders.add(order);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orders;
    }

    // get order by  status
    public List<Order> getOrdersByStatus(int status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE Statuss = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, status);

            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderId"));
                    order.setUserId(rs.getInt("UserId"));
                    order.setPaymentId(rs.getInt("PaymentId"));
                    order.setOrderDate(rs.getString("OrderDate"));
                    order.setIsCancel(rs.getBoolean("IsCancel"));
                    order.setCustomerName(rs.getString("CustomerName"));
                    order.setCustomerAddress(rs.getString("CustomerAddress"));
                    order.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                    order.setStatuss(rs.getInt("Statuss"));

                    orders.add(order);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orders;
    }

    // get order by order ID
    public List<Order> getOrdersByOrderID(int ID) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE OrderId = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, ID);

            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderId"));
                    order.setUserId(rs.getInt("UserId"));
                    order.setPaymentId(rs.getInt("PaymentId"));
                    order.setOrderDate(rs.getString("OrderDate"));
                    order.setIsCancel(rs.getBoolean("IsCancel"));
                    order.setCustomerName(rs.getString("CustomerName"));
                    order.setCustomerAddress(rs.getString("CustomerAddress"));
                    order.setCustomerPhoneNumber(rs.getString("CustomerPhoneNumber"));
                    order.setStatuss(rs.getInt("Statuss"));

                    orders.add(order);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orders;
    }

    //delete 
    public boolean deleteOrderAndDetails(int orderId) {
        String deleteOrderDetailSQL = "DELETE FROM OrderDetail WHERE OrderId = ?";
        String deleteOrderSQL = "DELETE FROM Orders WHERE OrderId = ?";
        boolean isDeleted = false;
        try {
            // Delete OrderDetail
            try (PreparedStatement preDeleteOrderDetail = connection.prepareStatement(deleteOrderDetailSQL)) {
                preDeleteOrderDetail.setInt(1, orderId);
                preDeleteOrderDetail.executeUpdate();
            }
            // Delete Orders
            try (PreparedStatement preDeleteOrder = connection.prepareStatement(deleteOrderSQL)) {
                preDeleteOrder.setInt(1, orderId);
                int rowsAffected = preDeleteOrder.executeUpdate();
                isDeleted = rowsAffected > 0; // Nếu có ít nhất một dòng bị ảnh hưởng, thì việc xóa thành công.
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isDeleted;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        boolean check = dao.deleteOrderAndDetails(8);

        System.out.println(check);
    }
}
