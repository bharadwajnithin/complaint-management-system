<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .login-container {
            background: #fff;
            max-width: 350px;
            margin: 80px auto;
            padding: 30px 40px 40px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.13);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-container img {
            width: 80px;
            border-radius: 50%;
            margin-bottom: 16px;
        }
        h2 {
            color: #333;
            margin-bottom: 24px;
        }
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }
        input[type="text"], input[type="password"] {
            padding: 12px;
            border: 1.5px solid #bbb;
            border-radius: 4px;
            font-size: 16px;
            transition: border 0.3s, box-shadow 0.3s;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border: 1.5px solid #66a6ff;
            box-shadow: 0 0 6px #66a6ff44;
            outline: none;
        }
        .input-group {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
            color: #888;
        }
        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }
        .options label {
            cursor: pointer;
        }
        .options a {
            color: #007bff;
            text-decoration: none;
        }
        .options a:hover {
            text-decoration: underline;
        }
        input[type="submit"] {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.2s;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        .error-message {
            color: #d8000c;
            background: #ffd2d2;
            border: 1px solid #d8000c;
            padding: 8px;
            border-radius: 4px;
            margin-top: 10px;
            text-align: center;
        }
        @media (max-width: 480px) {
            .login-container {
                padding: 20px 10px;
                max-width: 98vw;
            }
        }
    </style>
    <script>
        function togglePassword() {
            var pwd = document.getElementById("password");
            var icon = document.getElementById("togglePwdIcon");
            if (pwd.type === "password") {
                pwd.type = "text";
                icon.textContent = "🙈";
            } else {
                pwd.type = "password";
                icon.textContent = "👁️";
            }
        }
    </script>
</head>
<body>
    <div class="login-container">
        <img src="https://www.w3schools.com/howto/img_avatar2.png" alt="Avatar">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <div class="input-group">
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-group">
                <input type="password" name="password" id="password" placeholder="Password" required>
                <span class="toggle-password" id="togglePwdIcon" onclick="togglePassword()">👁️</span>
            </div>
            <div class="options">
                <label><input type="checkbox" name="remember"> Remember Me</label>
                
            </div>
            <p style="margin-top: 16px; font-size: 14px;">
    Don't have an account?
    <a href="register.jsp" style="color: #007bff; text-decoration: none;">Register here</a>
</p>
            
            <input type="submit" value="Login">
        </form>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div class="error-message"><%= error %></div>
        <%
            }
        %>
    </div>
</body>
</html>
