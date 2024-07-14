<%-- 
    Document   : signup
    Created on : Jul 11, 2024, 4:05:28 PM
    Author     : phanp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up 2 Page</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bd-wizard.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <h1>Sign Up</h1>
        <h2>Enter personal information</h2>
        <div class="container">
            <form action="SignUp2Controller" method="post">

                <div class="input-box">
                    <span class="details">Name</span>
                    <input type="text" name="txtCN" placeholder="Enter your name" required>
                </div>

                <div class="input-box">
                    <span class="details">Sur Name</span>
                    <input type="text" name="txtSN" placeholder="Enter your surname" required>
                </div>

                <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="text" name="txtPN" placeholder="Enter your number" required>
                </div>

                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" name="txtMail" placeholder="Enter your email" required>
                </div>

                <div class="input-box">
                    <span class="details">Address</span>
                    <input type="text" name="txtAddress" placeholder="Enter your address" required>
                </div>

                <button type="submit" name="btnSignUp2" class="btn btn-success">Sign Up</button>
            </form>
        </div>
    </body>
</html>