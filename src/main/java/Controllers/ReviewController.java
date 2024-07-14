package Controllers;

import DAOs.ReviewDAO;
import Models.Reviews;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * ReviewController handles review submission.
 */
public class ReviewController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReviewController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReviewController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.startsWith("/HostelController/View/")) {
            String[] s = path.split("/");
            String loc = s[s.length - 1];
            int hostelID = Integer.parseInt(loc);
            

            // Lưu hostelID vào session
           

            // Fetch reviews from the database
            ReviewDAO reviewDAO = new ReviewDAO();
            List<Reviews> reviews = reviewDAO.getReviewsByHostelID(hostelID);

            // Debugging: Print reviews to the console
           
            // Store reviews in the request scope
            request.setAttribute("reviews", reviews);

            // Forward to the JSP page
            request.getRequestDispatcher("/infohotel.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnSummitCmt") != null) {
            System.out.println("BTN SUMMIT CMT PRESSED");
            
            String ratingParam = request.getParameter("rating");

            // Lấy hostelID từ session
            HttpSession session = request.getSession();
            Integer hostelID = (Integer) session.getAttribute("hostelclick");
            System.out.println("hostelID: " + hostelID);
            System.out.println("rating: " + ratingParam);

            if (hostelID == null || ratingParam == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
                return;
            }

            try {
                int starNumber = Integer.parseInt(ratingParam);
                String comment = request.getParameter("comment");

                String userID = "1"; // Temporary userID for testing

                if (userID == null) {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
                    return;
                }

                ReviewDAO rDAO = new ReviewDAO();
                Reviews obj = new Reviews(0, Integer.parseInt(userID), hostelID, starNumber, comment, new Timestamp(System.currentTimeMillis()));

                int count = rDAO.createReview(obj);
                if (count > 0) {
                    request.getRequestDispatcher("/infohostel.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create review");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles review submission";
    }
}
