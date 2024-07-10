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
                width: 40px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 3px;
                padding: -2px 0;
                position: absolute;
                z-index: 1;
                bottom: 0%;
                left: 28%;
                margin-left: -70px;
            }

            /* Popup arrow */
            .popup .popuptext::after {
                content: "";
                position: absolute;
                bottom: 86%;
                left: 95%;
                margin-left: -3px;
                border-width: 5px;
                border-style: solid;
                border-color: transparent transparent #555 #555;
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

           
            input[type="file"] {
                display: none;
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
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">

                            <div class="popup" onclick="myFunction()"><img class="rounded-circle mt-5" height="200px" width="200px" src="Screenshot 2024-01-04 111008.png">
                                <span class="popuptext" id="myPopup">
                                    <input type="file" class="form-control" id="txtPic" name="txtPic">
                                    <label for="txtPic">Edit</label>
                                </span>
                            </div>

                            <span class="font-weight-bold"><%=user.getUsercall_name()%></span>
                            <span class="text-black-50"><%=user.getEmail()%></span>
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
                </div>
            </form>       
        </div>
    </body>
</html>
