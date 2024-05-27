package model;

import java.util.Date;

public class Order {

    private int OrderId;
    private int UserId;
    private int PaymentId;
    private String OrderDate;
    private boolean IsCancel;
    private String CustomerName;
    private String CustomerAddress;
    private String CustomerPhoneNumber;
    private int Statuss;

    public Order() {
    }

    public Order(int UserId, int PaymentId, String OrderDate, boolean IsCancel, String CustomerName, String CustomerAddress, String CustomerPhoneNumber, int Statuss) {
        this.UserId = UserId;
        this.PaymentId = PaymentId;
        this.OrderDate = OrderDate;
        this.IsCancel = IsCancel;
        this.CustomerName = CustomerName;
        this.CustomerAddress = CustomerAddress;
        this.CustomerPhoneNumber = CustomerPhoneNumber;
        this.Statuss = Statuss;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getPaymentId() {
        return PaymentId;
    }

    public void setPaymentId(int PaymentId) {
        this.PaymentId = PaymentId;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public boolean isIsCancel() {
        return IsCancel;
    }

    public void setIsCancel(boolean IsCancel) {
        this.IsCancel = IsCancel;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCustomerAddress() {
        return CustomerAddress;
    }

    public void setCustomerAddress(String CustomerAddress) {
        this.CustomerAddress = CustomerAddress;
    }

    public String getCustomerPhoneNumber() {
        return CustomerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String CustomerPhoneNumber) {
        this.CustomerPhoneNumber = CustomerPhoneNumber;
    }

    public int getStatuss() {
        return Statuss;
    }

    public void setStatuss(int Statuss) {
        this.Statuss = Statuss;
    }

}
