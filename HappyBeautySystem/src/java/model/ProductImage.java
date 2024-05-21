/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phthh
 */
public class ProductImage {
    private int imageId;
    private String imageUrl;
    private int productId;
    private boolean defaultImage;

    public ProductImage() {
    }

    public ProductImage(int imageId, String imageUrl, int productId, boolean defaultImage) {
        this.imageId = imageId;
        this.imageUrl = imageUrl;
        this.productId = productId;
        this.defaultImage = defaultImage;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public boolean isDefaultImage() {
        return defaultImage;
    }

    public void setDefaultImage(boolean defaultImage) {
        this.defaultImage = defaultImage;
    }
}
