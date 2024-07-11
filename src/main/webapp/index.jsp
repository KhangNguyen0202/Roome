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
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #003580;
            color: white;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
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
        
         .header img {
            height: 70px; 
            vertical-align: middle;
            margin-left: 20px;
        }
        
         .header-left {
            display: flex;
            align-items: center;
        }
        
        .header-right {
            display: flex;
            align-items: center;
            margin-right: 30px;
        }
        .header-right button {
            background-color: white;
            color: #003580;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            margin-left: 10px;
            cursor: pointer;
        }
        .search-section {
            background-color: #003580;
            color: white;
            padding: 100px 20px 50px;
            text-align: center;
            margin-top: 80px;
        }
        .search-section h1 {
            margin: 0;
            font-size: 36px;
        }
        .search-bar {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 20px;
        }
        .search-bar .search-input,
        .search-bar .search-date,
        .search-bar .search-select {
            background-color: white;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            border: 3px solid blue;
            width: 200px;
        }
        .search-bar .search-button {
            background-color: #0071c2;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            padding: 14.7px 32px;
            border: none;
        }
        .dropdown {
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            width: 100%;
            border: 1px solid #ddd;
            z-index: 1;
            top: 100%; /* Align directly below the search input */
            left: 0;
        }
        .dropdown-content div {
            color: black;
            padding: 12px 16px;
            cursor: pointer;
        }
        .dropdown-content div:hover {
            background-color: #f1f1f1;
        }
        .hostel-section {
            padding: 50px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left;
            overflow-y: auto;
            max-height: calc(100vh - 160px); /* Adjust to fit within the viewport */
        }
        .hostel {
            display: flex;
            gap: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            background-color: white;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .hostel:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
        }
        .hostel-section img {
            width: 300px;
            height: 200px;
            object-fit: cover;
        }
        .hostel-info {
            padding: 20px;
            flex: 1;
        }
        .hostel-info h2 {
            margin-top: 0;
            color: #003580;
        }
        .hostel-info p {
            margin: 8px 0;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-left">
            <img src="img/Roome1.jpg" alt="LOGO">
        </div>
        <nav>
            <a href="infohostel.jsp">Info</a>
            <a href="createhostel.jsp">Create</a>
            <a href="userprofile.jsp">User</a>
            <a href="#">Car rentals</a>
            <a href="#">Attractions</a>
            <a href="#">Airport taxis</a>
        </nav>
        <div class="header-right">
            <button>Sign In</button>
            <button>Sign Up</button>
        </div>
    </header>
    <section class="search-section">
        <h1 class="text-left">Find your room</h1>
        <p class="text-left">Search low prices on hotels, homes and much more...</p>
        <div class="search-bar">
            <div class="dropdown">
                <input type="text" class="search-input" placeholder="Where are you going?" onkeyup="filterFunction()">
                <div id="dropdown" class="dropdown-content">
                    <div>Can Tho, Vietnam</div>
                    <div>Da Lat, Vietnam</div>
                    <div>Vung Tau, Vietnam</div>
                    <div>Phu Quoc, Vietnam</div>
                    <div>Ho Chi Minh City, Vietnam</div>
                </div>
            </div>
            <input type="text" class="search-date" placeholder="Check-in/out date">
            <select class="search-select">
                <option>2 adults · 0 children · 1 room</option>
            </select>
            <button class="search-button">Search</button>
        </div>
    </section>
    <section class="hostel-section">
        <div class="hostel">
            <img src="hostel1.jpg" alt="Hostel Image">
            <div class="hostel-info">
                <h2>Hostel Name</h2>
                <p><strong>Address:</strong> 123 Hostel Street, City, Country</p>
                <p><strong>Price per night:</strong> $25</p>
                <p><strong>Amenities:</strong> Free Wi-Fi, Breakfast included, Shared kitchen, 24-hour reception</p>
                <p><strong>Description:</strong> This is a wonderful hostel located in the heart of the city. It offers comfortable accommodation at an affordable price.</p>
            </div>
        </div>
        <!-- Add more hostels as needed -->
        <div class="hostel">
            <img src="hostel2.jpg" alt="Hostel Image">
            <div class="hostel-info">
                <h2>Another Hostel</h2>
                <p><strong>Address:</strong> 456 Another Street, City, Country</p>
                <p><strong>Price per night:</strong> $30</p>
                <p><strong>Amenities:</strong> Free Wi-Fi, Pool, Gym, 24-hour reception</p>
                <p><strong>Description:</strong> A great place to stay with excellent facilities and a central location.</p>
            </div>
        </div>
    </section>
    <script>
        function filterFunction() {
            var input, filter, div, i;
            input = document.querySelector('.search-input');
            filter = input.value.toUpperCase();
            div = document.querySelectorAll('#dropdown div');
            document.getElementById("dropdown").style.display = "block";
            for (i = 0; i < div.length; i++) {
                txtValue = div[i].textContent || div[i].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    div[i].style.display = "";
                } else {
                    div[i].style.display = "none";
                }
            }
        }
        document.querySelector('.search-input').addEventListener('focus', function () {
            document.getElementById("dropdown").style.display = "block";
        });
        document.addEventListener('click', function (e) {
            if (!e.target.matches('.search-input')) {
                document.getElementById("dropdown").style.display = "none";
            }
        });
        document.querySelectorAll('#dropdown div').forEach(function (item) {
            item.addEventListener('click', function () {
                document.querySelector('.search-input').value = this.innerText;
                document.getElementById("dropdown").style.display = "none";
            });
        });
    </script>
</body>
</html>




