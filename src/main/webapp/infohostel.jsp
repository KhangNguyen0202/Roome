<%@page import="Models.User"%>
<%@page import="DAOs.UserDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.RoomTypeDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.ReviewDAO"%>
<%@page import="Models.Reviews"%>
<%@page import="Models.Hostel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hostel Info Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
                position: relative;
            }

            .blur-background-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: -1;
            }

            .blur-background {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('your-background-image.jpg'); /* Replace with your background image */
                background-size: cover;
                background-position: center;
                filter: blur(8px);
            }

            .header {
                background-color: #003580;
                color: white;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .header-left {
                display: flex;
                align-items: center;
            }

            .header img {
                height: 50px;
                vertical-align: middle;
                margin-right: 20px;
            }

            .header nav {
                flex: 1;
                text-align: center;
            }

            .header nav a {
                color: white;
                margin: 0 26px;
                text-decoration: none;
                font-weight: bold;
            }

            .header-right {
                display: flex;
                align-items: center;
            }

            .header-right button {
                background-color: white;
                color: #003580;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                margin-left: 10px;
                cursor: pointer;
                font-weight: bold;
            }

            .hero {
                position: relative;            
                background-size: cover;
                background-position: center;
                height: 400px;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                text-align: center;
                z-index: 1;
            }

            .hero h1 {
                font-size: 48px;
                margin: 0;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            }

            .hero p {
                font-size: 20px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            }

            .hostel-section {
                padding: 50px 20px;
                max-width: 1200px;
                margin: auto;
                background-color: white;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-top: -100px; /* Overlap hero section */
                position: relative;
                z-index: 2;
            }

            .hostel-gallery {
                display: flex;
                gap: 10px;
                overflow-x: auto;
                padding-bottom: 20px;
            }

            .hostel-gallery img {
                width: 200px;
                height: 150px;
                object-fit: cover;
                border-radius: 10px;
                cursor: pointer;
            }

            .hostel-info {
                padding: 20px;
            }

            .hostel-info h2 {
                margin-top: 0;
                font-size: 28px;
                color: #003580;
            }

            .hostel-info p {
                margin: 10px 0;
                font-size: 16px;
            }

            .amenities {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin: 20px 0;
            }

            .amenity {
                background-color: #e9ecef;
                padding: 10px 20px;
                border-radius: 20px;
                display: flex;
                align-items: center;
            }

            .amenity img {
                height: 20px;
                margin-right: 10px;
            }

            .reviews {
                margin-top: 40px;
            }

            .review {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .review h3 {
                margin-top: 0;
                font-size: 20px;
                color: #003580;
            }

            .review p {
                margin: 10px 0;
                font-size: 16px;
            }

            .review-form {
                margin-top: 40px;
            }

            .review-form h3 {
                margin-top: 0;
                font-size: 24px;
                color: #003580;
            }

            .star-rating {
                display: flex;
                font-size: 24px;
                direction: ltr; /* Ensure stars are displayed from left to right */
            }

            .star-rating input {
                display: none;
            }

            .star-rating label {
                cursor: pointer;
                color: #ccc;
            }

            .star-rating input:checked ~ label {
                color: #ffc700;
            }

            .star-rating input:hover ~ label,
            .star-rating input:hover ~ label ~ label {
                color: #ffc700;
            }

            .review-form textarea {
                width: 100%;
                height: 150px;
                padding: 10px;
                border-radius: 10px;
                border: 1px solid #ddd;
                font-size: 16px;
                resize: vertical;
                margin-bottom: 20px;
            }

            .review-form button {
                background-color: #003580;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
            }

            .review-form button:hover {
                background-color: #002b6b;
            }

            /* Modal styles */
            .modal {
                display: none; 
                position: fixed; 
                z-index: 3; 
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.9); 
            }

            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 1000px;
                padding-top: 70px;
            }

            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #fff;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
            Hostel obj = (Hostel) session.getAttribute("hs");
             RoomTypeDAO RoomTypeDao = new RoomTypeDAO();
            int hostelID = obj.getHostel_id();
            ResultSet rs = RoomTypeDao.getRoomImageByHostelID(hostelID); 


UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByHostelId(hostelID);

            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            ResultSet roomDetails = roomTypeDAO.getRoomDetailsByHostelId(hostelID);
            
        %>
        <div class="blur-background-container">
            <div class="blur-background"></div>
        </div>
        <header class="header">
            <div class="header-left">
                <img src="/img/Roome1.jpg" alt="LOGO">
            </div>
            <nav>
                <a href="#">Stays</a>
                <a href="#">Flights</a>
                <a href="#">Flight + Hotel</a>
                <a href="#">Car rentals</a>
                <a href="#">Attractions</a>
                <a href="#">Airport taxis</a>
            </nav>
            <div class="header-right">
                <button>Sign In</button>
                <button>Sign Up</button>
            </div>
        </header>
        <section class="hero" style="background-image: url('/img/<%= obj.getHostel_image() %>');">
            <div>
                  <h1><%= obj.getHostel_name() %></h1>
                <p><%= obj.getAddress_detail()%></p>
            </div>
        </section>
        <section class="hostel-section">          
             <%
                try {
                    while (rs.next()) {
                 
                %>
                 <div class="hostel-gallery">
                    <img src="/img/<%=rs.getString("room_image")%>" onclick="openModal(this)">
                   </div>
                <%
                    }
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        %>
        
          <div class="hostel-info">
                <h2>About the Hostel</h2>
                <p>Price per night: $25</p>
                <p>Owner: <%= user.getUsercall_name() %> <%= user.getUserSurname()%></p>  
                <p>Description: <%= obj.getDescription()%></p>
                
                <h2>About Hostel's Rooms</h2>
             <%
                try {
                    while (roomDetails.next()) {
            %>
                <h3>Room Name: <%= roomDetails.getString("room_name") %></h3>
                <p>Size: <%= roomDetails.getString("room_size") %></p>
                <p>Price: $<%= roomDetails.getBigDecimal("rent_price") %></p>
                <p>Available Rooms: <%= roomDetails.getInt("available_rooms") %></p>
          
            <%
                    }
                    roomDetails.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
              </div>
            <div class="review-form">
                <h3>Leave a Review</h3>
                <form action="${pageContext.request.contextPath}/ReviewController" method="post" onsubmit="return validateReviewForm()">
                    <div class="star-rating">
                        <input type="radio" id="5-stars" name="rating" value="5" />
                        <label for="5-stars" class="star">&#9733;</label>
                        <input type="radio" id="4-stars" name="rating" value="4" />
                        <label for="4-stars" class="star">&#9733;</label>
                        <input type="radio" id="3-stars" name="rating" value="3" />
                        <label for="3-stars" class="star">&#9733;</label>
                        <input type="radio" id="2-stars" name="rating" value="2" />
                        <label for="2-stars" class="star">&#9733;</label>
                        <input type="radio" id="1-star" name="rating" value="1" />
                        <label for="1-star" class="star">&#9733;</label>
                    </div>
                    <textarea name="comment" rows="4" cols="50" placeholder="Write your comment here..." required></textarea>
                    <br>
                    <button type="submit" name="btnSummitCmt">Submit Review</button>
                </form>

            </div>

            <%
                // This logic is typically handled in a servlet, but for debugging, we are doing it here
                
                // Fetch reviews from the database
                ReviewDAO reviewDAO = new ReviewDAO();
                List<Reviews> reviewsList = reviewDAO.getReviewsByHostelID(hostelID);

                // Debugging: Print reviews to the console
                if (reviewsList != null) {
                    for (Reviews review : reviewsList) {
                        System.out.println("Hostel ID that are created by a variable: " + hostelID);
                        System.out.println("Hostel ID after do this and that with the database: " + review.getHostelID());
                        System.out.println("Username: " + review.getUserName());
                        System.out.println("Star: " + review.getStarRating());
                        System.out.println("Comment: " + review.getComment());
                    }
                } else {
                    System.out.println("No reviews found or an error occurred.");
                }
            %>
            <section class="reviews" id="review-section">
                <h2>Reviews</h2>
                <%
                    if (reviewsList != null) {
                        for (Reviews review : reviewsList) {
                %>
                <div class="review">
                    <h3><%= review.getUserName()%></h3>
                    <div>
                        <span class="star">&#9733;</span><span><%= review.getStarRating()%></span>
                    </div>
                    <p><%= review.getComment()%></p>
                    <p><small>Reviewed on: <%= review.getCreatedAt()%></small></p>
                </div>
                <%
                    }
                } else {
                %>
                <p>No reviews found or an error occurred.</p>
                <%
                    }
                %>
            </section>
        
        <!-- The Modal -->
        <div id="myModal" class="modal">
            <span class="close" onclick="closeModal()">&times;</span>
            <img class="modal-content" id="img01">
        </div>
        
        <script>
            function openModal(element) {
                var modal = document.getElementById("myModal");
                var modalImg = document.getElementById("img01");
                modal.style.display = "block";
                modalImg.src = element.src;
            }

            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }
        </script>
    </body>
</html>
