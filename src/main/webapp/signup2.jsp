<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMpq29G8tD+IzHp37Y7wE24z0V1sD4TtJ05zjfj" crossorigin="anonymous">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url('img/login_bg.jpg') no-repeat;
                background-color: black;
                background-size: cover;
                background-position: center;
            }

            .wrapper {
                width: 400px;
                background: rgba(0, 0, 0, 0.6);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 10px;
                padding: 40px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                backdrop-filter: blur(10px);
                color: #fff;
            }

            .wrapper h1 {
                font-size: 28px;
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }

            .wrapper h2 {
                font-size: 20px;
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }

            .wrapper .input-box {
                position: relative;
                margin-bottom: 20px;
            }

            .wrapper .input-box label {
                position: absolute;
                top: 50%;
                left: 20px;
                transform: translateY(-50%);
                color: rgba(255, 255, 255, 0.7);
                pointer-events: none;
                transition: 0.3s;
            }

            .wrapper .input-box input {
                width: 100%;
                padding: 10px 15px;
                background: transparent;
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 5px;
                color: #fff;
                outline: none;
                transition: border 0.3s;
            }

            .wrapper .input-box input:focus {
                border: 1px solid #007bff;
            }

            .wrapper .input-box input:focus + label,
            .wrapper .input-box input:valid + label {
                top: -10px;
                left: 10px;
                color: #007bff;
                font-size: 12px;
            }

            .wrapper button {
                width: 100%;
                padding: 10px;
                background: #007bff;
                border: none;
                border-radius: 5px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .wrapper button:hover {
                background: #0056b3;
            }

            .register-link {
                text-align: center;
                margin-top: 20px;
            }

            .register-link p {
                margin: 5px 0;
            }

            .register-link a {
                color: #007bff;
                text-decoration: none;
                transition: color 0.3s;
            }

            .register-link a:hover {
                color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <form action="SignUp2Controller" method="post">
                <h1>Sign Up</h1>
                <h2>Enter Personal Information</h2>

                <div class="input-box">
                    <input type="text" name="txtCN" id="txtCN" required>
                    <label for="txtCN">Name</label>
                </div>

                <div class="input-box">
                    <input type="text" name="txtSN" id="txtSN" required>
                    <label for="txtSN">Surname</label>
                </div>

                <div class="input-box">
                    <input type="text" name="txtPN" id="txtPN" required>
                    <label for="txtPN">Phone Number</label>
                </div>

                <div class="input-box">
                    <input type="email" name="txtMail" id="txtMail" required>
                    <label for="txtMail">Email</label>
                </div>

                <div class="input-box">
                    <input type="text" name="txtAddress" id="txtAddress" required>
                    <label for="txtAddress">Address</label>
                </div>

                <button type="submit" name="btnSignUp2">Sign Up</button>

                <div class="register-link">
                    <p>Already have an account?</p>
                    <p><a href="login.jsp">Sign In</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
