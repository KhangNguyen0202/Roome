<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.HostelDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Hostel Create Request</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
            }
            .container {
                margin-top: 50px;
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .hostel {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .hostel img {
                width: 100%;
                height: auto;
                margin-bottom: 20px;
            }
            .hostel-info {
                text-align: left;
            }
            .btn-container {
                margin-top: 20px;
            }
            .btn-container form {
display: inline-block;
                margin-right: 10px;
            }
        </style>
        <script>
            function promptRejectionReason(hostelId) {
                var reason = prompt("Please enter the reason for rejection:");
                if (reason != null && reason.trim() !== "") {
                    document.getElementById('rejectReason_' + hostelId).value = reason;
                    document.getElementById('rejectForm_' + hostelId).submit();
                } else {
                    alert("You must provide a reason for rejection.");
                }
            }
        </script>
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
        <div class="container">
            <h1>Admin Hostel Create Request</h1>
            <section class="hostel-section" id="hostel-section">
                <% HostelDAO hostelDao = new HostelDAO();
                    ResultSet rs = hostelDao.getAllPending();
                    while (rs.next()) {%>
                <div class="hostel" data-hostel-id="<%=rs.getString("hostel_id")%>" data-address="<%=rs.getString("address_detail")%>">
                    <img src="img/<%=rs.getString("hostel_image")%>" alt="Hostel Image">
                    <div class="hostel-info">
                        <input type="hidden" value="<%=rs.getString("hostel_name")%>" readonly>
                        <h2>Hostel Name: <%=rs.getString("hostel_name")%></h2>
                        <p><strong>Address:</strong> <%=rs.getString("address_detail")%></p>
                        <p><strong>Phone contact:</strong> <%=rs.getString("phone_contact")%></p>
                        <p><strong>Description:</strong> <%=rs.getString("description")%></p>
                        <div class="btn-container">
                            <form id="acceptForm_<%=rs.getString("hostel_id")%>" action="RequestController" method="post">
                                <input type="hidden" name="action" value="accept">
                                <input type="hidden" name="hostel_id" value="<%=rs.getString("hostel_id")%>">
                                <button type="submit" name="btnAccept" class="btn btn-success">Accept</button>
                            </form>
                            <form id="rejectForm_<%=rs.getString("hostel_id")%>" action="RequestController" method="post">
                                <input type="hidden" name="action" value="reject">
<input type="hidden" name="hostel_id" value="<%=rs.getString("hostel_id")%>">
                                <input type="hidden" id="rejectReason_<%=rs.getString("hostel_id")%>" name="rejectReason" value="">
                                <button type="button" name="btnReject" class="btn btn-danger" onclick="promptRejectionReason('<%=rs.getString("hostel_id")%>')">Reject</button>
                            </form>
                        </div>
                    </div>
                </div>
                <% }
                    rs.close();%>
            </section>
        </div>
    </body>
</html>