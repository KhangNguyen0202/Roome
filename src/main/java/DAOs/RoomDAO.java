/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.RoomType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nguye
 */
public class RoomDAO {
    public int addNew(RoomType room) {
        Connection conn = DBConnection.getConnection();
        int count = 0;
        if (conn != null) {
            try {
                String sql = "INSERT INTO room_types (hostel_id, room_name, room_size, rent_price, available_rooms, room_image, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, room.getHostel_id());
                stmt.setString(2, room.getRoom_name());
                stmt.setString(3, room.getRoom_size());
                stmt.setDouble(4, room.getRent_price());
                stmt.setInt(5, room.getAvailable_rooms());
                stmt.setString(6, room.getRoom_image());
                   stmt.setTimestamp(7, room.getCreated_at());

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
