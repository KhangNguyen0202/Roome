/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phanp
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        if (path.equals("/LoginController")) {
            Integer userId;
            try {
                userId = (Integer) session.getAttribute("user_id");
                // Debugging information
//    System.out.println("Session user_id: " + userId);
//    System.out.println("Request URI: " + request.getRequestURI());

                // If the user is already logged in, forward to UserController
                if (userId != null) {
                    System.out.println("User is already logged in. Forwarding to /UserController");
                    response.sendRedirect("/MainPageController/Login=true");
                    return;
                }

                Cookie[] cookies = request.getCookies();
                boolean userCookieFound = false;

                // Check if cookies array is not null
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        System.out.println("Found cookie: " + cookie.getName() + " = " + cookie.getValue());
                        if ("user_id".equals(cookie.getName())) {
                            // If "user_id" cookie is found, set it in the session
                            int userIdStr = Integer.parseUnsignedInt(cookie.getValue());
                            session.setAttribute("user_id", userIdStr);
                            userCookieFound = true;
                            break; // Exit the loop once the cookie is found and processed
                        }
                    }
                }

                // If the user_id cookie was found, forward to UserController
                if (userCookieFound) {
                    System.out.println("user_id cookie found. Forwarding to /UserController");
                    request.getRequestDispatcher("/indexlogged.jsp").forward(request, response);
                } else {
                    // Otherwise, forward to login.jsp
                    System.out.println("No user_id cookie found. Forwarding to /login.jsp");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println("L err"+session.getAttribute("user_id"));
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Debugging information
        System.out.println("doPost called in LoginController");

        if (request.getParameter("btnLogin") != null) {
            String us = request.getParameter("txtUS");
            String pwd = request.getParameter("txtPWD");

            // Additional null check for parameters
            if (us != null && pwd != null) {
                User acc = new User(us, pwd);
                UserDAO dao = new UserDAO();

                if (dao.login(acc)) {
                    session.setAttribute("user_id", dao.getUserIdByUser(us));
                    Cookie userCookie = new Cookie("user_id", dao.getUserIdByUser(us) + "");
                    userCookie.setMaxAge(3 * 24 * 60 * 60); // Cookie expiry time: 3 days
                    response.addCookie(userCookie);

                    System.out.println("Login successful. Redirecting to /UserController");
                    request.getRequestDispatcher("/indexlogged.jsp").forward(request, response);
                } else {
                    System.out.println("Login failed. Redirecting to /LoginController");
                    response.sendRedirect("/LoginController");
                }
            } else {
                System.out.println("Username or password parameter is missing.");
                response.sendRedirect("/LoginController");
            }
        } else {
            System.out.println("btnLogin parameter is missing.");
            response.sendRedirect("/LoginController");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
