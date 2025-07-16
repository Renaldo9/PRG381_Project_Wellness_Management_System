<!DOCTYPE html>
<html>
<head>
    <title>Login | BC Wellness</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --danger: #f72585;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 40px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo {
            width: 70px;
            height: 70px;
            background: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            color: white;
            font-size: 1.8rem;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        h2 {
            color: var(--dark);
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .subtitle {
            color: #666;
            font-size: 1rem;
        }
        
        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .alert-success {
            background: rgba(76, 201, 240, 0.1);
            color: var(--success);
            border: 1px solid rgba(76, 201, 240, 0.3);
        }
        
        .alert-error {
            background: rgba(247, 37, 133, 0.1);
            color: var(--danger);
            border: 1px solid rgba(247, 37, 133, 0.3);
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .input-field {
            width: 100%;
            padding: 12px 15px 12px 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .input-field:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
            outline: none;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 38px;
            color: #999;
        }
        
        .btn {
            width: 100%;
            padding: 14px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary:hover {
            background: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
        }
        
        .footer-links {
            text-align: center;
            margin-top: 25px;
            font-size: 0.9rem;
        }
        
        .footer-links a {
            color: var(--primary);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: var(--secondary);
            text-decoration: underline;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: #999;
            font-size: 0.8rem;
        }
        
        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #eee;
        }
        
        .divider::before {
            margin-right: 10px;
        }
        
        .divider::after {
            margin-left: 10px;
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo">
                <i class="fas fa-heartbeat"></i>
            </div>
            <h2>Login</h2>
            <p class="subtitle">Access your wellness account</p>
        </div>

        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            if ("1".equals(success)) {
        %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> Registration successful! Please login below.
            </div>
        <%
            }
            if ("1".equals(error)) {
        %>
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> Invalid email or password. Please try again.
            </div>
        <%
            }
        %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <i class="fas fa-envelope input-icon"></i>
                <input type="email" id="email" name="email" class="input-field" placeholder="student@belgiumcampus.ac.za" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <i class="fas fa-lock input-icon"></i>
                <input type="password" id="password" name="password" class="input-field" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
            <%
                String error = request.getParameter("error");
                if ("invalid".equals(error)) {
            %>
                <script>
                alert("Invalid email or password. Please try again.");
                </script>
            <%
                }
            %>
        </form>

        <div class="divider">OR</div>
        
        <div class="footer-links">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
            <p><a href="#">Forgot your password?</a></p>
        </div>
    </div>
</body>
</html>