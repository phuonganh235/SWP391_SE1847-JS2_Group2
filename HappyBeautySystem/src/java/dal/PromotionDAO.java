/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Coupons;
import model.Promotions;

/**
 *
 * @author phthh
 */
public class PromotionDAO extends DBContext {

    public ArrayList<Promotions> getAllPromotions() {
        ArrayList<Promotions> promotionList = new ArrayList<>();
        String sql = "SELECT * FROM Promotions";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Promotions promotion = new Promotions();
                promotion.setPromoCode(rs.getString("promoCode"));
                promotion.setPromoName(rs.getString("promoName"));
                promotion.setStartDate(rs.getString("startDate"));
                promotion.setEndDate(rs.getString("endDate"));
                promotion.setStatus(rs.getInt("status"));
                promotion.setDescription(rs.getString("description"));
                promotion.setDiscountAmount(rs.getDouble("discountAmount"));
                promotion.setCondition(rs.getDouble("condition"));
                promotionList.add(promotion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotionList;
    }
    
//Lấy các mã KM đang hoạt động
    public ArrayList<Promotions> getActivePromotion() {
        ArrayList<Promotions> promotionList = new ArrayList<>();
        String sql = "SELECT * FROM Promotions where status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Promotions promotion = new Promotions();
                promotion.setPromoCode(rs.getString("promoCode"));
                promotion.setPromoName(rs.getString("promoName"));
                promotion.setStartDate(rs.getString("startDate"));
                promotion.setEndDate(rs.getString("endDate"));
                promotion.setStatus(rs.getInt("status"));
                promotion.setDescription(rs.getString("description"));
                promotion.setDiscountAmount(rs.getDouble("discountAmount"));
                promotion.setCondition(rs.getDouble("condition"));
                promotionList.add(promotion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotionList;
    }
    
    public ArrayList<Promotions> getListByPage(ArrayList<Promotions> list, int start, int end) {
        ArrayList<Promotions> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    // Retrieves a promotion by its ID from the Product table
    public Promotions getPromotionById(String promoCode) {
        Promotions promotion = null;
        String sql = "Select * from Promotions WHERE promoCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, promoCode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                promotion = new Promotions();
                promotion.setPromoCode(rs.getString("promoCode"));
                promotion.setPromoName(rs.getString("promoName"));
                promotion.setStartDate(rs.getString("startDate"));
                promotion.setEndDate(rs.getString("endDate"));
                promotion.setStatus(rs.getInt("status"));
                promotion.setDescription(rs.getString("description"));
                promotion.setDiscountAmount(rs.getDouble("discountAmount"));
                promotion.setCondition(rs.getDouble("condition"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotion;
    }

    public void addPromotion(Promotions promotion) {
        String sql = "INSERT INTO [dbo].[Promotions]\n"
                + "           ([promoId]\n"
                + "           ,[promoCode]\n"
                + "           ,[promoName]\n"
                + "           ,[startDate]\n"
                + "           ,[endDate]\n"
                + "           ,[status]\n"
                + "           ,[Description]\n"
                + "           ,[DiscountAmount]\n"
                + "           ,[condition])\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, promotion.getPromoId());
            pre.setString(2, promotion.getPromoCode());
            pre.setString(3, promotion.getPromoName());
            pre.setString(4, promotion.getStartDate());
            pre.setString(5, promotion.getEndDate());
            pre.setInt(6, promotion.getStatus());
            pre.setString(7, promotion.getDescription());
            pre.setDouble(8, promotion.getDiscountAmount());
            pre.setDouble(9, promotion.getCondition());

            System.out.println("Executing SQL: " + sql);
            System.out.println("Promo ID: " + promotion.getPromoId());
            System.out.println("Promo Code: " + promotion.getPromoCode());

            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int updatePromotion(Promotions coupon) {
        int n = 0;
        String sql = "UPDATE [dbo].[Promotions]\n"
                + "   SET [promoCode] = ?\n"
                + "      ,[promoName] = ?\n"
                + "      ,[startDate] = ?\n"
                + "      ,[endDate] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[DiscountAmount] = ?\n"
                + "      ,[condition] = ?\n"
                + " WHERE [promoId] = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, coupon.getPromoCode());
            pre.setString(2, coupon.getPromoName());
            pre.setString(3, coupon.getStartDate());
            pre.setString(4, coupon.getEndDate());
            pre.setInt(5, coupon.getStatus());
            pre.setString(6, coupon.getDescription());
            pre.setDouble(7, coupon.getDiscountAmount());
            pre.setDouble(8, coupon.getCondition());
            pre.setInt(9, coupon.getPromoId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CouponsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deletePromotion(String proCode) {
        String sql = "DELETE FROM Promotions WHERE promoCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proCode);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int countPromotion() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM Promotions where status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static void main(String[] args) {
        PromotionDAO PromotionDAO = new PromotionDAO();

        Promotions promotion = PromotionDAO.getPromotionById("KM1");
//        System.out.println("Executing SQL: " + sql);
//        System.out.println("Promo ID: " + promotion.getPromoId());
//        System.out.println("Promo Code: " + promotion.getPromoCode());
        int pro = PromotionDAO.countPromotion();
//        ArrayList<Promotions> pList = PromotionDAO.getAllPromotions();
//        for (Promotions promotion : pList) {
        System.out.println(pro);
//        }
//        if (coupon != null) {
//            System.out.println("Coupon found:");
//            System.out.println("ID: " + coupon.getCouponsId());
//            System.out.println("Code: " + coupon.getCode());
//            System.out.println("Description: " + coupon.getDescription());
//            System.out.println("Discount Amount: " + coupon.getDiscountAmount());
//            System.out.println("Start Date: " + coupon.getStartDate());
//            System.out.println("End Date: " + coupon.getEndDate());
//            System.out.println("Quantity: " + coupon.getQuantity());
//            System.out.println("isActive: " + coupon.getIsActive());
//        } else {
//            System.out.println("Coupon not found or invalid.");
//        }
    }

}