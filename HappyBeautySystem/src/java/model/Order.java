package model;

import java.util.Date;

public class Order {
    private int orderId;
    private String orderNo;
    private int productId;
    private int quantity;
    private int userId;
    private String status;
    private int paymentId;
    private Date orderDate;
    private boolean isCancel;

    public Order() {
    }

    public Order(int orderId, String orderNo, int productId, int quantity, int userId, String status, int paymentId, Date orderDate, boolean isCancel) {
        this.orderId = orderId;
        this.orderNo = orderNo;
        this.productId = productId;
        this.quantity = quantity;
        this.userId = userId;
        this.status = status;
        this.paymentId = paymentId;
        this.orderDate = orderDate;
        this.isCancel = isCancel;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public boolean isIsCancel() {
        return isCancel;
    }

    public void setIsCancel(boolean isCancel) {
        this.isCancel = isCancel;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", orderNo=" + orderNo + ", productId=" + productId + ", quantity=" + quantity + ", userId=" + userId + ", status=" + status + ", paymentId=" + paymentId + ", orderDate=" + orderDate + ", isCancel=" + isCancel + '}';
    }
    
    
}
