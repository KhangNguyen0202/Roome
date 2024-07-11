<%-- 
    Document   : login
    Created on : Jul 11, 2024, 12:47:12 PM
    Author     : phanp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
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
                background: url('chill.jpg') no-repeat;
                background-color: black;
                background-size: cover;
                background-position: center;
            }

            .wrapper {
                width: 420px;
                background: transparent;
                border: 2px solid gray;
                backdrop-filter: blur(20px);
                box-shadow: 0 0 10px black;
                color: white;
                border-radius: 10px;
                padding: 30px 40px;
            }

            .wrapper h1 {
                font-size: 36px;
                text-align: center;
                color: blue;
            }

            .wrapper .input-box {
                width: 100%;
                height: 50%;
                margin: 30px 0;
            }

            .input-box input {
                width: 100%;
                height: 100%;
                background: transparent;
                border: none;
                outline: none;
                border: 2px solid gray;
                border-radius: 40px;
                color: white;
                padding: 20px 45px 20px 20px;
            }

            .wrapper .remember-forgot {
                display: flex;
                justify-content: space-between;
                font-size: 14px;
                margin: -15px 0 15px;
            }
            

        </style>
    </head>
    <body>
        <div class="wrapper">
            <form method="post" action="LoginController">
                <h1>Sign In</h1>

                <div class="input-box">
                    <label for="txtUS">Username</label>
                    <input type="text" class="form-control" id="txtUS" placeholder="Username" required>
                </div>

                <div class="input-box">
                    <label for="txtPWD">Password</label>
                    <input type="password" class="form-control" id="txtPWD" placeholder="Password" required>
                </div>

                <button type="submit" name="btnLogin">Login</button>

                <div class="register-link">
                    <p>Don't have an account?</p>
                    <p> <a href="signup1.jsp">Create account for tenants</a></p>
                    <p> <a href="signup1.jsp">Create account for landlords</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
