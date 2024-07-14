<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
            }
            .container {
                max-width: 500px;
                margin-top: 50px;
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            .btn-primary {
                background-color: #003580;
                border: none;
            }
            .btn-primary:hover {
                background-color: #002b6b;
            }
        </style>
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
            <h3 class="mt-4">Reset Password</h3>
            <form action="${pageContext.request.contextPath}/ForgotPasswordController" method="post">
                <div class="form-group">
                    <label for="password">New Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your new password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your new password" required>
                    <input type="hidden" name="cus_email" value="${requestScope.cus_email}">
                </div>
                <button type="submit" name="btnChangePassword" class="btn btn-primary btn-block">Change Password</button>
            </form>
        </div>
    </body>
</html>