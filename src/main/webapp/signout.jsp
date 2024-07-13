<%-- 
    Document   : signout
    Created on : Jun 13, 2024, 4:16:27 PM
    Author     : sakakk
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
            if (session != null) {
                session.invalidate();
            }
            Cookie cookie = new Cookie("user_id", "");
            cookie.setMaxAge(0); // 0 seconds, so it expires immediately
            response.addCookie(cookie);
            response.sendRedirect("/index.jsp"); // If index.jsp is in the root directory
        %>
        
    </body>
</html>
