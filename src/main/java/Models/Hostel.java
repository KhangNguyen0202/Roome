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
    private int province_id;
    private String address_detail;
    private String hostel_image;
    private String phone_contact;
    private String description;
    private Timestamp created_at;

    public Hostel(int hostel_id, int landlord_id, String hostel_name, int province_id, String address_detail, String hostel_image, String phone_contact, String description, Timestamp created_at) {
        this.hostel_id = hostel_id;
        this.landlord_id = landlord_id;
        this.hostel_name = hostel_name;
        this.province_id = province_id;
        this.address_detail = address_detail;
        this.hostel_image = hostel_image;
        this.phone_contact = phone_contact;
        this.description = description;
        this.created_at = created_at;
    }

    public Hostel(int landlord_id, String hostel_name, int province_id, String address_detail, 
                  String hostel_image, String phone_contact, String description, Timestamp created_at) {
        this.landlord_id = landlord_id;
        this.hostel_name = hostel_name;
        this.province_id = province_id;
        this.address_detail = address_detail;
        this.hostel_image = hostel_image;
        this.phone_contact = phone_contact;
        this.description = description;
        this.created_at = created_at;
    }

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

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }


}
