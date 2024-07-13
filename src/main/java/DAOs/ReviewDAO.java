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
                stmt.setInt(3, review.getStarRating());
                stmt.setString(4, review.getComment());
                stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

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

    public List<Reviews> getReviewsByHostelID(int hostelID) {
        List<Reviews> reviews = new ArrayList<>();
        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            try {
                String sql = "SELECT r.review_id, r.user_id, r.hostel_id, r.star_number, r.comment, r.created_at, u.username FROM reviews r JOIN users u ON r.user_id = u.user_id WHERE r.hostel_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, hostelID);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    int reviewID = rs.getInt("review_id");
                    int userID = rs.getInt("user_id");
                    int starRating = rs.getInt("star_number");
                    String comment = rs.getString("comment");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    String userName = rs.getString("username");

                    Reviews review = new Reviews(reviewID, userID, hostelID, starRating, comment, createdAt, userName);
                    reviews.add(review);
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } else {
            System.out.println("Failed to establish a database connection.");
        }
        return reviews;
    }
}
