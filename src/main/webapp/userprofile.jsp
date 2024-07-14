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
                from { opacity: 0; }
                to { opacity: 1; }
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
        </style>
    </head>

    <body>
        <%
            UserDAO userdao = new UserDAO();
            int user_id = Integer.parseInt(session.getAttribute("user_id") + "");
            User user = userdao.getUserByID(user_id);
        %>
        <div class="container rounded bg-white mt-5 mb-5">
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
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
