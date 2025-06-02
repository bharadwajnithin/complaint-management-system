package com.complaint.servlets;

import com.complaint.utils.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SubmitComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String subject = request.getParameter("subject");
        String description = request.getParameter("description");

        try (Connection conn = DBConnection.getConnection()) {
            // Get user ID
            String userQuery = "SELECT user_id FROM users WHERE username=?";
            PreparedStatement userStmt = conn.prepareStatement(userQuery);
            userStmt.setString(1, username);
            ResultSet rs = userStmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");

                // Insert complaint
                String sql = "INSERT INTO complaints (user_id, subject, description) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setString(2, subject);
                stmt.setString(3, description);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    response.getWriter().println("Complaint submitted successfully.");
                } else {
                    response.getWriter().println("Failed to submit complaint.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
