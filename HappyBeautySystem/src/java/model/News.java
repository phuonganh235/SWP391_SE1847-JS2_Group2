package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class News {
    private int newsId;
    private String title;
    private String content;
    private Timestamp createTime;
    private String imgUrl;
    private boolean isConfirm;
    private int userID;
    private boolean isActive;
    private Timestamp updateTime;
    private int categoryID;

    public News() {
    }

    public News(int newsId, String title, String content, Timestamp createTime, String imgUrl, boolean isConfirm, int userID, boolean isActive, Timestamp updateTime, int categoryID) {
        this.newsId = newsId;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.imgUrl = imgUrl;
        this.isConfirm = isConfirm;
        this.userID = userID;
        this.isActive = isActive;
        this.updateTime = updateTime;
        this.categoryID = categoryID;
    }

    public News(int newsId, String title, String content, Timestamp createTime, String imgUrl, boolean isConfirm, boolean isActive, Timestamp updateTime, int categoryID) {
        this.newsId = newsId;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.imgUrl = imgUrl;
        this.isConfirm = isConfirm;
        this.isActive = isActive;
        this.updateTime = updateTime;
        this.categoryID = categoryID;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public boolean isIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(boolean isConfirm) {
        this.isConfirm = isConfirm;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", title=" + title + ", content=" + content + ", createTime=" + createTime + ", imgUrl=" + imgUrl + ", isConfirm=" + isConfirm + ", userID=" + userID + ", isActive=" + isActive + ", updateTime=" + updateTime + ", categoryID=" + categoryID + '}';
    }
    
}
