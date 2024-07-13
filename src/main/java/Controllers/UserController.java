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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author HP
 */
@WebServlet("/UserController/*")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UserController extends HttpServlet {

    private int user_id;

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
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
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
    if (path.equals("/UserController")) {
 
        Integer userId;
        try {
           userId  = (Integer) session.getAttribute("user_id");
        
        // Debugging information
        System.out.println("Session user_id: " + userId);
        System.out.println("Request URI: " + request.getRequestURI());

        // If the user is already logged in, forward to userprofile.jsp
        if (userId != null) {
            System.out.println("User is already logged in. Forwarding to /userprofile.jsp");
            request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
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
            request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
        } else {
            // Otherwise, forward to login.jsp
            System.out.println("No user_id cookie found. Redirecting to /LoginController");
            response.sendRedirect("/LoginController");
        }
        } catch (Exception e) {
            System.out.println("err");
            response.sendRedirect("/LoginController");
        }
    }
}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        user_id = Integer.parseInt(session.getAttribute("user_id") + "");
        //file upload
        if (request.getParameter("uploadImg") != null) {

            String fileName = "";

            String uploadPath = "";
            String s = getServletContext().getRealPath("") + File.separator;
            uploadPath = getServletContext().getRealPath("") + File.separator;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            for (Part part : request.getParts()) {
                if (part.getName().equals("txtPic")) {
                    fileName = (String) getFileName(part);
                    if (fileName != null && !fileName.isEmpty()) {
                        part.write(uploadPath + File.separator + fileName);
                    }
                }
            }
            UserDAO dao = new UserDAO();
            User user = dao.getUserByID(user_id);
            dao.updateUserImg(user_id, fileName);
            response.sendRedirect("/UserController");

        } else if (request.getParameter("btnSave") != null) {

            String Usercall_name = request.getParameter("txtCallName");
            String UserSurname = request.getParameter("txtUserSurname");
            String Phone_number = request.getParameter("txtPhoneNumber");
            String Address = request.getParameter("txtAddress");
            String Email = request.getParameter("txtEmail");

            User obj = new User(user_id, Usercall_name, UserSurname, Email, Phone_number, Address);
            UserDAO dao = new UserDAO();
            int updated = dao.updateUserInfo(user_id, obj);
            if (updated == 0) {
                response.sendRedirect("/err" + user_id);
            } else {
                response.sendRedirect("/indexlogged.jsp");
            }

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

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }

}
