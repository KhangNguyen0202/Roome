/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author nguye
 */

import java.sql.Timestamp;

public class Hostel {
    private int hostel_id;
    private int user_id;
    private String hostel_name;
    private int province_id;
    private String address_detail;
    private String hostel_image;
    private String phone_contact;
    private String description;
    private int total_rooms;
    private Timestamp created_at;

    public Hostel(int hostel_id, int user_id, String hostel_name, int province_id, String address_detail, String hostel_image, String phone_contact, String description, int total_rooms, Timestamp created_at) {
        this.hostel_id = hostel_id;
        this.user_id = user_id;
        this.hostel_name = hostel_name;
        this.province_id = province_id;
        this.address_detail = address_detail;
        this.hostel_image = hostel_image;
        this.phone_contact = phone_contact;
        this.description = description;
        this.total_rooms = total_rooms;
        this.created_at = created_at;
    }

    public Hostel(int user_id, String hostel_name, int province_id, String address_detail, String hostel_image, String phone_contact, String description, int total_rooms, Timestamp created_at) {
        this.user_id = user_id;
        this.hostel_name = hostel_name;
        this.province_id = province_id;
        this.address_detail = address_detail;
        this.hostel_image = hostel_image;
        this.phone_contact = phone_contact;
        this.description = description;
        this.total_rooms = total_rooms;
        this.created_at = created_at;
    }
    
    

    public int getHostel_id() {
        return hostel_id;
    }

    public void setHostel_id(int hostel_id) {
        this.hostel_id = hostel_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getHostel_name() {
        return hostel_name;
    }

    public void setHostel_name(String hostel_name) {
        this.hostel_name = hostel_name;
    }

    public int getProvince_id() {
        return province_id;
    }

    public void setProvince_id(int province_id) {
        this.province_id = province_id;
    }

    public String getAddress_detail() {
        return address_detail;
    }

    public void setAddress_detail(String address_detail) {
        this.address_detail = address_detail;
    }

    public String getHostel_image() {
        return hostel_image;
    }

    public void setHostel_image(String hostel_image) {
        this.hostel_image = hostel_image;
    }

    public String getPhone_contact() {
        return phone_contact;
    }

    public void setPhone_contact(String phone_contact) {
        this.phone_contact = phone_contact;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotal_rooms() {
        return total_rooms;
    }

    public void setTotal_rooms(int total_rooms) {
        this.total_rooms = total_rooms;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    


}
