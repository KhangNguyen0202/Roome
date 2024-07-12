/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import Models.Hostel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class HostelDAO {

    public int addNew(Hostel hostel) {
        Connection conn = DBConnection.getConnection();
    int hostelId = 0;
    if (conn != null) {
        try {
            String sql = "INSERT INTO hostels (user_id, hostel_name, province_id, address_detail, hostel_image, phone_contact, description, total_rooms, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, hostel.getUser_id());
            stmt.setString(2, hostel.getHostel_name());
            stmt.setInt(3, hostel.getProvince_id());
            stmt.setString(4, hostel.getAddress_detail());
            stmt.setString(5, hostel.getHostel_image());
            stmt.setString(6, hostel.getPhone_contact());
            stmt.setString(7, hostel.getDescription());
            stmt.setInt(8, hostel.getTotal_rooms());
            stmt.setTimestamp(9, hostel.getCreated_at());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Get the auto-generated hostel_id
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    hostelId = generatedKeys.getInt(1);
                }
            }
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return hostelId;
}


    public ResultSet getAll() {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;

        if (conn != null) {
            try {
                Statement st = conn.createStatement();
                rs = st.executeQuery("Select * from hostels");

            } catch (Exception ex) {
                rs = null;
            }
        }
        return rs;
    }

}
