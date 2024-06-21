/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phthh
 */
public class WishList {
    private int WishlistId;
    private int ProductId;
    private int UserId;
    private String CreateDate;

    public WishList() {
    }

    public WishList(int WishlistId, int ProductId, int UserId, String CreateDate) {
        this.WishlistId = WishlistId;
        this.ProductId = ProductId;
        this.UserId = UserId;
        this.CreateDate = CreateDate;
    }
    
    public WishList(int ProductId, int UserId, String CreateDate) {
        this.ProductId = ProductId;
        this.UserId = UserId;
        this.CreateDate = CreateDate;
    }

    public int getWishlistId() {
        return WishlistId;
    }

    public void setWishlistId(int WishlistId) {
        this.WishlistId = WishlistId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String CreateDate) {
        this.CreateDate = CreateDate;
    }

    @Override
    public String toString() {
        return "WishList{" + "WishlistId=" + WishlistId + ", ProductId=" + ProductId + ", UserId=" + UserId + ", CreateDate=" + CreateDate + '}';
    }
    
}
