
package dal;

import model.InforOrderDetail;
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


public class InforOrderDetailDAO extends DBContext{
    public void insertInforOrderDetail(InforOrderDetail inforOrderDetail) {
    String sql = "INSERT INTO InforOrderDetail (orderID, city, district, ward, addressDetail, note, froms, tos) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try (PreparedStatement pre = connection.prepareStatement(sql)) {
        pre.setInt(1, inforOrderDetail.getOrderID());
        pre.setString(2, inforOrderDetail.getCity());
        pre.setString(3, inforOrderDetail.getDistrict());
        pre.setString(4, inforOrderDetail.getWard());
        pre.setString(5, inforOrderDetail.getAddressDetail());
        pre.setString(6, inforOrderDetail.getNote());
        pre.setString(7, inforOrderDetail.getFrom());
        pre.setString(8, inforOrderDetail.getTo());

        pre.executeUpdate();
    } catch (Exception ex) {
        Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}

}
