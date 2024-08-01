/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.PointConfig;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PointConfigDAO extends DBContext {

    public ArrayList<PointConfig> getPointConfig() {
        ArrayList<PointConfig> list = new ArrayList<>();
        String sql = "SELECT * FROM PointConfig ";
        PointConfig config = null;

        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                config = new PointConfig();
                config.setId(rs.getInt("id"));
                config.setIsEnabled(rs.getBoolean("isEnabled"));
                config.setPointsPerAmount(rs.getInt("pointsPerAmount"));
                config.setPointsEarned(rs.getInt("pointsEarned"));
                config.setPointsRedeemed(rs.getInt("pointsRedeemed"));
                config.setRedeemValue(rs.getInt("redeemValue"));
               
                list.add(config);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PointConfigDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public PointConfig getConfigById(int id) {
        PointConfig config = null;
        try {
            String query = "SELECT * FROM PointConfig where id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                config = new PointConfig();
                config.setId(rs.getInt("id"));
                config.setIsEnabled(rs.getBoolean("isEnabled"));
                config.setPointsPerAmount(rs.getInt("pointsPerAmount"));
                config.setPointsEarned(rs.getInt("pointsEarned"));
                config.setPointsRedeemed(rs.getInt("pointsRedeemed"));
                config.setRedeemValue(rs.getInt("redeemValue"));
 
                return config;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int update(PointConfig config) {
        int n = 0;
        String sql = "UPDATE PointConfig SET isEnabled = ?, pointsPerAmount = ?, "
                + "pointsEarned = ?, pointsRedeemed = ?, redeemValue = ? WHERE id = ?";

        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setBoolean(1, config.isIsEnabled());
            pre.setInt(2, config.getPointsPerAmount());
            pre.setInt(3, config.getPointsEarned());
            pre.setInt(4, config.getPointsRedeemed());
            pre.setInt(5, config.getRedeemValue());
            pre.setInt(6, config.getId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PointConfigDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }
public static void main(String[] args) {
        // Tạo một đối tượng PointConfigDAO
        PointConfigDAO dao = new PointConfigDAO();

        // Tạo một đối tượng PointConfig mẫu để cập nhật
        PointConfig config = new PointConfig();
        config.setId(1); // Giả sử ID của bản ghi cần cập nhật là 1
        config.setIsEnabled(true);
        config.setPointsPerAmount(100);
        config.setPointsEarned(1);
        config.setPointsRedeemed(10);
        config.setRedeemValue(1000);
      

        // Gọi phương thức update
        int result = dao.update(config);

        // Kiểm tra kết quả
        if (result > 0) {
            System.out.println("Cập nhật thành công! Số bản ghi đã cập nhật: " + result);
        } else {
            System.out.println("Cập nhật thất bại!");
        }

        // Kiểm tra lại dữ liệu sau khi cập nhật
        PointConfig updatedConfig = dao.getConfigById(1);
        if (updatedConfig != null) {
            System.out.println("Dữ liệu sau khi cập nhật:");
            System.out.println("ID: " + updatedConfig.getId());
            System.out.println("Enabled: " + updatedConfig.isIsEnabled());
            System.out.println("Points Per Amount: " + updatedConfig.getPointsPerAmount());
            System.out.println("Points Earned: " + updatedConfig.getPointsEarned());
            System.out.println("Points Redeemed: " + updatedConfig.getPointsRedeemed());
            System.out.println("Redeem Value: " + updatedConfig.getRedeemValue());
       
        } else {
            System.out.println("Không tìm thấy bản ghi sau khi cập nhật!");
        }
    }


}
