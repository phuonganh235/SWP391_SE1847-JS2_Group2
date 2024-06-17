package model;

public class About {
    private int aboutId;
    private String title;
    private String content;
    private String imageURL;

    public About() {
    }

    public About(int aboutId, String title, String content, String imageURL) {
        this.aboutId = aboutId;
        this.title = title;
        this.content = content;
        this.imageURL = imageURL;
    }

    public int getAboutId() {
        return aboutId;
    }

    public void setAboutId(int aboutId) {
        this.aboutId = aboutId;
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

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    @Override
    public String toString() {
        return "About{" + "aboutId=" + aboutId + ", title=" + title + ", content=" + content + ", imageURL=" + imageURL + '}';
    }

    
}
