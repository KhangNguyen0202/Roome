/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class Reviews {
    private int reviewID;
    private int userID;
    private int hostelID;
    private int starNumber;
    private String comment;
    private Timestamp created_at;

    public Reviews() {
    }

    public Reviews(int reviewID, int userID, int hostelID, int starNumber, String comment, Timestamp created_at) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.hostelID = hostelID;
        this.starNumber = starNumber;
        this.comment = comment;
        this.created_at = created_at;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public int getStarNumber() {
        return starNumber;
    }

    public void setStarNumber(int starNumber) {
        this.starNumber = starNumber;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
    
    
    
}
