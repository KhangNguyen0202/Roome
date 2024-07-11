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
    </head>
    <body>
        <div class="container">
            <form action="">
                <h1>Sign Up</h1>

                <div class="input-box">
                    <span class="details">Username</span>
                    <input type="text" placeholder="Enter your address" required>
                </div>

                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="text" placeholder="Enter your address" required>
                </div>

                <div class="input-box">
                    <span class="details">Confirm Password</span>
                    <input type="text" placeholder="Enter your address" required>
                </div>

                <div class="search-select">
                    <label for="txtUST">User Type</label>
                    <select id="txtUST">
                        <option value="Tenant">Tenant</option>
                        <option value="Landlord">Landlord</option>
                    </select>
                </div>
                
                <button type="submit" name="btnSignUp1"><a href="signup2.jsp">Next Step</a></button>
            </form>
        </div>

    </body>
</html>
