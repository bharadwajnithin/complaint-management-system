<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .register-container {
            background: #fff;
            max-width: 400px;
            margin: 60px auto;
            padding: 32px 28px 24px 28px;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.12);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }
        label {
            font-weight: 500;
            color: #444;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1.5px solid #bbb;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.2s, box-shadow 0.2s;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border: 1.5px solid #007BFF;
            box-shadow: 0 0 6px #007BFF33;
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
        @media (max-width: 500px) {
            .register-container {
                padding: 18px 6px 14px 6px;
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
    <div class="register-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password:</label>
            <div class="input-group">
                <input type="password" name="password" id="password" required>
                <span class="toggle-password" id="togglePwdIcon" onclick="togglePassword()">👁️</span>
            </div>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
