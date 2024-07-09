/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAOs.HostelDAO;
import DAOs.ProvinceDAO;
import Models.Hostel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class HostelController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HostelController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HostelController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      HttpSession session = request.getSession();
//        Integer landlordId = (Integer) session.getAttribute("landlord_id");
//
//        if (landlordId == null) {
//            response.getWriter().write("Please log in first.");
//            return;
//        }
        int  landlordId = 1;

        if (request.getParameter("btnFinishCreate") != null) {
            String hostelName = request.getParameter("txtHostelName");
            String provinceName = request.getParameter("txtProvince");
            String addressDetail = request.getParameter("txtAddressDetail");
            String phoneContact = request.getParameter("txtPhoneNumber");
            String description = request.getParameter("txtDescription");
            Timestamp createdAt = new Timestamp(System.currentTimeMillis());
             ProvinceDAO catDao = new ProvinceDAO();
        int provinceId = catDao.getProvinceIDByName(provinceName);

            // Handle file upload
            String fileName = "";
            String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            for (Part part : request.getParts()) {
                if (part.getName().equals("txtPic")) {
                    String originalFileName = getFileName(part);
                    String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
                    fileName = uniqueFileName;
                    part.write(uploadPath + File.separator + fileName);
                }
            }

            String hostelImage = "img/" + fileName;

            // Create Hostel object
            Hostel hostel = new Hostel(landlordId, hostelName, provinceId, addressDetail, hostelImage, phoneContact, description, createdAt);
            HostelDAO hostelDAO = new HostelDAO();
            int count = hostelDAO.addNew(hostel);

            if (count > 0) {
                response.sendRedirect("/success.jsp");
            } else {
                response.sendRedirect("/error.jsp");
            }
        }
    }

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
    
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
