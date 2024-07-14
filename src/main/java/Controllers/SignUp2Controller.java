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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phanp
 */
public class SignUp2Controller extends HttpServlet {

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
            out.println("<title>Servlet SignUp2Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp2Controller at " + request.getContextPath() + "</h1>");
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
        if (path.equals("/SignUp2Controller")) {
            UserDAO userDAO = new UserDAO();
            User user = (User) request.getSession().getAttribute("newUser");
            if (user == null) {
                response.sendRedirect("/SignUp1Controller");
            }else
            request.getRequestDispatcher("/signup2.jsp").forward(request, response);
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
        if (request.getParameter("btnSignUp2") != null) {
            UserDAO userDAO = new UserDAO();
            User user = (User) request.getSession().getAttribute("newUser");
            if (user == null) {
                response.sendRedirect("/SignUp1Controller");
                return;
            }
            user.setUsercall_name(request.getParameter("txtCN"));
            user.setUserSurname(request.getParameter("txtSN"));
            user.setPhone_number(request.getParameter("txtPN"));
            user.setEmail(request.getParameter("txtMail"));
            user.setAddress(request.getParameter("txtAddress"));
            int count = userDAO.addUser(user);
            if (count > 0) {
                request.getSession().setAttribute("newUser",null);
                response.sendRedirect("/MainPageController");
            } else {
                System.out.println("Failed to add user signup2");
                request.getRequestDispatcher("/SignUp2Controller").forward(request, response);
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

}
