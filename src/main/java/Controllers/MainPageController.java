/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.UserDAO;
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
 * @author nguye
 */
public class MainPageController extends HttpServlet {

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
            out.println("<title>Servlet MainPageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MainPageController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        if (path.equals("/MainPageController")||path.equals("")) {

            Integer userId;
            try {
                userId = (Integer) session.getAttribute("user_id");

                // Debugging information
                System.out.println("Session user_id: " + userId);
                System.out.println("Request URI: " + request.getRequestURI());

                // If the user is already logged in, forward to userprofile.jsp
                if (userId != null) {
                    System.out.println("User is already logged in. Forwarding to /userprofile.jsp");
                    request.getRequestDispatcher("/indexlogged.jsp").forward(request, response);
                    return;
                }

                Cookie[] cookies = request.getCookies();
                boolean userCookieFound = false;

                // Check if cookies array is not null
                if (cookies != null) {
                    UserDAO dao = new UserDAO();
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

                // If the user_id cookie was found, forward to userprofile.jsp
                if (userCookieFound) {
                    System.out.println("user_id cookie found. Forwarding to /userprofile.jsp");
                    request.getRequestDispatcher("/indexlogged.jsp").forward(request, response);
                } else {
                    // Otherwise, forward to login.jsp
                    System.out.println("No user_id cookie found. Redirecting to /LoginController");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println("u err" + session.getAttribute("user_id"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
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
        processRequest(request, response);
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
