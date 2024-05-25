package model;

import java.util.Date;

public class Cart {
    private int cartId;
    private int productId;
    private int quantity;
    private int userId;
    private String createDate;

    public Cart() {
    }

    public Cart(int cartId, int productId, int quantity, int userId, String createDate) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.userId = userId;
        this.createDate = createDate;
    }

    public Cart(int productId, int quantity, int userId, String createDate) {
        this.productId = productId;
        this.quantity = quantity;
        this.userId = userId;
        this.createDate = createDate;
    }
    
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "cartId=" + cartId + ", productId=" + productId + ", quantity=" + quantity + ", userId=" + userId + ", createDate=" + createDate;
    }
    
    
    
}
