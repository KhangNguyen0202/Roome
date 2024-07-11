
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class User {

    private int user_id;
    private String username;
    private String usercall_name;
    private String userSurname;
    private String password;
    private String email;
    private String phone_number;
    private String address;
    private String user_image;
    private String user_type;
    private Timestamp created_at;

    public User(int user_id, String username, String usercall_name, String userSurname, String email, String phone_number, String address, String user_image, String user_type, Timestamp created_at) {
        this.user_id = user_id;
        this.username = username;
        this.usercall_name = usercall_name;
        this.userSurname = userSurname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.user_image = user_image;
        this.user_type = user_type;
        this.created_at = created_at;
    }
    public User(int user_id, String usercall_name, String userSurname, String email, String phone_number, String address) {
        this.user_id = user_id;
        this.usercall_name = usercall_name;
        this.userSurname = userSurname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User() {
    }

    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsercall_name() {
        return usercall_name;
    }

    public void setUsercall_name(String usercall_name) {
        this.usercall_name = usercall_name;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUser_image() {
        return user_image;
    }

    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
