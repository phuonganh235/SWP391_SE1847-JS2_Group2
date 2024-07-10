/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phuan
 */
public class Consultations {
    private int consultationId;
    private String customerName;
    private String customerAddress;
    private String customerPhone;
    private String consultationDate;
    private String note;
    private String startHour;
    private String endHour;
    private int status;

    public Consultations() {
    }

    public Consultations(int consultationId, String customerName, String customerAddress, String customerPhone, String consultationDate, String note, String startHour, String endHour, int status) {
        this.consultationId = consultationId;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.consultationDate = consultationDate;
        this.note = note;
        this.startHour = startHour;
        this.endHour = endHour;
        this.status = status;
    }

    public int getConsultationId() {
        return consultationId;
    }

    public void setConsultationId(int consultationId) {
        this.consultationId = consultationId;
    }



    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getConsultationDate() {
        return consultationDate;
    }

    public void setConsultationDate(String consultationDate) {
        this.consultationDate = consultationDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStartHour() {
        return startHour;
    }

    public void setStartHour(String startHour) {
        this.startHour = startHour;
    }

    public String getEndHour() {
        return endHour;
    }

    public void setEndHour(String endHour) {
        this.endHour = endHour;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Consultations{" + "consultationId=" + consultationId +  ", customerName=" + customerName + ", customerAddress=" + customerAddress + ", customerPhone=" + customerPhone + ", consultationDate=" + consultationDate + ", note=" + note + ", startHour=" + startHour + ", endHour=" + endHour + ", status=" + status + '}';
    }
    
    
}
