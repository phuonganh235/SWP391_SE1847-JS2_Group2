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
        String sql = "INSERT INTO [dbo].[Consultations] ([CustomerName],[CustomerAddress],[CustomerPhoneNumber],[Date],[Note],[StartHour],[EndHour],[Status],[Email]) VALUES(?,?,?,?,?,?,?,?, ?)";
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
            pre.setString(9, consultation.getEmail());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Consultations> getConsultationWithStatus1(String sql) {
        ArrayList<Consultations> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
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
                newConsultation.setEmail(rs.getString("Email"));

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

    public void deleteConsultion(int consultationId) {
        String sql = "DELETE FROM [dbo].[Consultations] WHERE ConsultationsId = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, consultationId);
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Consultations getConsultationById(int consultationId) {
        Consultations consultation = null;
        try {
            String query = "SELECT * FROM [dbo].[Consultations] WHERE ConsultationsId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, consultationId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                consultation = new Consultations(
                        rs.getInt("ConsultationsId"),
                        rs.getString("CustomerName"),
                        rs.getString("CustomerAddress"),
                        rs.getString("CustomerPhoneNumber"),
                        rs.getString("Date"),
                        rs.getString("Note"),
                        rs.getString("StartHour"),
                        rs.getString("EndHour"),
                        rs.getInt("Status"),
                        rs.getString("Email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultation;
    }

    public static void main(String[] args) {
        // Tạo instance của ConsultationDao
        ConsultationDao consultationDao = new ConsultationDao();
        String sql = "SELECT * FROM Consultations WHERE Status = 1";
        ArrayList<Consultations> consultations = consultationDao.getConsultationWithStatus1(sql);

        // In kết quả ra console
        for (Consultations consultation : consultations) {
            System.out.println("Consultation ID: " + consultation.getConsultationId());
            System.out.println("Customer Name: " + consultation.getCustomerName());
            System.out.println("Customer Address: " + consultation.getCustomerAddress());
            System.out.println("Customer Phone: " + consultation.getCustomerPhone());
            System.out.println("Consultation Date: " + consultation.getConsultationDate());
            System.out.println("Note: " + consultation.getNote());
            System.out.println("Start Hour: " + consultation.getStartHour());
            System.out.println("End Hour: " + consultation.getEndHour());
            System.out.println("Status: " + consultation.getStatus());
            System.out.println("Email: " + consultation.getEmail());
            System.out.println("---------------------------------------------------");
        }
    }
}
