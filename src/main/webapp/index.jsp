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
    <title>Booking Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
            align-items: left;
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
        }
        .search-section {
            background-color: #003580;
            color: white;
            padding: 50px 20px;
            text-align: center;
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
        .offers-section {
            padding: 50px 20px;
            text-align: center;
        }
        .offers-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        .offer {
            margin: 20px;
            display: inline-block;
            width: 300px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .offer img {
            width: 100%;
        }
        .offer-text {
            padding: 20px;
        }
        .h1 {
            text-align: left;
            padding-left: 14.2rem;
        }
        .text-left {
            text-align: left;
            padding-left: 14.2rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-left">
            <img src="logo.png" alt="LOGO">
        </div>
        <nav>
            <a href="createhostel.jsp">Stays</a>
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
    <section class="offers-section">
        
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
        document.querySelector('.search-input').addEventListener('focus', function() {
            document.getElementById("dropdown").style.display = "block";
        });
        document.addEventListener('click', function(e) {
            if (!e.target.matches('.search-input')) {
                document.getElementById("dropdown").style.display = "none";
            }
        });
        document.querySelectorAll('#dropdown div').forEach(function(item) {
            item.addEventListener('click', function() {
                document.querySelector('.search-input').value = this.innerText;
                document.getElementById("dropdown").style.display = "none";
            });
        });
    </script>
</body>
</html>







