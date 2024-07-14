package Controllers;

import DAOs.HostelDAO;
import Models.Hostel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;

@WebServlet("/HostelController/*")
@MultipartConfig
public class HostelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HostelController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HostelController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.equals(request.getContextPath() + "/HostelController/Create")) {
            request.getRequestDispatcher("/createhostel.jsp").forward(request, response);
        } else if (path.startsWith(request.getContextPath() + "/HostelController/View/")) {
            String[] s = path.split("/");
            String loc = s[s.length - 1];
            int hostel_id = Integer.parseInt(loc);
            HostelDAO dao = new HostelDAO();
            Hostel obj = dao.getHostelByID(hostel_id);
            System.out.println("hostel_id:" + hostel_id);
            System.out.println("obj:" + obj);
            if (obj == null) {
                response.sendRedirect(request.getContextPath() + "/ProductController");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("hs", obj);
                request.getRequestDispatcher("/infohostel.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = 1;
        System.out.println("user_id: " + user_id);

        if (request.getParameter("btnNext") != null) {
            System.out.println("Processing form submission...");
String hostelName = request.getParameter("txtHostelName");
            int provinceId = Integer.parseInt(request.getParameter("txtProvince"));
            String addressDetail = request.getParameter("txtAddressDetail");
            String phoneContact = request.getParameter("txtPhoneNumber");
            String description = request.getParameter("txtDescription");
            int total_rooms = Integer.parseInt(request.getParameter("txtTotalRooms"));
            Timestamp createdAt = new Timestamp(System.currentTimeMillis());
            String status = "pending"; // Default status

            // Handle file upload
            String fileName = "";
            String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            for (Part part : request.getParts()) {
                if (part.getName().equals("txtPic")) {
                    fileName = getFileName(part);
                    if (fileName != null && !fileName.isEmpty()) {
                        part.write(uploadPath + File.separator + fileName);
                    }
                }
            }

            String hostelImage = fileName;

            // Create Hostel object
            Hostel hostel = new Hostel(user_id, hostelName, provinceId, addressDetail, hostelImage, phoneContact, description, total_rooms, createdAt, status);
            HostelDAO hostelDAO = new HostelDAO();
            int hostelId = hostelDAO.addNew(hostel);

            System.out.println("Inserted rows: " + hostelId);

            if (hostelId > 0) {
                session.setAttribute("hostel_id", hostelId);
                response.sendRedirect(request.getContextPath() + "/RoomController/Create");
            } else {
                response.sendRedirect(request.getContextPath() + "/HostelController");
            }
        } else {
            System.out.println("Button not clicked!");
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}