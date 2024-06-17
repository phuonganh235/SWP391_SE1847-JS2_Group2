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
    private Timestamp createdDate;
    private String imgUrl;
    private boolean isConfirm;
    private int userID;
    private boolean isActive;

    public News() {
    }

    public News(int newsId, String title, String content, Timestamp createdDate, String imgUrl, boolean isConfirm, int userID, boolean isActive) {
        this.newsId = newsId;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.imgUrl = imgUrl;
        this.isConfirm = isConfirm;
        this.userID = userID;
        this.isActive = isActive;
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

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
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

    @Override
    public String toString() {
        return "News{" + "newsId=" + newsId + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate + ", imgUrl=" + imgUrl + ", isConfirm=" + isConfirm + ", userID=" + userID + ", isActive=" + isActive + '}';
    }

    
}
