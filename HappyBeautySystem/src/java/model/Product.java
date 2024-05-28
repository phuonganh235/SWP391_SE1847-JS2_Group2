package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Product {
    Category cate;
    private int productId;
    private String productName;
    private String shortDes;
    private String longDes;
    private String addDes;
    private float price;
    private int quantity;
    private String size;
    private String color;
    private String companyName;
    private int cateId;
    private int subCateId;
    private int sold;
    private boolean isCustomized;
    private boolean isActive;
    private String createDate;
    private String pathImage;

    public Product() {
    }

    public Product(Category cate, int productId, String productName, String shortDes, float price, String pathImage) {
        this.cate = cate;
        this.productId = productId;
        this.productName = productName;
        this.shortDes = shortDes;
        this.price = price;
        this.pathImage = pathImage;
    }
    
    public Product(int productId, String productName, String shortDes, String longDes, String addDes, float price, int quantity, String size, String color, String companyName, int cateId, int subCateId, int sold, boolean isCustomized, boolean isActive, String createDate,String pathImage) {
        this.productId = productId;
        this.productName = productName;
        this.shortDes = shortDes;
        this.longDes = longDes;
        this.addDes = addDes;
        this.price = price;
        this.quantity = quantity;
        this.size = size;
        this.color = color;
        this.companyName = companyName;
        this.cateId = cateId;
        this.subCateId = subCateId;
        this.sold = sold;
        this.isCustomized = isCustomized;
        this.isActive = isActive;
        this.createDate = createDate;
        this.pathImage = pathImage;
    }

    public Product(Category cate, int productId, String productName, String shortDes, String longDes, String addDes, float price, int quantity, String size, String color, String companyName, int cateId, int subCateId, int sold, boolean isCustomized, boolean isActive, String createDate, String pathImage) {
        this.cate = cate;
        this.productId = productId;
        this.productName = productName;
        this.shortDes = shortDes;
        this.longDes = longDes;
        this.addDes = addDes;
        this.price = price;
        this.quantity = quantity;
        this.size = size;
        this.color = color;
        this.companyName = companyName;
        this.cateId = cateId;
        this.subCateId = subCateId;
        this.sold = sold;
        this.isCustomized = isCustomized;
        this.isActive = isActive;
        this.createDate = createDate;
        this.pathImage = pathImage;
    }
    
    
    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public String getLongDes() {
        return longDes;
    }

    public void setLongDes(String longDes) {
        this.longDes = longDes;
    }

    public String getAddDes() {
        return addDes;
    }

    public void setAddDes(String addDes) {
        this.addDes = addDes;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public int getSubCateId() {
        return subCateId;
    }

    public void setSubCateId(int subCateId) {
        this.subCateId = subCateId;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public boolean isIsCustomized() {
        return isCustomized;
    }

    public void setIsCustomized(boolean isCustomized) {
        this.isCustomized = isCustomized;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getPathImage() {
        return pathImage;
    }

    public void setPathImage(String pathImage) {
        this.pathImage = pathImage;
    }

    
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", shortDes=" + shortDes + ", longDes=" + longDes + ", addDes=" + addDes + ", price=" + price + ", quantity=" + quantity + ", size=" + size + ", color=" + color + ", companyName=" + companyName + ", cateId=" + cateId + ", subCateId=" + subCateId + ", sold=" + sold + ", isCustomized=" + isCustomized + ", isActive=" + isActive + ", createDate=" + createDate + ", pathImage=" + pathImage + '}';
    }
    
    
}