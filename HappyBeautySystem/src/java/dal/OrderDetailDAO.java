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

    //Get Total Money by Month 
    public double getTotalMoneyByMonth(int month) {
        double totalMoney = 0;
        String sql = "SELECT SUM(od.Price * od.Quantity)\n"
                + "FROM [Orders] o INNER JOIN [OrderDetail] od ON o.OrderId = od.OrderId\n"
                + "WHERE MONTH(o.OrderDate) = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                totalMoney = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalMoney;
    }

    //Get total product
    public int getTotalProductByCategory(int categoryId) {
        int totalProduct = 0;
        String sql = " SELECT SUM(od.Quantity) \n"
                + " FROM OrderDetail od INNER JOIN Product p on od.ProductID = p.ProductId\n"
                + " INNER JOIN Category c on c.CategoryId = p.CategoryId\n"
                + " WHERE c.CategoryId = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, categoryId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                totalProduct = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalProduct;
    }

    //
    public double getTotalMoneyByDay(String date) {
        double totalMoney = 0;
        String sql = "SELECT SUM(od.Price * od.Quantity) "
                + "FROM Orders o INNER JOIN OrderDetail od ON o.OrderId = od.OrderId "
                + "WHERE CAST(o.OrderDate AS DATE) = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, date);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                totalMoney = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalMoney;
    }
    //Get total money by week
    public double getTotalMoneyByWeek(int week, int year) {
        double totalMoney = 0;
        String sql = "SELECT SUM(od.Price * od.Quantity) "
                + "FROM [Orders] o INNER JOIN [OrderDetail] od ON o.OrderId = od.OrderId "
                + "WHERE DATEPART(week, o.OrderDate) = ? AND DATEPART(year, o.OrderDate) = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, week);
            pre.setInt(2, year);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                totalMoney = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalMoney;
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
//        List<OrderDetail> lis = dao.getOrderDetailsByOrderId(2003);
//        for (OrderDetail li : lis) {
//            System.out.println(li.getQuantity());
//        }
        double totalMoneyByWeek = dao.getTotalMoneyByWeek(26, 2024);
        System.out.println("Total money by week: " + totalMoneyByWeek);
        
    }
}
