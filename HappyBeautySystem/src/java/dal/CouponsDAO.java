/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Coupons;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author phuan
 */
public class CouponsDAO extends DBContext{
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
  
}
