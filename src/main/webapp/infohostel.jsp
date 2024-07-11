<%-- 
    Document   : index
    Created on : Jun 30, 2024, 9:19:25 PM
    Author     : sakak
--%>

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
            background-image: url('hostel-main-image.jpg'); /* Replace with your main hostel image */
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
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
    </style>
</head>
<body>
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
            <img src="hostel1.jpg" alt="Hostel Image 1">
            <img src="hostel2.jpg" alt="Hostel Image 2">
            <img src="hostel3.jpg" alt="Hostel Image 3">
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
    </section>
</body>
</html>




