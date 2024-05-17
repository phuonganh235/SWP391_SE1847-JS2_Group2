package model;

public class Payment {
    private int paymentId;
    private String name;
    private String cardNo;
    private String expiryDate;
    private int cvv;
    private String Address;
    private String payMode;

    public Payment() {
    }

    public Payment(int paymentId, String name, String cardNo, String expiryDate, int cvv, String Address, String payMode) {
        this.paymentId = paymentId;
        this.name = name;
        this.cardNo = cardNo;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
        this.Address = Address;
        this.payMode = payMode;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPayMode() {
        return payMode;
    }

    public void setPayMode(String payMode) {
        this.payMode = payMode;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentId=" + paymentId + ", name=" + name + ", cardNo=" + cardNo + ", expiryDate=" + expiryDate + ", cvv=" + cvv + ", Address=" + Address + ", payMode=" + payMode + '}';
    }
    
    
}
