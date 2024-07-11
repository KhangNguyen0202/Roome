<%-- 
    Document   : userprofile
    Created on : Jul 9, 2024, 11:05:40 AM
    Author     : sakak
--%>

<%@page import="Models.User"%>
<%@page import="DAOs.UserDAO"%>
<%@page import="DB.DBConnection"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: rgb(128, 151, 189)
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(128, 151, 189);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }

            /* Popup container - can be anything you want */
            .popup {
                position: relative;
                display: inline-block;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            /* The actual popup */
            .popup .popuptext {
                visibility: hidden;
                width: 100px;
                height: 25px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 3px;
                position: absolute;
                z-index: 1;
                bottom: -42px;
                left: -30px;
                margin-left: -50px;
            }

            /* Popup arrow */
            .popup .popuptext::after {
                content: "";
                position: absolute;
                bottom: 100%;
                left: 5%;
                margin-left: -3px;
                border-width: 5px;
                border-style: solid;
                border-color: transparent transparent #555 transparent ;
            }

            /* Toggle this class - hide and show the popup */
            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }

            /* Add animation (fade in the popup) */
            @-webkit-keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity:1 ;
                }
            }
            /* Button styles */
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
                top: -25px; /* Adjust this value as needed */
                left: -80px; /* Adjust this value as needed */

            }

            .image-container {
                width: 170px; /* Adjust width and height to your desired circle size */
                height: 170px;
                border-radius: 50%; /* Ensures the container itself is a circle */
                overflow: hidden;
                position: relative; /* Ensures proper positioning for child elements */
            }

            .image-container img {
                width: 100%;
                height: 100%; /* Ensures the image fills the circular container */
                object-fit: cover; /* Crops the image to fit within the circle */
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

        </style>
    </head>

    <body>
        <%
            UserDAO userdao = new UserDAO();
            User user = userdao.getUserByID(1);
        %>
        <div class="container rounded bg-white mt-5 mb-5">


            <script>
                // When the user clicks on div, open the popup
                function myFunction() {
                    var popup = document.getElementById("myPopup");
                    popup.classList.toggle("show");
                }
            </script>
            <form method="post" action="/UserController" enctype="multipart/form-data">
                <div class="row">
                    <%--User data --%>
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-left p-3 py-5">
                            <div class="w-100">
                                <label class="labels">Profile picture</label>
                            </div>

                            <div class="image-container">
                                <img class="rounded-circle img-fluid" src="<%=user.getUser_image()%>" alt="Your Image">
                            </div>

                            <div class="popup" onclick="myFunction()"> <button type="button" class="edit-button">Edit</button>                               
                                <span class="popuptext" id="myPopup">
                                    <input type="file" class="form-control" id="txtPic" name="txtPic" style="display: none;">
                                    <label for="txtPic">Choose a file</label> 
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <label class="labels">Name</label>
                                    <input type="text" class="form-control" placeholder="<%=user.getUsercall_name()%>" value="">
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">Surname</label>
                                    <input type="text" class="form-control" value="" placeholder="<%=user.getUserSurname()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Mobile Number</label>
                                    <input type="text" class="form-control" placeholder="<%=user.getPhone_number()%>" value="">
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input type="text" class="form-control" placeholder="<%=user.getAddress()%>" value="">
                                </div>  
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control" placeholder="<%=user.getEmail()%>" value="">
                                </div>  

                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit" name="btnSave">Save Profile</button>
                            </div>
                        </div>                    
                    </div>
                    <%--End User data --%>

                    <%--User hostel --%>            
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience">
                                <span>Edit Experience</span>
                                <span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span>
                            </div>
                            <br>
                            <div class="col-md-12">
                                <label class="labels">Experience in Designing</label>
                                <input type="text" class="form-control" placeholder="experience" value="">
                            </div>
                            <br>
                            <div class="col-md-12">
                                <label class="labels">Additional Details</label>
                                <input type="text" class="form-control" placeholder="additional details" value="">
                            </div>
                        </div>
                    </div>
                    <%-- End User hostel --%>             
                </div>

            </form> 

        </div>
    </body>
</html>
