package model;

public class Feedback {

    private int feedbackId;
    private int productId;
    private int userId;
    private int rating;
    private String comment;
    private String createdAt;

    public Feedback() {
    }

    public Feedback(int productId, int userId, int rating, String comment, String createdAt) {
        this.productId = productId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    public Feedback(int feedbackId, int productId, int userId, int rating, String comment, String createdAt) {
        this.feedbackId = feedbackId;
        this.productId = productId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackId=" + feedbackId + ", productId=" + productId + ", userId=" + userId + ", rating=" + rating + ", comment=" + comment + ", createdAt=" + createdAt + '}';
    }

}
