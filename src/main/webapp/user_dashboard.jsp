<%@ page import="java.sql.*, com.complaint.utils.DBConnection" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"user".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DBConnection.getConnection();

    // Get user ID
    PreparedStatement userStmt = conn.prepareStatement("SELECT user_id FROM users WHERE username=?");
    userStmt.setString(1, username);
    ResultSet userRs = userStmt.executeQuery();

    int userId = -1;
    if (userRs.next()) {
        userId = userRs.getInt("user_id");
    }

    // Fetch user complaints
    PreparedStatement compStmt = conn.prepareStatement(
        "SELECT complaint_id, subject, description, status FROM complaints WHERE user_id=?");
    compStmt.setInt(1, userId);
    ResultSet rs = compStmt.executeQuery();
%>
<html>
<head>
    <title>User Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.13);
            padding: 30px 40px 40px 40px;
        }
        h2 {
            color: #333;
            margin-top: 0;
        }
        .dashboard-links {
            margin-bottom: 24px;
        }
        .dashboard-links a {
            color: #007bff;
            text-decoration: none;
            margin-right: 18px;
            font-weight: 500;
            transition: color 0.2s;
        }
        .dashboard-links a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fafafa;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(0,0,0,0.07);
        }
        th, td {
            padding: 14px 12px;
            text-align: left;
        }
        th {
            background: #007bff;
            color: #fff;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background: #f2f7ff;
        }
        tr:hover {
            background: #e6f0ff;
            transition: background 0.2s;
        }
        .status {
            padding: 5px 12px;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 500;
            display: inline-block;
        }
        .status.Pending {
            background: #fff3cd;
            color: #856404;
        }
        .status.Resolved {
            background: #d4edda;
            color: #155724;
        }
        .status.Rejected {
            background: #f8d7da;
            color: #721c24;
        }
        @media (max-width: 600px) {
            .dashboard-container {
                padding: 12px 4px;
            }
            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, <%= username %>!</h2>
        <div class="dashboard-links">
            <a href="submit_complaint.jsp">Submit New Complaint</a>
            <a href="logout.jsp">Logout</a>
        </div>
        <h3>Your Complaints</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Subject</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
            <% while (rs.next()) { 
                String status = rs.getString("status");
            %>
            <tr>
                <td><%= rs.getInt("complaint_id") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <span class="status <%= status %>"><%= status %></span>
                </td>
            </tr>
            <% } %>
        </table>
    </div>	
</body>
</html>
