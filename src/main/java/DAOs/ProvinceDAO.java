/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class ProvinceDAO {

    public ResultSet getAllProvince() {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;

        if (conn != null) {
            try {
                Statement st = conn.createStatement();
                rs = st.executeQuery("Select * from province");

            } catch (SQLException ex) {
                rs = null;
            }
        }
        return rs;
    }

    public ResultSet getProvinceFromID(int province_id) {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;

        if (conn != null) {
            try {
                String query = "SELECT * FROM province WHERE province_ID = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, province_id);
                rs = ps.executeQuery();
            } catch (SQLException ex) {
                ex.printStackTrace();
                rs = null;
            }
        }
        return rs;
    }

    public ResultSet getProvinceName(int province_id) {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;
        if (conn != null) {
            try {
                String query = "SELECT province_Name FROM province WHERE province_ID = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, province_id);
                rs = ps.executeQuery();
            } catch (SQLException ex) {
                ex.printStackTrace();
                rs = null;
            }
        }
        return rs;
    }
     public int getProvinceIDByName(String province_name) {
        int province_ID = -1; // Default value in case the category is not found
        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            try {
                String sql = "SELECT province_ID FROM province WHERE cat_name = ?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, province_name);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    province_ID = rs.getInt("province_ID");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return province_ID;
    }
}
