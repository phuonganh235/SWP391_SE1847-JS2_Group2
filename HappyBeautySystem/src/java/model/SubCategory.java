package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class SubCategory {
    private int SubCategoryId;
    private String SubCategoryName;
    private String CategoryId;
    private boolean isActive;
    private Date createDate;

    public SubCategory(int SubCategoryId, String SubCategoryName, String CategoryId, boolean isActive, Date createDate) {
        this.SubCategoryId = SubCategoryId;
        this.SubCategoryName = SubCategoryName;
        this.CategoryId = CategoryId;
        this.isActive = isActive;
        this.createDate = createDate;
    }

    public SubCategory(int SubCategoryId, String SubCategoryName) {
        this.SubCategoryId = SubCategoryId;
        this.SubCategoryName = SubCategoryName;
    }

    public int getSubCategoryId() {
        return SubCategoryId;
    }

    public void setSubCategoryId(int SubCategoryId) {
        this.SubCategoryId = SubCategoryId;
    }

    public String getSubCategoryName() {
        return SubCategoryName;
    }

    public void setSubCategoryName(String SubCategoryName) {
        this.SubCategoryName = SubCategoryName;
    }

    public String getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(String CategoryId) {
        this.CategoryId = CategoryId;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
}
