package Controllers;

import DAOs.RoomDAO;
import Models.RoomType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class RoomController extends HttpServlet {
   
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
            out.println("<title>Servlet RoomController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomController at " + request.getContextPath () + "</h1>");
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
      String path = request.getRequestURI();
        if (path.equals("/RoomController/Create")) {
            request.getRequestDispatcher("/createroom.jsp").forward(request, response);
    } 
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
        System.out.println("txtRoomTypes: " + request.getParameter("txtRoomTypes"));

        // Kiểm tra session để lấy hostel_id
        Integer hostelId = (Integer) request.getSession().getAttribute("hostel_id");
    
        if (hostelId == null) {
            // Xử lý khi hostel_id là null
            response.sendRedirect("error1.jsp");
            return;
        }

        // Logging hostel_id để kiểm tra
        System.out.println("Hostel ID from session: " + hostelId);

        int numberOfRoomTypes = 0;
        try {
            numberOfRoomTypes = Integer.parseInt(request.getParameter("txtRoomTypes"));
        } catch (NumberFormatException e) {
            // Xử lý khi không thể chuyển đổi txtRoomTypes sang số nguyên
            e.printStackTrace();
            response.sendRedirect("error2.jsp");
            return;
        }
        
        List<RoomType> roomList = new ArrayList<>();

        if (request.getParameter("btnCreate") != null) {
            for (int i = 0; i < numberOfRoomTypes; i++) {
                String roomName = request.getParameter("roomName" + i);
                String roomSize = request.getParameter("roomSize" + i);
                int roomPrice = 0;
                int roomAvailability = 0;

                // Xử lý chuyển đổi roomPrice và roomAvailability
                try {
                    if (request.getParameter("roomPrice" + i) != null && !request.getParameter("roomPrice" + i).isEmpty()) {
                        roomPrice = Integer.parseInt(request.getParameter("roomPrice" + i));
                    }
                    if (request.getParameter("roomAvailability" + i) != null && !request.getParameter("roomAvailability" + i).isEmpty()) {
                        roomAvailability = Integer.parseInt(request.getParameter("roomAvailability" + i));
                    }
                } catch (NumberFormatException e) {
                    // Xử lý khi không thể chuyển đổi roomPrice hoặc roomAvailability sang số nguyên
                    e.printStackTrace();
                    response.sendRedirect("error3.jsp");
                    return;
                }

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
                        part.write(uploadPath + File.separator + "img/" + fileName);
                    }
                }
            }

            String roomImage = fileName;
                Timestamp createdAt = new Timestamp(System.currentTimeMillis());
                RoomType room = new RoomType(hostelId, roomName, roomSize, roomPrice, roomAvailability, roomImage, createdAt);
                roomList.add(room);
            }

            RoomDAO roomDAO = new RoomDAO();
            for (RoomType room : roomList) {
                roomDAO.addNew(room);
            }

            response.sendRedirect("success.jsp");
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
