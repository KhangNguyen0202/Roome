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
public class RoomType {
    private int room_type_id;
     private int hostel_id;
      private String room_name;
      private String room_size;
      private double rent_price;
      private int available_rooms;
      private String room_image;
       private Timestamp created_at;

    public RoomType(int room_type_id, int hostel_id, String room_name, String room_size, double rent_price, int available_rooms, String room_image, Timestamp created_at) {
        this.room_type_id = room_type_id;
        this.hostel_id = hostel_id;
        this.room_name = room_name;
        this.room_size = room_size;
        this.rent_price = rent_price;
        this.available_rooms = available_rooms;
        this.room_image = room_image;
        this.created_at = created_at;
    }

    public RoomType(int hostel_id, String room_name, String room_size, double rent_price, int available_rooms, String room_image, Timestamp created_at) {
        this.hostel_id = hostel_id;
        this.room_name = room_name;
        this.room_size = room_size;
        this.rent_price = rent_price;
        this.available_rooms = available_rooms;
        this.room_image = room_image;
        this.created_at = created_at;
    }

    public RoomType() {
    }

   

   
    

    public int getRoom_type_id() {
        return room_type_id;
    }

    public void setRoom_type_id(int room_type_id) {
        this.room_type_id = room_type_id;
    }

    public int getHostel_id() {
        return hostel_id;
    }

    public void setHostel_id(int hostel_id) {
        this.hostel_id = hostel_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getRoom_size() {
        return room_size;
    }

    public void setRoom_size(String room_size) {
        this.room_size = room_size;
    }

    public double getRent_price() {
        return rent_price;
    }

    public void setRent_price(double rent_price) {
        this.rent_price = rent_price;
    }

    public int getAvailable_rooms() {
        return available_rooms;
    }

    public void setAvailable_rooms(int available_rooms) {
        this.available_rooms = available_rooms;
    }

    public String getRoom_image() {
        return room_image;
    }

    public void setRoom_image(String room_image) {
        this.room_image = room_image;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    
}
