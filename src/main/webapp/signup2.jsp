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
    </head>
    <body>
        <h1>Sign Up</h1>
        <h2>Enter personal information</h2>
        <div class="container">
            <form action="">

                <div class="input-box">
                    <span class="details">Name</span>
                    <input type="text" id="txtCN"placeholder="Enter your name" required>
                </div>

                <div class="input-box">
                    <span class="details">Sur Name</span>
                    <input type="text" id="txtSN" placeholder="Enter your surname" required>
                </div>

                <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="text" id="txtPN" placeholder="Enter your number" required>
                </div>

                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" id="txtMail" placeholder="Enter your email" required>
                </div>

                <div class="input-box">
                    <span class="details">Address</span>
                    <input type="text" id="txtAddress" placeholder="Enter your address" required>
                </div>

                <button type="submit" name="btnSignUp2">Sign Up</a></button>
            </form>
        </div>
    </body>
</html>