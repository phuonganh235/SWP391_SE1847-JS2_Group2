package model;

public class RepFeedback {
    private int repFbId;
    private int fbId;
    private int userId;
    private String comment;
    private String creatAt;

    public RepFeedback() {
    }

    public RepFeedback(int repFbId, int fbId, int userId, String comment, String creatAt) {
        this.repFbId = repFbId;
        this.fbId = fbId;
        this.userId = userId;
        this.comment = comment;
        this.creatAt = creatAt;
    }

    public int getRepFbId() {
        return repFbId;
    }

    public void setRepFbId(int repFbId) {
        this.repFbId = repFbId;
    }

    public int getFbId() {
        return fbId;
    }

    public void setFbId(int fbId) {
        this.fbId = fbId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(String creatAt) {
        this.creatAt = creatAt;
    }

    @Override
    public String toString() {
        return "RepFeedback{" + "repFbId=" + repFbId + ", fbId=" + fbId + ", userId=" + userId + ", comment=" + comment + ", creatAt=" + creatAt + '}';
    }

    
    
}
