/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Reviews;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class ReviewDAO {

         public int createReview(Reviews review) {
        Connection conn = DBConnection.getConnection();
        int count = 0;
        if (conn != null) {
            try {
                String sql = "INSERT INTO Reviews (review_id, user_id, hostel_id, star_number, comment, created_at) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, review.getReviewID());
                stmt.setInt(2, review.getUserID());
                stmt.setInt(3, review.getHostelID());
                stmt.setInt(4, review.getStarNumber());
                stmt.setString(5, review.getComment());
                stmt.setTimestamp(6, review.getCreated_at());

                count = stmt.executeUpdate();
                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                count = 0;
            }
        }
        return count;
    }
}
