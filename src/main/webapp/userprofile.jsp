<%-- 
    Document   : userprofile
    Created on : Jul 9, 2024, 11:05:40 AM
    Author     : sakak
--%>

<%@page import="Models.Hostel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.HostelDAO"%>
<%@page import="Models.User"%>
<%@page import="DAOs.UserDAO"%>
<%@page import="DB.DBConnection"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: rgb(128, 151, 189);
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8;
            }

            .profile-button {
                background: rgb(128, 151, 189);
                box-shadow: none;
                border: none;
            }

            .profile-button:hover,
            .profile-button:focus,
            .profile-button:active {
                background: #682773;
                box-shadow: none;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }

            .labels {
                font-size: 11px;
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8;
            }

            .popup {
                position: relative;
                display: inline-block;
                cursor: pointer;
                user-select: none;
            }

            .popup .popuptext {
                visibility: hidden;
                width: auto;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 3px;
                position: absolute;
                z-index: 1;
                top: 12px;
                left: -30px;
                padding: 5px;
            }

            .popup .popuptext::after {
                content: "";
                position: absolute;
                bottom: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: transparent transparent #555 transparent;
            }

            .popup .show {
                visibility: visible;
                animation: fadeIn 1s;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            button {
                color: white;
                font-size: 16px;
                border: 2px solid #000;
                background-color: black;
                transition: all 0.3s ease;
                border-radius: 3px;
                border-color: grey;
            }

            button:focus, button:active {
                color: white;
                border: 2px solid #000;
                background-color: black;
                outline: none;
                border-color: grey;
            }

            .edit-button {
                position: absolute;
                top: -25px;
                left: -80px;
            }

            .image-container {
                width: 170px;
                height: 170px;
                border-radius: 50%;
                overflow: hidden;
                position: relative;
            }

            .image-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .hostel-section {
                max-height: 600px;
                overflow-y: auto;
            }

            .hostel-card {
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 20px;
                padding: 15px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .hostel-card img {
                max-width: 100%;
                height: auto;
                max-height: 200px;
                object-fit: cover;
                border-radius: 5px;
            }

            .hostel-info {
                margin-top: 15px;
            }
            #modal-container {
                display: none; /* Hide the modal by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                align-items: center;
                justify-content: center;
                z-index: 1002; /* Make sure it covers the sidebar */
            }

            #modal {
                background: white;
                max-width: 500px;
                width: 100%;
                margin: 0 20px; /* Margin for better mobile view */
                position: relative;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                animation: showModal 0.3s ease;
            }

            #modal .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                border-bottom: 1px solid #ddd;
            }

            #modal .modal-header h3 {
                margin: 0;
                font-size: 24px;
            }

            .modal-close-btn {
                outline: none;
                border: none;
                background: none;
                font-size: 24px;
                cursor: pointer;
            }

            #modal .modal-body {
                padding: 20px;
                font-size: 18px;
                line-height: 1.5;
            }

            #modal .modal-footer {
                padding: 20px;
                border-top: 1px solid #ddd;
                display: flex;
                justify-content: flex-end;
            }

            #modal .modal-footer a {
                padding: 10px 20px;
                background-color: #0071c2;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                cursor: pointer;
                font-size: 16px;
            }

            @keyframes showModal {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .header {
                background-color: #003580;
                color: white;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;

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
        </style>
    </head>

    <body>
        <%
            UserDAO userdao = new UserDAO();
            int user_id = Integer.parseInt(session.getAttribute("user_id") + "");
            User user = userdao.getUserByID(user_id);
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
            <a id="logoutLink" onclick="openModal()">Logout</a>
        </div>
        <div id="modal-container">
            <div id="modal">
                <div class="modal-header">
                    <h3>Sign Out</h3>
                    <a class="modal-close-btn" onclick="closeModal()">&times;</a>
                </div>
                <div class="modal-body">
                    <p>Are you want to sign out</p>
                </div>
                <div class="modal-footer">
                    <a href="/MainPageController/LogOut">Sign Out</a>
                </div>
            </div>
        </div>
        <div class="container rounded bg-white mt-2 mb-5">

            <div class="row">

                <!-- Profile Picture Form -->
                <div class="col-md-4 border-right">
                    <form method="post" action="/UserController" enctype="multipart/form-data">
                        <div class="d-flex flex-column align-items-center text-left p-3 py-5">
                            <div class="w-100">
                                <label class="labels">Profile picture</label>                                
                            </div>

                            <div class="image-container">
                                <img class="rounded-circle img-fluid" src="img/<%=user.getUser_image()%>" alt="Your Image">
                                <input type="hidden" id="txtHidPic" name="txtHidPic" value="img/<%=user.getUser_image()%>">
                            </div>

                            <div class="popup" onclick="myFunction()">
                                <button type="button" class="edit-button">Edit</button>
                                <span class="popuptext" id="myPopup">
                                    <input type="file" class="form-control" id="txtPic" name="txtPic" onchange="updateLabel()" style="display: none" accept="image/*">
                                    <label for="txtPic" id="fileLabel">Choose an image</label>
                                    <button type="submit" name="uploadImg">Change</button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- User Data Form -->
                <div class="col-md-4">
                    <form method="post" action="/UserController" enctype="multipart/form-data">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">Name</label>
                                    <input type="text" class="form-control" id="txtCallName" name="txtCallName" value="<%=user.getUsercall_name()%>">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Surname</label>
                                    <input type="text" class="form-control" id="txtUserSurname" name="txtUserSurname" value="<%=user.getUserSurname()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Mobile Number</label>
                                    <input type="text" class="form-control" id="txtPhoneNumber" name="txtPhoneNumber" value="<%=user.getPhone_number()%>">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input type="text" class="form-control" id="txtAddress" name="txtAddress" value="<%=user.getAddress()%>">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control" id="txtEmail" name="txtEmail" value="<%=user.getEmail()%>">
                                </div>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit" name="btnSave">Save Profile</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- User Hostel Data Form -->
                <div class="col-md-4">
                    <form method="post" action="/UserController" enctype="multipart/form-data">
                        <section class="hostel-section" id="hostel-section">
                            <%
                                HostelDAO hostelDao = new HostelDAO();
                                ResultSet rs = hostelDao.getAll();
                                while (rs.next()) {
                                    if (rs.getInt("user_id") == user_id) {
                            %>
                            <div class="hostel-card">
                                <img src="/img/<%=rs.getString("hostel_image")%>" alt="Hostel Image">
                                <div class="hostel-info">
                                    <h5>Hostel Name: <%=rs.getString("hostel_name")%></h5>
                                    <p><strong>Address:</strong> <%=rs.getString("address_detail")%></p>
                                    <p><strong>Phone contact:</strong> <%=rs.getString("phone_contact")%></p>
                                    <p><strong>Description:</strong> <%=rs.getString("description")%></p>
                                </div>
                            </div>
                            <%
                                    }
                                }
                                rs.close();
                            %>
                        </section>
                    </form>
                </div>
            </div>
        </div>
        <script>
            // When the user clicks on div, open the popup
            function myFunction() {
                var popup = document.getElementById("myPopup");
                popup.classList.toggle("show");
            }
            function updateLabel() {
                var fileInput = document.getElementById('txtPic');
                var fileLabel = document.getElementById('fileLabel');

                // Check if a file is selected
                if (fileInput.files.length > 0) {
                    var fileName = fileInput.files[0].name;
                    fileLabel.innerText = fileName; // Update label text with file name
                } else {
                    fileLabel.innerText = "Choose an image"; // Reset label text if no file selected
                }
            }
            function openSidebar() {
                document.getElementById("sidebar").style.width = "250px";
            }

            function closeSidebar() {
                document.getElementById("sidebar").style.width = "0";
            }
            function openModal() {
                document.getElementById("modal-container").style.display = "flex";
            }

            function closeModal() {
                document.getElementById("modal-container").style.display = "none";
            }

            // Adding event listener to close button
            document.querySelector('.modal-close-btn').addEventListener('click', closeModal);
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
