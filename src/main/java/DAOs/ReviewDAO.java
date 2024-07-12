package DAOs;

import DB.DBConnection;
import Models.Reviews;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO for managing reviews.
 */
public class ReviewDAO {

    public int createReview(Reviews review) {
        Connection conn = DBConnection.getConnection();
        int count = 0;
        if (conn != null) {
            try {
                String sql = "INSERT INTO reviews (user_id, hostel_id, star_number, comment, created_at) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, review.getUserID());
                stmt.setInt(2, review.getHostelID());
                stmt.setInt(3, review.getStarNumber());
                stmt.setString(4, review.getComment());
                stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // Set current timestamp

                count = stmt.executeUpdate();

                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    review.setReviewID(generatedKeys.getInt(1));
                }

                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                count = 0;
            }
        }
        return count;
    }

    // Method to get reviews by hostel ID
    public List<Reviews> getReviewsByHostelID(int hostelID) {
        List<Reviews> reviewsList = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            try {
                String sql = "SELECT * FROM reviews WHERE hostel_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, hostelID);

                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Reviews review = new Reviews(
                            rs.getInt("review_id"),
                            rs.getInt("user_id"),
                            rs.getInt("hostel_id"),
                            rs.getInt("star_number"),
                            rs.getString("comment"),
                            rs.getTimestamp("created_at")
                    );
                    reviewsList.add(review);
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return reviewsList;
    }
}
