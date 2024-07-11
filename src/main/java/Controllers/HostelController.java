package Controllers;

import DAOs.HostelDAO;
import DAOs.ProvinceDAO;
import Models.Hostel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;

@MultipartConfig
public class HostelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

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
       
         int landlordId = 1;
        // Thêm thông tin log để kiểm tra giá trị landlordId
        System.out.println("landlordId: " + landlordId);

        if (request.getParameter("btnFinishCreate") != null) {
            System.out.println("Processing form submission...");

            String hostelName = request.getParameter("txtHostelName");
            int provinceId = Integer.parseInt(request.getParameter("txtProvince"));
            String addressDetail = request.getParameter("txtAddressDetail");
            String phoneContact = request.getParameter("txtPhoneNumber");
            String description = request.getParameter("txtDescription");
            Timestamp createdAt = new Timestamp(System.currentTimeMillis());

            System.out.println("hostelName: " + hostelName);
            System.out.println("provinceId: " + provinceId);
            System.out.println("addressDetail: " + addressDetail);
            System.out.println("phoneContact: " + phoneContact);
            System.out.println("description: " + description);

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
                    System.out.println("File uploaded: " + fileName);
                }
            }

            String hostelImage = "img/" + fileName;

            // Create Hostel object
            Hostel hostel = new Hostel(landlordId, hostelName, provinceId, addressDetail, hostelImage, phoneContact, description, createdAt);
            HostelDAO hostelDAO = new HostelDAO();
            int count = hostelDAO.addNew(hostel);

            System.out.println("Inserted rows: " + count);

            if (count > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
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
