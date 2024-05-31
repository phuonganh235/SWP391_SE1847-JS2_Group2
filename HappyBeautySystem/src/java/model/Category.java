package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Category {

    private int categoryId;
    private String categoryName;
    private String categoryImageUrl;
    private boolean isActive;
    private String createDate;

    public Category() {
    }

    public Category(String categoryName) {
    }

    public Category(int categoryId, String categoryName, String categoryImageUrl, boolean isActive, String createDate) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryImageUrl = categoryImageUrl;
        this.isActive = isActive;
        this.createDate = createDate;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryImageUrl() {
        return categoryImageUrl;
    }

    public void setCategoryImageUrl(String categoryImageUrl) {
        this.categoryImageUrl = categoryImageUrl;
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

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryImageUrl=" + categoryImageUrl + ", isActive=" + isActive + ", createDate=" + createDate + '}';
    }

    public String getFormattedCreateDate() {
        SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        SimpleDateFormat sdfOutput = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss.SSS");
        try {
            Date date = sdfInput.parse(this.createDate);
            return sdfOutput.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
