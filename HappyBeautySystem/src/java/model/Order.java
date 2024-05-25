package model;

import java.util.Date;

public class Order {

    private int OrderId;
    private int OrderDetailId;
    private int ProductId;
    private int Quantity;
    private int UserId;
    private int PaymentId;
    private String OrderDate;
    private boolean IsCancel;
    private int Statuss;

    public Order() {
    }

    public Order(int OrderId, int OrderDetailId, int ProductId, int Quantity, int UserId, int PaymentId, String OrderDate, boolean IsCancel, int Statuss) {
        this.OrderId = OrderId;
        this.OrderDetailId = OrderDetailId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.UserId = UserId;
        this.PaymentId = PaymentId;
        this.OrderDate = OrderDate;
        this.IsCancel = IsCancel;
        this.Statuss = Statuss;
    }

    public Order(int OrderDetailId, int ProductId, int Quantity, int UserId, int PaymentId, String OrderDate, boolean IsCancel, int Statuss) {
        this.OrderDetailId = OrderDetailId;
        this.ProductId = ProductId;
        this.Quantity = Quantity;
        this.UserId = UserId;
        this.PaymentId = PaymentId;
        this.OrderDate = OrderDate;
        this.IsCancel = IsCancel;
        this.Statuss = Statuss;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
    }

    public int getOrderDetailId() {
        return OrderDetailId;
    }

    public void setOrderDetailId(int OrderDetailId) {
        this.OrderDetailId = OrderDetailId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
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

    public int getStatuss() {
        return Statuss;
    }

    public void setStatuss(int Statuss) {
        this.Statuss = Statuss;
    }

}
