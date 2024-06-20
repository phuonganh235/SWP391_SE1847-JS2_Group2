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
        String sql = "INSERT INTO [dbo].[Coupons] ([CouponCode],[Description],[DiscountAmount],[StartDate],[EndDate],[IsActive]) VALUES(?,?,?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, coupon.getCode());
            pre.setString(2, coupon.getDescription());
            pre.setDouble(3, coupon.getDiscountAmount());
            pre.setString(4, coupon.getStartDate());
            pre.setString(5, coupon.getEndDate());
            pre.setInt(6, coupon.getIsActive());
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
                + "     [IsActive] = ?"
                + " WHERE [CouponId] = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, coupon.getCode());
            pre.setString(2, coupon.getDescription());
            pre.setDouble(3, coupon.getDiscountAmount());
            pre.setString(4, coupon.getStartDate());
            pre.setString(5, coupon.getEndDate());
            pre.setInt(6, coupon.getIsActive());
            pre.setInt(7, coupon.getCouponsId());
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

    public int count(String search) {
        int n = 0;
        String sql = "select count(*) from Coupons where CouponCode like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        CouponsDAO dao = new CouponsDAO();
//        Coupons newCou = new Coupons(28, "sdfsdfsdf", "dsfsdfdsf", 10, "", "", 0);
//        dao.updateCoupon(newCou);
        int count = dao.count("S");
        System.out.println(count);

    }
}
