package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Feedback;

public class FeedbackDAO extends DBContext {

    // Retrieves all feedback from the Feedback table in the database
    public ArrayList<Feedback> getAllFeedbacks() {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "   select f.feedback_id ,f.user_id,p.ProductName,u.Username,f.comment,f.rating,f.created_at,f.feedback_id,f.product_id from Feedback f\n"
                + "  join Users u on f.[user_id]=u.UserId\n"
                + "  join Product p on p.ProductId = f.product_id";
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
                feedback.setProductName(rs.getString("ProductName"));
                feedback.setUserName(rs.getString("Username"));
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    // Adds a new feedback to the Feedback table in the database
    public void addFeedback2(Feedback feedback) {
        String sql = "INSERT INTO Feedback (product_id, user_id, rating, comment, created_at)\n"
                + "SELECT ?, ?, ?, ?, ?\n"
                + "WHERE EXISTS (\n"
                + "    SELECT 1\n"
                + "    FROM Feedback f\n"
                + "    WHERE f.user_id = ?\n"
                + "      AND f.product_id = ?\n"
                + ");";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedback.getProductId());
            st.setInt(2, feedback.getUserId());
            st.setInt(3, feedback.getRating());
            st.setString(4, feedback.getComment());
            st.setString(5, feedback.getCreatedAt());
            st.setInt(6, feedback.getUserId());
            st.setInt(7, feedback.getProductId());
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

    // Calculates the average rating for a specific product ID in the Feedback table
    public double getAverageRatingByProductId(int productId) {
        String sql = "SELECT ROUND(AVG(CAST(rating AS DECIMAL(10, 1))), 1)\n"
                + "FROM Feedback\n"
                + "WHERE product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    // Retrieves feedback by star rating from the Feedback table in the database
    public ArrayList<Feedback> getFeedbackByStar(int star) {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "select f.feedback_id ,f.user_id,p.ProductName,u.Username,f.comment,f.rating,f.created_at,f.feedback_id,f.product_id from Feedback f\n"
                + "  join Users u on f.[user_id]=u.UserId\n"
                + "  join Product p on p.ProductId = f.product_id WHERE rating = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, star);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setProductId(rs.getInt("product_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setCreatedAt(rs.getString("created_at"));
                feedback.setProductName(rs.getString("ProductName"));
                feedback.setUserName(rs.getString("Username"));
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public double getGoodRatingRatio() {
        String totalRatingsSql = "SELECT COUNT(*) FROM Feedback";
        String fiveStarRatingsSql = "SELECT COUNT(*) FROM Feedback WHERE rating = 5";
        try {
            // Get total number of ratings
            PreparedStatement totalSt = connection.prepareStatement(totalRatingsSql);
            ResultSet totalRs = totalSt.executeQuery();
            int totalRatings = 0;
            if (totalRs.next()) {
                totalRatings = totalRs.getInt(1);
            }

            // Get number of 5-star ratings
            PreparedStatement fiveStarSt = connection.prepareStatement(fiveStarRatingsSql);
            ResultSet fiveStarRs = fiveStarSt.executeQuery();
            int fiveStarRatings = 0;
            if (fiveStarRs.next()) {
                fiveStarRatings = fiveStarRs.getInt(1);
            }

            // Calculate the ratio of 5-star ratings to total ratings
            if (totalRatings != 0) {
                return (double) fiveStarRatings / totalRatings;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public int countNegativeFeedbacks() {
        String sql = "SELECT COUNT(*) FROM Feedback WHERE rating IN (1, 2)";
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

    // Retrieves feedback by ID from the Feedback table in the database
    public Feedback getFeedbackById(int feedbackId) {
        String sql = "SELECT * FROM Feedback WHERE feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedbackId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setProductId(rs.getInt("product_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setCreatedAt(rs.getString("created_at"));
                return feedback;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Main method for testing
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();

        ArrayList<Feedback> fb = dao.getAllFeedbacks();
        for (Feedback feedback : fb) {
            System.out.println(feedback);
        }

    }
}
