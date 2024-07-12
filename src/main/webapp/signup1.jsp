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
        <style>
            .error {
                color: red;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form action="">
                <h1>Sign Up</h1>

                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" id="txtUS" placeholder="Enter your username" required>
                </div>

                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="password" id="txtPWD" placeholder="Enter your password" required>
                </div>

                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <input type="password" id="txtCPWD" placeholder="Confirm your password" required>
                </div>

                <div class="search-select">
                    <label for="txtUST">User Type</label>
                    <select id="txtUST">
                        <option value="Tenant">Tenant</option>
                        <option value="Landlord">Landlord</option>
                    </select>
                </div>

                <div class="error" id="error">Passwords do not match!</div>

                <button type="submit" name="btnSignUp1">Next Step</a></button>
            </form>

            <script>
                const signupForm = document.getElementById('signupForm');
                const password = document.getElementById('txtPWD');
                const confirmPassword = document.getElementById('txtConfirmPWD');
                const error = document.getElementById('error');

                signupForm.addEventListener('submit', function (e) {
                    if (password.value !== confirmPassword.value) {
                        e.preventDefault(); // Ngăn không cho form submit
                        error.style.display = 'block';
                    } else {
                        error.style.display = 'none';
                        window.location.href = 'signup2.jsp'; // Điều hướng tới trang kế tiếp
                    }
                });

                confirmPassword.addEventListener('input', function () {
                    if (password.value === confirmPassword.value) {
                        error.style.display = 'none';
                    }
                });
            </script>

        </div>

    </body>
</html>
