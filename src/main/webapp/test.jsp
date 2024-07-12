<%-- 
    Document   : test
    Created on : Jul 12, 2024, 2:48:52 PM
    Author     : sakak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            // Debugging: Print session ID and user_id attribute
            System.out.println("Session ID in JSP: " + session.getId());
            Integer userId = (Integer) session.getAttribute("user_id");
            System.out.println("Retrieved session attribute user_id: " + userId);

            if (userId == null) {
                // Redirect to login page if user_id is null
                response.sendRedirect("login.jsp");
            } else {
                // Display welcome message
        %>
        <h1>Welcome, User ID: <%= userId%></h1>
        <%
            }
        %>
    </body>
</html>
