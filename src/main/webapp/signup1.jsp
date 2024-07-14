<%-- 
    Document   : signup1
    Created on : Jul 11, 2024, 4:26:35 PM
    Author     : phanp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up 1 Page</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bd-wizard.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div class="container">
            <form action="SignUp1Controller" method="post">
                <h1>Sign Up</h1>

                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" name="txtUS" placeholder="Enter your username" required>
                </div>

                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" name="txtPWD" placeholder="Enter your password" required>
                </div>

                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <input type="password" name="txtCPWD" placeholder="Confirm your password" required>
                </div>

                <div class="search-select">
                    <label for="txtUST">User Type</label>
                    <select name="txtUST">
                        <option value="Tenant">Tenant</option>
                        <option value="Landlord">Landlord</option>
                    </select>
                </div>

                

                <button type="submit" name="btnSignUp1" class="btn btn-success">Next Step</button>
            </form>

        </div>

    </body>
</html>
