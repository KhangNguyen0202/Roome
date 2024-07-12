package Controllers;

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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class ForgotPasswordController extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordController at " + request.getContextPath() + "</h1>");
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

        if (path.startsWith("/ForgotPasswordController/EnterEmail")) {
            request.getRequestDispatcher("/forgotPasswordStep1.jsp").forward(request, response);
} else if (path.startsWith("/ForgotPasswordController/EnterOTP")) {
            System.out.println("Vo duoc toi EnterOTP");
            String[] s = path.split("/");
            String cus_email = s[s.length - 1];
            request.setAttribute("cus_email", cus_email);
            System.out.println(cus_email);
            request.getRequestDispatcher("/forgotPasswordStep2.jsp").forward(request, response);
        } else if (path.startsWith("/ForgotPasswordController/ResetPassword")) {
            String[] s = path.split("/");
            String cus_email = s[s.length - 1];
            request.setAttribute("cus_email", cus_email);
            request.getRequestDispatcher("/forgotPasswordStep3.jsp").forward(request, response);
        } else if (path.startsWith("/ForgotPasswordController/Login")) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
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
        if (request.getParameter("btnSendOTP") != null) {
            String cus_email = request.getParameter("email");
            System.out.println("btnSendOTP Pressed");
            System.out.println(cus_email);
            HttpSession session = request.getSession();
            try {
                if (emailExists(cus_email)) {
                    // Store OTP, email, and session ID in database
                    System.out.println("Check co email trong database");
                    requestPasswordReset(cus_email);
                    response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/EnterOTP/" + cus_email);
                } else {
                    session.setAttribute("emailNotFound", "Yes");
                    response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/EnterEmail");
                }
            } catch (SQLException ex) {
                Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("btnCheckOTP") != null) {
            System.out.println("Vo duoc toi check OTP");
            String cus_email = request.getParameter("cus_email");
            String pas_otp = request.getParameter("pas_otp");

            HttpSession session = request.getSession();
            System.out.println("CUSTOMER EMAIL AFTER VALIDATE OTP: " + cus_email);
            System.out.println("CUSTOMER OTP AFTER INSERT OTP: " + pas_otp);
            try {
                if (verifyOTP(cus_email, pas_otp)) {
System.out.println("Verify thanh cong");
                    updateOTPStatus(cus_email, pas_otp);
                    response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/ResetPassword/" + cus_email);
                } else {
                    System.out.println("Verify That Bai");
                    session.setAttribute("otpNotRight", "Yes");
                    response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/EnterOTP/" + cus_email);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("resetPasswordBtn") != null) {
            String cus_email = request.getParameter("cus_email");
            String new_password = request.getParameter("new_password");
            String confirm_password = request.getParameter("confirm_password");

            HttpSession session = request.getSession();

            if (new_password.equals(confirm_password)) {
                try {
                    String hashedPassword = hashPassword(confirm_password);
                    resetPassword(cus_email, hashedPassword);
                    response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/Login");
                } catch (SQLException ex) {
                    Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                session.setAttribute("passwordNotMatch", "Yes");
                response.sendRedirect(request.getContextPath() + "/ForgotPasswordController/ResetPassword/" + cus_email);
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
    //SendEmail

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

    public boolean emailExists(String cus_email) throws SQLException {
        Connection conn = DBConnection.getConnection();
        boolean exists = false;

        if (conn != null) {
            String query = "SELECT email FROM users WHERE email = ?";
            try ( PreparedStatement pst = conn.prepareStatement(query)) {
                pst.setString(1, cus_email);
                try ( ResultSet rs = pst.executeQuery()) {
                    exists = rs.next();
                }
            }
        }
        return exists;
    }

    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public void saveOTPToDatabase(String cus_email, String otp) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String query = "INSERT INTO ForgotPassword (cus_email, otp, otp_expire_at, otp_status) VALUES (?, ?, DATEADD(MINUTE, 5, CURRENT_TIMESTAMP), ?)";
        try ( PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cus_email);
            stmt.setString(2, otp);
            stmt.setInt(3, 1); // OTP status set to '1' (active)
            stmt.executeUpdate();
        }
    }

    public void updateOTPStatus(String cus_email, String otp) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String query = "UPDATE ForgotPassword SET otp_status = 2 WHERE cus_email = ? AND otp = ?";
        try ( PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cus_email);
            stmt.setString(2, otp);
            stmt.executeUpdate();
        }
    }

    public void requestPasswordReset(String cus_email) throws SQLException {
        String otp = generateOTP();
        saveOTPToDatabase(cus_email, otp);

        String subject = "Your ROOME Password Reset OTP";
        String body = "Your OTP for password reset is: " + otp + "\n\n";
        body += "Please do not share this OTP with anyone else.\n";
        body += "If you did not request to change your password, simply ignore this email. ";
        body += "Password reset OTPs can only be sent to the email address associated with your account so don't worry.\n";
        body += "Hope you have a great day ❤!.";

        sendEmail(cus_email, subject, body);
    }

    public boolean verifyOTP(String cus_email, String otp) throws SQLException {
        Connection conn = DBConnection.getConnection();
String query = "SELECT TOP 1 otp, otp_expire_at FROM ForgotPassword WHERE cus_email = ? AND otp_status = 1 ORDER BY otp_created_at DESC";

        try ( PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, cus_email);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedOtp = rs.getString("otp");
                    Timestamp expirationTime = rs.getTimestamp("otp_expire_at");
                    Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());
                    return otp.equals(storedOtp) && currentTime.before(expirationTime);
                }
            }
        }
        return false;
    }

    public void resetPassword(String cus_email, String new_password) throws SQLException {
        Connection conn = DBConnection.getConnection();
        String query = "UPDATE users SET password = ? WHERE email = ?";
        try ( PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, new_password);
            stmt.setString(2, cus_email);
            stmt.executeUpdate();
        }
    }

    public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}