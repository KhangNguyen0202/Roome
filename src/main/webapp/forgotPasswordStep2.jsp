<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enter OTP</title>
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
                background-color: #007bff;
                color: white;
                padding: 10px;
                border-radius: 10px 10px 0 0;
                text-align: center;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .footer {
                text-align: center;
                margin-top: 20px;
                font-size: 12px;
                color: #666;
            }
        </style>
    </head>

    <body>
        <div class="header">
            <h2>Roome.com</h2>
        </div>
        <div class="container">

            <h3 class="mt-4">Enter Your OTP</h3>
            <p>Please check your email and enter the OTP to continue.</p>
            <form action="${pageContext.request.contextPath}/ForgotPasswordController" method="post">
                <div class="form-group">
                    <label for="otp">OTP Code</label>
                    <input type="text" class="form-control" id="otp" name="pas_otp" placeholder="Enter your OTP" required>
                    <input type="hidden" name="cus_email" value="${requestScope.cus_email}">
                </div>
                <button type="submit" name ="btnCheckOTP" class="btn btn-primary btn-block">Confirm</button>
            </form>
        </div>
    </body>
</html>
