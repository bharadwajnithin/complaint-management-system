<%@ page import="java.sql.*, com.complaint.utils.DBConnection" %>
<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DBConnection.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(
        "SELECT c.complaint_id, u.username, c.subject, c.description, c.status " +
        "FROM complaints c JOIN users u ON c.user_id = u.user_id"
    );
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            max-width: 1100px;
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
        h3 {
            color: #444;
        }
        .admin-links {
            margin-bottom: 24px;
        }
        .admin-links a {
            color: #007bff;
            text-decoration: none;
            margin-right: 18px;
            font-weight: 500;
            transition: color 0.2s;
        }
        .admin-links a:hover {
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
        .status-badge {
            padding: 5px 12px;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 500;
            display: inline-block;
        }
        .status-badge.Pending {
            background: #fff3cd;
            color: #856404;
        }
        .status-badge['In Progress'], .status-badge.In\ Progress {
            background: #cce5ff;
            color: #004085;
        }
        .status-badge.Resolved {
            background: #d4edda;
            color: #155724;
        }
        form {
            display: flex;
            gap: 6px;
            align-items: center;
        }
        select {
            padding: 5px 8px;
            border-radius: 4px;
            border: 1px solid #bbb;
            font-size: 15px;
        }
        input[type="submit"] {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 7px 14px;
            border-radius: 4px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.2s;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        @media (max-width: 700px) {
            .dashboard-container {
                padding: 14px 2px;
            }
            table, th, td {
                font-size: 13px;
            }
            form {
                flex-direction: column;
                gap: 2px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome Admin: <%= session.getAttribute("username") %></h2>
        <div class="admin-links">
            <a href="logout.jsp">Logout</a>
        </div>
        <h3>All Complaints</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>User</th>
                <th>Subject</th>
                <th>Description</th>
                <th>Status</th>
                <th>Update</th>
            </tr>
            <%
                while (rs.next()) {
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= rs.getInt("complaint_id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <span class="status-badge <%= status.replace(" ", "") %>"><%= status %></span>
                </td>
                <td>
                    <form action="UpdateStatusServlet" method="post">
                        <input type="hidden" name="complaint_id" value="<%= rs.getInt("complaint_id") %>">
                        <select name="status">
                            <option value="Pending" <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
                            <option value="In Progress" <%= "In Progress".equals(status) ? "selected" : "" %>>In Progress</option>
                            <option value="Resolved" <%= "Resolved".equals(status) ? "selected" : "" %>>Resolved</option>
                        </select>
                        <input type="submit" value="Update">
                    </form>
                </td>   
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
