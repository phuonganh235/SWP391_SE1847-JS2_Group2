/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Coupons;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phuan
 */
public class CouponsDAO extends DBContext {

    public ArrayList<Coupons> getAllCoupons() {
        ArrayList<Coupons> couponList = new ArrayList<>();
        String sql = "SELECT * FROM Coupons";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Coupons coupon = new Coupons();
                coupon.setCouponsId(rs.getInt("CouponId"));
                coupon.setCode(rs.getString("CouponCode"));
                coupon.setDescription(rs.getString("Description"));
                coupon.setDiscountAmount(rs.getDouble("DiscountAmount"));
                coupon.setStartDate(rs.getString("StartDate"));
                coupon.setEndDate(rs.getString("EndDate"));
                coupon.setQuantity(rs.getInt("Quantity"));
                coupon.setIsActive(rs.getInt("IsActive"));
                couponList.add(coupon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return couponList;
    }

    public int getTotalCoupon() {
        String sql = "select count(*) from Coupons";
        int n = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int insertCoupons(Coupons coupon) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Coupons] ([CouponCode],[Description],[DiscountAmount],[StartDate],[EndDate],[Quantity] ,[IsActive]) VALUES(?,?,?,?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, coupon.getCode());
            pre.setString(2, coupon.getDescription());
            pre.setDouble(3, coupon.getDiscountAmount());
            pre.setString(4, coupon.getStartDate());
            pre.setString(5, coupon.getEndDate());
            pre.setInt(6, coupon.getQuantity());
            pre.setInt(7, coupon.getIsActive());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int updateCoupon(Coupons coupon) {
        int n = 0;
        String sql = "UPDATE [dbo].[Coupons]"
                + " SET [CouponCode] = ?,"
                + "     [Description] = ?,"
                + "     [DiscountAmount] = ?,"
                + "     [StartDate] = ?,"
                + "     [EndDate] = ?,"
                + "     [Quantity] = ?,"
                + "     [IsActive] = ?"
                + " WHERE [CouponId] = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, coupon.getCode());
            pre.setString(2, coupon.getDescription());
            pre.setDouble(3, coupon.getDiscountAmount());
            pre.setString(4, coupon.getStartDate());
            pre.setString(5, coupon.getEndDate());
            pre.setInt(6, coupon.getQuantity());
            pre.setInt(7, coupon.getIsActive());
            pre.setInt(8, coupon.getCouponsId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Coupons getCouponById(int couponId) {
        String sql = "select * from Coupons where CouponId = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, couponId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Coupons coupon = new Coupons();
                coupon.setCouponsId(rs.getInt("CouponId"));
                coupon.setCode(rs.getString("CouponCode"));
                coupon.setDescription(rs.getString("Description"));
                coupon.setDiscountAmount(rs.getDouble("DiscountAmount"));
                coupon.setStartDate(rs.getString("StartDate"));
                coupon.setEndDate(rs.getString("EndDate"));
                coupon.setQuantity(rs.getInt("Quantity"));
                coupon.setIsActive(rs.getInt("IsActive"));
                return coupon;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteCoupon(int couponId) {
        String sql = "DELETE FROM [dbo].[Coupons] WHERE CouponId = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, couponId);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Coupons> SearchCouponByCode(String code) {
        ArrayList<Coupons> uList = new ArrayList<>();
        String sql = "SELECT * FROM Coupons WHERE CouponCode LIKE ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + code + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coupons coupon = new Coupons();
                coupon.setCouponsId(rs.getInt("CouponId"));
                coupon.setCode(rs.getString("CouponCode"));
                coupon.setDescription(rs.getString("Description"));
                coupon.setDiscountAmount(rs.getDouble("DiscountAmount"));
                coupon.setStartDate(rs.getString("StartDate"));
                coupon.setEndDate(rs.getString("EndDate"));
                coupon.setIsActive(rs.getInt("IsActive"));
                uList.add(coupon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    public Coupons getCouponByCode(String code) {
        String sql = "SELECT * FROM [ECommerce2].[dbo].[Coupons] WHERE CouponCode = ? AND Quantity > 0 AND IsActive = 1 AND GETDATE() BETWEEN StartDate AND EndDate";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Coupons(
                        rs.getInt("CouponId"),
                        rs.getString("CouponCode"),
                        rs.getString("Description"),
                        rs.getDouble("DiscountAmount"),
                        rs.getString("StartDate"),
                        rs.getString("EndDate"),
                        rs.getInt("Quantity"),
                        rs.getInt("IsActive")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateCouponQuantity(String code) {
        String sql = "UPDATE Coupons SET Quantity = Quantity - 1 WHERE CouponCode = ? AND Quantity > 0";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, code);
            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        CouponsDAO couponsDAO = new CouponsDAO();
        // Test with a sample coupon code
        String couponCode = "YJ450E"; 

        Coupons coupon = couponsDAO.getCouponByCode(couponCode);

        if (coupon != null) {
            System.out.println("Coupon found:");
            System.out.println("ID: " + coupon.getCouponsId());
            System.out.println("Code: " + coupon.getCode());
            System.out.println("Description: " + coupon.getDescription());
            System.out.println("Discount Amount: " + coupon.getDiscountAmount());
            System.out.println("Start Date: " + coupon.getStartDate());
            System.out.println("End Date: " + coupon.getEndDate());
            System.out.println("Quantity: " + coupon.getQuantity());
            System.out.println("isActive: " + coupon.getIsActive());
        } else {
            System.out.println("Coupon not found or invalid.");
        }
    }
}
