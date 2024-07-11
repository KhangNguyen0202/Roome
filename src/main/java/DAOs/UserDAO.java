/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import DB.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Statement;

/**
 *
 * @author nguye
 */
public class UserDAO {

    public ResultSet getAll() {
        Connection conn = DBConnection.getConnection();
        ResultSet rs = null;

        if (conn != null) {
            try {
                Statement st = conn.createStatement();
                rs = st.executeQuery("Select * from Product");

            } catch (Exception ex) {
                rs = null;
            }
        }
        return rs;
    }

    public User getUserByID(int pro_id) {
        Connection conn = DBConnection.getConnection();
        User obj;
        try {
            String sql = "select * from users where user_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pro_id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                obj = new User();
                obj.setUser_id(rs.getInt("user_id"));
                obj.setUsername(rs.getString("username"));
                obj.setUsercall_name(rs.getString("usercall_name"));
                obj.setUserSurname(rs.getString("usersurname"));
                obj.setEmail(rs.getString("email"));
                obj.setPhone_number(rs.getString("phone_number"));
                obj.setAddress(rs.getString("address"));
                obj.setUser_image(rs.getString("user_image"));
                obj.setUser_type(rs.getString("user_type"));
                obj.setCreated_at(rs.getTimestamp("created_at"));
            } else {
                obj = null;
            }
        } catch (Exception ex) {
            obj = null;
        }
        return obj;
    }

    public boolean login(User acc) {
        Connection conn = DBConnection.getConnection();
        try {
            String sql = "select * from users where username =? and password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, acc.getUsername());
            pst.setString(2, md5Hash(acc.getPassword()));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }

    public String md5Hash(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte aByte : bytes) {
            sb.append(Integer.toString((aByte & 0xff) + 0x100, 16).substring(1).toUpperCase());
        }
        return sb.toString();
    }

}
