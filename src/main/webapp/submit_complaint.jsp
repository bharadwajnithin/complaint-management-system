<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Dynamic background color based on username
    String bgColor = "#f0f0f0"; // default
    if ("admin".equalsIgnoreCase(username)) {
        bgColor = "#ffe0e0";
    } else if ("user1".equalsIgnoreCase(username)) {
        bgColor = "#e0f7fa";
    }
%>
<html>
<head>
    <title>Submit Complaint</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background-color: <%= bgColor %>;
            font-family: 'Segoe UI', Arial, sans-serif;
            padding: 0;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            margin-top: 40px;
            background: #fff;
            padding: 32px 28px 24px 28px;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.12);
            width: 100%;
            max-width: 420px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }
        label {
            font-weight: 500;
            color: #444;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1.5px solid #bbb;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.2s, box-shadow 0.2s;
        }
        input[type="text"]:focus, textarea:focus {
            border: 1.5px solid #007BFF;
            box-shadow: 0 0 6px #007BFF33;
            outline: none;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 12px 0;
            border: none;
            border-radius: 5px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .user-info {
            text-align: right;
            margin-bottom: 12px;
            color: #555;
            font-size: 15px;
        }
        @media (max-width: 500px) {
            .container {
                padding: 18px 6px 14px 6px;
                max-width: 98vw;
            }
        }
    </style>
    <script>
        // Optional: Live character count for description
        function updateCharCount() {
            var desc = document.getElementById('desc');
            var count = document.getElementById('charCount');
            count.textContent = desc.value.length + " / 500";
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="user-info">
            Logged in as: <b><%= username %></b>
        </div>
        <h2>Submit a Complaint</h2>
        <form action="SubmitComplaintServlet" method="post">
            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject" maxlength="100" required>
            
            <label for="desc">Description:</label>
            <textarea name="description" id="desc" rows="5" maxlength="500" required oninput="updateCharCount()"></textarea>
            <div style="text-align:right; color:#888; font-size:13px;">
                <span id="charCount">0 / 500</span>
            </div>
            
            <input type="submit" value="Submit Complaint">
        </form>
    </div>
    <script>
        // Initialize character count on page load
        updateCharCount();
    </script>
</body>
</html>
