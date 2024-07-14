/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Hostel;
import Models.RoomType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nguye
 */
public class RoomTypeDAO {
  public ResultSet getRoomImageByHostelID(int hostel_id) {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;
        try {
            String sql = "SELECT room_image FROM room_types WHERE hostel_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, hostel_id);
            rs = pst.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }
  
  public ResultSet getRoomDetailsByHostelId(int hostelId) {
        ResultSet rs = null;
        Connection conn = DBConnection.getConnection();
        try {
            String sql = "SELECT room_name, room_size, rent_price, available_rooms FROM room_types WHERE hostel_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, hostelId);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
