package Controllers;

import DAOs.HostelDAO;
import DAOs.UserDAO;
import DB.DBConnection;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class RequestController extends HttpServlet {

    private int hostelID;
    private UserDAO udao;
    private HostelDAO hdao;
    private int userID;
    private String username;
    private String rejectReason;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.equals(request.getContextPath() + "/RequestController")) {
            request.getRequestDispatcher("admHostelCreateRequest.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("DO POST");

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        hostelID = Integer.parseInt(request.getParameter("hostel_id"));
        udao = new UserDAO();
        hdao = new HostelDAO();
        userID = hdao.getUserIdByHostelId(hostelID);
        String userEmail = udao.getUserEmailById(userID);

        System.out.println("Action: " + action);
        System.out.println("Hostel ID: " + hostelID);
System.out.println("User Email: " + userEmail);

        if ("accept".equals(action)) {
            System.out.println("BTN ACCEPT PRESSED");
            HostelDAO dao = new HostelDAO();
            dao.approveHostel(hostelID);
            try {
                acceptHostelEmail(userEmail);
            } catch (SQLException ex) {
                Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect(request.getContextPath() + "/RequestController");
        } else if ("reject".equals(action)) {
            System.out.println("BTN REJECT PRESSED");
            rejectReason = request.getParameter("rejectReason");
            System.out.println("Rejection Reason: " + rejectReason);
            System.out.println("User email is: " + userEmail);

            try {
                rejectHostelEmail(userEmail, rejectReason);
                response.sendRedirect(request.getContextPath() + "/RequestController");
            } catch (Exception ex) {
                Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
                response.getWriter().println("Error processing rejection: " + ex.getMessage());
            }
        } else {
            System.out.println("No valid action found.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public void sendEmail(String cus_email, String subject, String body) {
        final String user = "roomehostelrental@gmail.com";
        final String pass = "qapxrhangevvxjpc";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        };

        Session session = Session.getInstance(properties, auth);
        Message message = new MimeMessage(session);
        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(cus_email, false));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void rejectHostelEmail(String cus_email, String rejectReason) throws SQLException {
        UserDAO udao = new UserDAO();
        username = udao.getUsernameByID(userID);
        System.out.println("User ID in the email method: " + userID);
System.out.println("Username: " + username);

        String subject = "Update on your hostel request";
        String body = "Dear " + username + "\n\n";
        body += "We regret to inform you that your request to add/update the hostel details has been rejected.\n";
        body += "Reason for Rejection: " + rejectReason + "\n";
        body += "If you have any questions or need further clarification, please feel free to contact us at roomehostelrental@gmail.com.\n";
        body += "Hope you have a great day!.";
        body += "Roome Team.";

        sendEmail(cus_email, subject, body);
    }

        public void acceptHostelEmail(String cus_email) throws SQLException {
        UserDAO udao = new UserDAO();
        username = udao.getUsernameByID(userID);
        System.out.println("User ID in the email method: " + userID);
        System.out.println("Username: " + username);

        String subject = "Update on your hostel request";
        String body = "Dear " + username + "\n\n";
        body += "We exited to inform you that your request to add/update the hostel details has been ACCEPTED.\n";
        body += "If you have any questions or need further clarification, please feel free to contact us at roomehostelrental@gmail.com.\n";
        body += "Hope you have a great day!.";
        body += "Roome Team.";

        sendEmail(cus_email, subject, body);
    }
    
}