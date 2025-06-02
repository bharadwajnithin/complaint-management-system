package com.complaint.servlets;

import com.complaint.utils.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String complaintId = request.getParameter("complaint_id");
        String status = request.getParameter("status");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE complaints SET status = ? WHERE complaint_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, Integer.parseInt(complaintId));

            int result = stmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.getWriter().println("Failed to update complaint status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
