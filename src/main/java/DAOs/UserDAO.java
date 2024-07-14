
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
import java.sql.SQLException;
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
            pst.setString(2, (acc.getPassword()));
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

    public int updateProduct(int user_id, User newinfo) {
        Connection conn = DBConnection.getConnection();
        int count;
        try {
            String sql = "UPDATE users SET username = ?, usercall_name = ?, usersurname = ?, email=? , phone_number=? , address=? , user_image=? WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, newinfo.getUsername());
            pst.setString(2, newinfo.getUsercall_name());
            pst.setString(3, newinfo.getUsername());
            pst.setString(4, newinfo.getEmail());
            pst.setString(5, newinfo.getPhone_number());
            pst.setString(6, newinfo.getAddress());
            pst.setString(7, newinfo.getUser_image());
            pst.setInt(8, user_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            count = 0;
        }
        return count;
    }

    public int updateUserInfo(int user_id, User newinfo) {
        Connection conn = DBConnection.getConnection();
        int count;
        try {
            String sql = "UPDATE users SET usercall_name = ?, usersurname = ?, email=? , phone_number=? , address=? WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, newinfo.getUsercall_name());
            pst.setString(2, newinfo.getUserSurname());
            pst.setString(3, newinfo.getEmail());
            pst.setString(4, newinfo.getPhone_number());
            pst.setString(5, newinfo.getAddress());
            pst.setInt(6, user_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            count = 0;
        }
        return count;
    }

    public int updateUserImg(int user_id, String img) {
        Connection conn = DBConnection.getConnection();
        int count;
        try {
            String sql = "UPDATE users SET user_image=? WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, img);

            pst.setInt(2, user_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            count = 0;
        }
        return count;
    }

    public boolean isUsernameTaken(String username) {
        boolean exists = false;
        Connection conn = DBConnection.getConnection();
        try {
            String sql = "SELECT username FROM users WHERE username = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            exists = rs.next();
        } catch (SQLException e) {

        }
        return exists;
    }

    public int addUser(User user) {
        Connection conn = DBConnection.getConnection();
        int count = 0;
        if (conn != null) {
            try {
                String sql = "INSERT INTO users (username,usercall_name,usersurname, password,email,phone_number,address,user_type) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, user.getUsername());
                pst.setString(2, user.getUsercall_name());
                pst.setString(3, user.getUserSurname());
                pst.setString(4, user.getPassword());
                pst.setString(5, user.getEmail());
                pst.setString(6, user.getPhone_number());
                pst.setString(7, user.getAddress());
                pst.setString(8, user.getUser_type());                
                count = pst.executeUpdate();
            } catch (SQLException e) {
                count = 0;
            }
        }
        return count;
    }

    public int getUserIdByUser(String username) {
        Connection conn = DBConnection.getConnection();
        User obj;
        try {
            String sql = "select user_id from users where username= ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                obj = new User();
                obj.setUser_id(rs.getInt("user_id"));
            } else {
                obj = null;
            }
        } catch (Exception ex) {
            obj = null;
        }
        return obj.getUser_id();
    }
}
