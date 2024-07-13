package Models;

import java.sql.Timestamp;

public class Reviews {

    private int reviewID;
    private int userID;
    private int hostelID;
    private int starRating;
    private String comment;
    private Timestamp createdAt;
    private String userName; // Add username field

    public Reviews(int reviewID, int userID, int hostelID, int starRating, String comment, Timestamp createdAt, String userName) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.hostelID = hostelID;
        this.starRating = starRating;
        this.comment = comment;
        this.createdAt = createdAt;
        this.userName = userName; // Initialize username
    }

    public Reviews(int reviewID, int userID, int hostelID, int starRating, String comment, Timestamp createdAt) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.hostelID = hostelID;
        this.starRating = starRating;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    // Getters and Setters
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

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
