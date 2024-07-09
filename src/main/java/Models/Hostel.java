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
    private int landlord_id;
    private String hostel_name;
    private String address;
    private String phone_contact;
    private String description;
    private Timestamp created_at;

    // Constructor
    public Hostel(int hostel_id, int landlord_id, String hostel_name, String address, String phone_contact, String description, Timestamp created_at) {
        this.hostel_id = hostel_id;
        this.landlord_id = landlord_id;
        this.hostel_name = hostel_name;
        this.address = address;
        this.phone_contact = phone_contact;
        this.description = description;
        this.created_at = created_at;
    }

    // Getters and Setters
    public int getHostel_id() {
        return hostel_id;
    }

    public void setHostel_id(int hostel_id) {
        this.hostel_id = hostel_id;
    }

    public int getLandlord_id() {
        return landlord_id;
    }

    public void setLandlord_id(int landlord_id) {
        this.landlord_id = landlord_id;
    }

    public String getHostel_name() {
        return hostel_name;
    }

    public void setHostel_name(String hostel_name) {
        this.hostel_name = hostel_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
