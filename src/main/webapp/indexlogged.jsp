<%-- 
    Document   : index
    Created on : Jun 30, 2024, 9:19:25 PM
    Author     : sakak
--%>

<%@page import="DAOs.ProvinceDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.HostelDAO"%>
<%@page import="Models.User"%>
<%@page import="DAOs.UserDAO"%>
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
            width: 50px;
            height: 50px;
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
            .user-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-left: 20px;
                cursor: pointer;
            }
            .sidebar {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1001;
                top: 0;
                right: 0;
                background-color: #003580;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
                color: white;
                border-left: 2px solid #ccc; /* Add border */
            }
            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                display: block;
                transition: 0.3s;
            }
            .sidebar a:hover {
                background-color: #575757;
            }
            .close-btn {
                position: absolute;
                top: 20px;
                right: 25px;
                font-size: 36px;
            }
            .sidebar-header {
                display: flex;
                align-items: center;
                padding: 0 15px;
                margin-bottom: 20px;
                border-bottom: 0.5px solid #ddd;
            }
            .sidebar-header img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                margin-right: 15px;
            }
            .sidebar-header .username {
                font-size: 20px;
                font-weight: bold;
            }
            .search-section {
            background-color: #003580;
            color: white;
            padding: 100px 20px 50px;
            text-align: center;
            margin-top: 45px;
        }
        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 20px;
        }
        .search-bar .search-input,
        .search-bar .search-select {
            background-color: white;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            border: 3px solid blue;
            width: 385px;
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
            width: 400px; /* Match width with search input */
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
            max-height: 200px; /* Set maximum height for scroll */
            overflow-y: auto; /* Enable vertical scrolling */
            border-radius: 5px;
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
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left;
            overflow-y: auto; /* Allow scrolling if content overflows */
            min-height: 500px; /* Set a minimum height */
            background-color: #f4f4f4; /* Optional: Add a background color for better visibility */
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
            cursor: pointer; /* Add cursor pointer */
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
        <%
            UserDAO userdao = new UserDAO();
            User user = userdao.getUserByID(Integer.parseInt(session.getAttribute("user_id") + ""));
        %>
        <header class="header">
            <div class="header-left">
                <img src="\img/Roome1.jpg" alt="LOGO">
            </div>
            <nav>
               <a href="/MainPageController">Home</a>
                <a href="/HostelController/Create">Create</a>
                <a href="/HostelController/List">View your hostel</a>
                <a href="#">Car rentals</a>
                <a href="#">Attractions</a>
                <a href="#">Airport taxis</a>
            </nav>
            <div class="header-right">
                <img src="\img\<%=user.getUser_image()%>" alt="User Avatar" class="user-avatar" onclick="openSidebar()">
            </div>
        </header>
        <div id="sidebar" class="sidebar">
            <a href="javascript:void(0)" class="close-btn" onclick="closeSidebar()">&times;</a>
            <div class="sidebar-header">
                <img src="\img\<%=user.getUser_image()%>" alt="User Avatar">
                <span class="username"><%=user.getUsercall_name()%></span>
            </div>
            <a href="/UserController">Profile</a>
            <a href="#">Bookings</a>
            <a href="#">Settings</a>
            <a href="#">Logout</a>
        </div>
        <section class="search-section">
            <h1>Find your room</h1>
            <p>Search low prices on hotels, homes and much more...</p>
            <div class="search-bar">
                <div class="dropdown">
                    <input type="text" class="search-input" placeholder="Where are you going?" onkeyup="filterFunction()">
                    <div id="dropdown" class="dropdown-content">
                        <%
                            ProvinceDAO provinceDao = new ProvinceDAO();
                            ResultSet rsProvinces = provinceDao.getAllProvince();
                            while (rsProvinces.next()) {
                        %>
                        <div><%= rsProvinces.getString("Province_Name")%></div>
                        <%
                            }
                            rsProvinces.close();
                        %>
                    </div>
                </div>
                <button class="search-button" onclick="searchHostel()">Search</button>
            </div>
        </section>

        <section class="hostel-section" id="hostel-section">
            <%
                HostelDAO hostelDao = new HostelDAO();
                ResultSet rs = hostelDao.getAllApproved();
                while (rs.next()) {
            %>
            <div class="hostel" data-hostel-id="<%=rs.getString("hostel_id")%>" data-address="<%=rs.getString("address_detail")%>">
                <img src="\img\<%=rs.getString("hostel_image")%>" alt="Hostel Image">
                <div class="hostel-info">
                    <input type="hidden" value="<%=rs.getString("hostel_name")%>" readonly>
                    <h2>Hostel Name: <%=rs.getString("hostel_name")%></h2>
                    <p><strong>Address:</strong> <%=rs.getString("address_detail")%></p>
                    <p><strong>Phone contact:</strong> <%=rs.getString("phone_contact")%></p>
                    <p><strong>Description:</strong> <%=rs.getString("description")%></p>
                </div>
            </div>
            <%
                }
                rs.close();
            %>
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

            function searchHostel() {
                var input = document.querySelector('.search-input').value.toUpperCase();
                var hostels = document.querySelectorAll('.hostel');
                hostels.forEach(function (hostel) {
                    var address = hostel.getAttribute('data-address').toUpperCase();
                    if (address.includes(input)) {
                        hostel.style.display = 'flex';
                    } else {
                        hostel.style.display = 'none';
                    }
                });
            }

            document.querySelector('.search-input').addEventListener('focus', function () {
                document.getElementById("dropdown").style.display = "block";
            });

            document.addEventListener('click', function (event) {
                if (!event.target.closest('.dropdown')) {
                    document.getElementById("dropdown").style.display = "none";
                }
            });

            document.querySelectorAll('#dropdown div').forEach(function (item) {
                item.addEventListener('click', function () {
                    document.querySelector('.search-input').value = this.innerText;
                    document.getElementById("dropdown").style.display = "none";
                    searchHostel(); // Trigger search when a province is selected
                });
            });

            // Add click event to each hostel div
            document.querySelectorAll('.hostel').forEach(function (hostel) {
                hostel.addEventListener('click', function () {
                    var hostelId = this.getAttribute('data-hostel-id');
                    window.location.href = '/HostelController/View/' + hostelId;
                });
            });

            function openSidebar() {
                document.getElementById("sidebar").style.width = "250px";
            }

            function closeSidebar() {
                document.getElementById("sidebar").style.width = "0";
            }
        </script>
    </body>
</html>
