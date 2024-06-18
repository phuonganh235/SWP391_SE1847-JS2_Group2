package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Feedback;

public class FeedbackDAO extends DBContext {

    // Retrieves all feedback from the Feedback table in the database
    public ArrayList<Feedback> getAllFeedbacks() {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_Id"));
                feedback.setProductId(rs.getInt("product_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setCreatedAt(rs.getString("created_at"));
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    // Adds a new feedback to the Feedback table in the database
    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (product_id, user_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedback.getProductId());
            st.setInt(2, feedback.getUserId());
            st.setInt(3, feedback.getRating());
            st.setString(4, feedback.getComment());
            st.setString(5, feedback.getCreatedAt());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Updates an existing feedback in the Feedback table in the database
    public void updateFeedback(Feedback feedback) {
        String sql = "UPDATE Feedback SET product_id = ?, user_id = ?, rating = ?, comment = ?, created_at = ? WHERE feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedback.getProductId());
            st.setInt(2, feedback.getUserId());
            st.setInt(3, feedback.getRating());
            st.setString(4, feedback.getComment());
            st.setString(5, feedback.getCreatedAt());
            st.setInt(6, feedback.getFeedbackId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Deletes a feedback from the Feedback table in the database by its ID
    public void deleteFeedback(int feedbackId) {
        String sql = "DELETE FROM Feedback WHERE feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedbackId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Counts the number of reviews in the Feedback table
    public int countReview() {
        String sql = "SELECT COUNT(*) FROM Feedback";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Retrieves feedback for a specific product ID from the Feedback table in the database
    public ArrayList<Feedback> getFeedbackByProductId(int productId) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setProductId(rs.getInt("product_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setCreatedAt(rs.getString("created_at"));
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
    
    // Counts the number of reviews for a specific product ID in the Feedback table
    public int countReviewByProductId(int productId) {
        String sql = "SELECT COUNT(*) FROM Feedback WHERE product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    // Main method for testing
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        dao.addFeedback(new Feedback(2, 3, 5, 2,
                "Very gooddd", "2-3-2024"));
        ArrayList<Feedback> fb = dao.getAllFeedbacks();
        for (Feedback feedback : fb) {
            System.out.println(feedback);
        }
    }
}
