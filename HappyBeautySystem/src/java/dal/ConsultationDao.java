/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import common.Consultation;
import model.Consultations;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phuan
 */
public class ConsultationDao extends DBContext {

 public int insertConsultation(Consultations consultation) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Consultations] ([CustomerName],[CustomerAddress],[CustomerPhoneNumber],[Date],[Note],[StartHour],[EndHour],[Status]) VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, consultation.getCustomerName());
            pre.setString(2, consultation.getCustomerAddress());
            pre.setString(3, consultation.getCustomerPhone());
            pre.setString(4, consultation.getConsultationDate());
            pre.setString(5, consultation.getNote());
            pre.setString(6, consultation.getStartHour());
            pre.setString(7, consultation.getEndHour());
            pre.setInt(8, consultation.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
 
 public ArrayList<Consultations> getConsultationWithStatus1(String sql){
     ArrayList<Consultations> list = new ArrayList<>();
     try {
         PreparedStatement pre = connection.prepareStatement(sql);
         ResultSet rs = pre.executeQuery();
         while(rs.next()){
             Consultations newConsultation = new Consultations();
             newConsultation.setConsultationId(rs.getInt("ConsultationsId"));
             newConsultation.setCustomerName(rs.getString("CustomerName"));
             newConsultation.setCustomerAddress(rs.getString("CustomerAddress"));
             newConsultation.setCustomerPhone(rs.getString("CustomerPhoneNumber"));
             newConsultation.setConsultationDate(rs.getString("Date"));
             newConsultation.setNote(rs.getString("Note"));
             newConsultation.setStartHour(rs.getString("StartHour"));
             newConsultation.setEndHour(rs.getString("EndHour"));
             newConsultation.setStatus(rs.getInt("Status"));
             list.add(newConsultation);
         }
     } catch (SQLException ex) {
         Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
     }
     return list;
 }
    public boolean updateConsultationStatus(int ConsultationId, int Status) {
        String sql = "update [dbo].[Consultations] set Status = ? where ConsultationsId = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, Status);
            pre.setInt(2, ConsultationId);
            int n = pre.executeUpdate();
            return n > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public void deleteConsultion (int consultationId){
        String sql = "DELETE FROM [dbo].[Consultations] WHERE ConsultationsId = ?";  
     try {
         PreparedStatement pre = connection.prepareStatement(sql);
         pre.setInt(1, consultationId);
         pre.executeUpdate();
     } catch (SQLException ex) {
         Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
     }
    }
    public static void main(String[] args) {
        // Tạo instance của ConsultationDao
        ConsultationDao consultationDao = new ConsultationDao();

        int consultationId = 11; // Thay đổi ID này thành ID thực tế trong cơ sở dữ liệu của bạn
        int newStatus = 2; // Thay đổi status này thành status mới bạn muốn cập nhật

        boolean result = consultationDao.updateConsultationStatus(consultationId, newStatus);

        if (result) {
            System.out.println("Cập nhật trạng thái tư vấn thành công.");
        } else {
            System.out.println("Cập nhật trạng thái tư vấn thất bại.");
        }
    }
}
