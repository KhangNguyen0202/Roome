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
                rs = st.executeQuery("Select * from Province");

            } catch (SQLException ex) {
                rs = null;
            }
        }
        return rs;
    }

    public ResultSet getProvinceFromID(int cat_id) {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;

        if (conn != null) {
            try {
                String query = "SELECT * FROM [Province] WHERE Province_ID = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, cat_id);
                rs = ps.executeQuery();
            } catch (SQLException ex) {
                ex.printStackTrace();
                rs = null;
            }
        }
        return rs;
    }

    public ResultSet getProvinceName(int cat_id) {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;
        if (conn != null) {
            try {
                String query = "SELECT cat_name FROM [Category] WHERE cat_id = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, cat_id);
                rs = ps.executeQuery();
            } catch (SQLException ex) {
                ex.printStackTrace();
                rs = null;
            }
        }
        return rs;
    }
}
