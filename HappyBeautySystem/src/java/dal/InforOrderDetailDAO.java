package dal;

import model.InforOrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InforOrderDetailDAO extends DBContext {

    public void insertInforOrderDetail(InforOrderDetail inforOrderDetail) {
        String sql = "INSERT INTO InforOrderDetail (orderID, city, district, ward, addressDetail, note, froms, tos, dateOrder) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, inforOrderDetail.getOrderID());
            pre.setString(2, inforOrderDetail.getCity());
            pre.setString(3, inforOrderDetail.getDistrict());
            pre.setString(4, inforOrderDetail.getWard());
            pre.setString(5, inforOrderDetail.getAddressDetail());
            pre.setString(6, inforOrderDetail.getNote());
            pre.setString(7, inforOrderDetail.getFrom());
            pre.setString(8, inforOrderDetail.getTo());
            pre.setString(9, inforOrderDetail.getDateOrder());

            pre.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(InforOrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public InforOrderDetail getInforOrderDetailByOrderId(int orderId) {
        InforOrderDetail inforOrderDetail = null;
        String sql = "SELECT orderID, city, district, ward, addressDetail, note, froms, tos, dateOrder FROM InforOrderDetail WHERE orderID = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, orderId);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    inforOrderDetail = new InforOrderDetail();
                    inforOrderDetail.setOrderID(rs.getInt("orderID"));
                    inforOrderDetail.setCity(rs.getString("city"));
                    inforOrderDetail.setDistrict(rs.getString("district"));
                    inforOrderDetail.setWard(rs.getString("ward"));
                    inforOrderDetail.setAddressDetail(rs.getString("addressDetail"));
                    inforOrderDetail.setNote(rs.getString("note"));
                    inforOrderDetail.setFrom(rs.getString("froms"));
                    inforOrderDetail.setTo(rs.getString("tos"));
                    inforOrderDetail.setDateOrder(rs.getString("dateOrder"));
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(InforOrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inforOrderDetail;
    }
}
