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
                background-image: url('img/hostel1.jpg'); /* Replace with your main hostel image */
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
                overflow-x: scroll;
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
        <div class="blur-background-container">
            <div class="blur-background"></div>
        </div>
        <header class="header">
            <div class="header-left">
                <img src="img/Roome1.jpg" alt="LOGO">
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
        <section class="hero">
            <div>
                <h1>Hostel Name</h1>
                <p>123 Hostel Street, City, Country</p>
            </div>
        </section>
        <section class="hostel-section">
            <div class="hostel-gallery">
                <img src="img/hostel1.jpg" alt="Hostel Image 1" onclick="openModal(this)">
                <img src="img/hostel1.jpg" alt="Hostel Image 2" onclick="openModal(this)">
                <img src="img/hostel1.jpg" alt="Hostel Image 3" onclick="openModal(this)">
                <!-- Add more images as needed -->
            </div>
            <div class="hostel-info">
                <h2>About the Hostel</h2>
                <p>Price per night: $25</p>
                <div class="amenities">
                    <div class="amenity">
                        <img src="wifi-icon.png" alt="Free Wi-Fi"> Free Wi-Fi
                    </div>
                    <div class="amenity">
                        <img src="breakfast-icon.png" alt="Breakfast included"> Breakfast included
                    </div>
                    <div class="amenity">
                        <img src="kitchen-icon.png" alt="Shared kitchen"> Shared kitchen
                    </div>
                    <div class="amenity">
                        <img src="reception-icon.png" alt="24-hour reception"> 24-hour reception
                    </div>
                </div>
                <p>Description: This is a wonderful hostel located in the heart of the city. It offers comfortable accommodation at an affordable price.</p>
            </div>
            <div class="reviews">
                <h2>Reviews</h2>
                <div class="review">
                    <h3>John Doe</h3>
                    <p>★★★★☆</p>
                    <p>Great place to stay! Very clean and friendly staff.</p>
                </div>
                <div class="review">
                    <h3>Jane Smith</h3>
                    <p>★★★★★</p>
                    <p>Absolutely loved this hostel. The location is perfect and the amenities are top-notch.</p>
                </div>
                <!-- Add more reviews as needed -->
            </div>
            <div class="review-form">
                <h3>Leave a Review</h3>
                <form action="${pageContext.request.contextPath}/ReviewController" method="post">
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
