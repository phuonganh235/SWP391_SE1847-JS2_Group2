package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.RepFeedback;

public class RepFeedbackDAO extends DBContext {

    public ArrayList<RepFeedback> getAllRepFeedback() {
        ArrayList<RepFeedback> rList = new ArrayList<>();
        String sql = "SELECT * FROM RepFeedback";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                RepFeedback rep = new RepFeedback();
                rep.setRepFbId(rs.getInt("rep_feedback_id"));
                rep.setFbId(rs.getInt("feedback_id"));
                rep.setUserId(rs.getInt("user_id"));
                rep.setComment(rs.getString("comment"));
                rep.setCreatAt(rs.getString("created_at"));
                rList.add(rep);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rList;
    }

    public void addRepFeedback(RepFeedback repFeedback) {
        String sql = "INSERT INTO RepFeedback (feedback_id, user_id, comment, created_at) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, repFeedback.getFbId());
            st.setInt(2, repFeedback.getUserId());
            st.setString(3, repFeedback.getComment());
            st.setString(4, repFeedback.getCreatAt());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateRepFeedback(RepFeedback repFeedback) {
        String sql = "UPDATE RepFeedback SET feedback_id = ?, user_id = ?, comment = ?, created_at = ? WHERE rep_feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, repFeedback.getFbId());
            st.setInt(2, repFeedback.getUserId());
            st.setString(3, repFeedback.getComment());
            st.setString(4, repFeedback.getCreatAt());
            st.setInt(5, repFeedback.getRepFbId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteRepFeedback(int repFeedbackId) {
        String sql = "DELETE FROM RepFeedback WHERE rep_feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, repFeedbackId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public RepFeedback getRepFeedbackByFeedbackId(int feedbackId) {
        RepFeedback rep = null;
        String sql = "SELECT * FROM RepFeedback WHERE feedback_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, feedbackId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                rep = new RepFeedback();
                rep.setRepFbId(rs.getInt("rep_feedback_id"));
                rep.setFbId(rs.getInt("feedback_id"));
                rep.setUserId(rs.getInt("user_id"));
                rep.setComment(rs.getString("comment"));
                rep.setCreatAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rep;
    }

    public static void main(String[] args) {
        RepFeedbackDAO dao = new RepFeedbackDAO();
        RepFeedback rep = dao.getRepFeedbackByFeedbackId(2);
        System.out.println(rep);
    }
}
