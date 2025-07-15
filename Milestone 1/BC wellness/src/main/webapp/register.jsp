<!DOCTYPE html>
<html>
<head>
    <title>Register | BC Wellness</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --success: #4cc9f0;
            --danger: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
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
        
        .register-container {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 40px;
        }
        
        .register-header {
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
        
        .password-strength {
            margin-top: 5px;
            height: 4px;
            background: #eee;
            border-radius: 2px;
            overflow: hidden;
        }
        
        .strength-meter {
            height: 100%;
            width: 0;
            background: var(--danger);
            transition: width 0.3s, background 0.3s;
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
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        @media (max-width: 480px) {
            .register-container {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 1.4rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
    <script>
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const meter = document.querySelector('.strength-meter');
            let strength = 0;
            
            // Length check
            if (password.length >= 8) strength += 1;
            if (password.length >= 12) strength += 1;
            
            // Character type checks
            if (/[A-Z]/.test(password)) strength += 1;
            if (/[0-9]/.test(password)) strength += 1;
            if (/[^A-Za-z0-9]/.test(password)) strength += 1;
            
            // Update meter
            const width = strength * 20;
            meter.style.width = width + '%';
            
            // Update color
            if (strength <= 2) {
                meter.style.backgroundColor = 'var(--danger)';
            } else if (strength <= 4) {
                meter.style.backgroundColor = 'var(--warning)';
            } else {
                meter.style.backgroundColor = 'var(--success)';
            }
        }
    </script>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <div class="logo">
                <i class="fas fa-heartbeat"></i>
            </div>
            <h2>Create Your Account</h2>
            <p class="subtitle">Join BC Wellness to access counseling services</p>
        </div>

        <form action="register" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="student_number">Student Number</label>
                    <i class="fas fa-id-card input-icon"></i>
                    <input type="text" id="student_number" name="student_number" class="input-field" placeholder="e.g. BC123456" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="name">First Name</label>
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" id="name" name="name" class="input-field" placeholder="Your first name" required>
                </div>
                
                <div class="form-group">
                    <label for="surname">Last Name</label>
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" id="surname" name="surname" class="input-field" placeholder="Your last name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <i class="fas fa-envelope input-icon"></i>
                <input type="email" id="email" name="email" class="input-field" placeholder="student@belgiumcampus.ac.za" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <i class="fas fa-phone input-icon"></i>
                <input type="tel" id="phone" name="phone" class="input-field" placeholder="+27 12 345 6789" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <i class="fas fa-lock input-icon"></i>
                <input type="password" id="password" name="password" class="input-field" 
                       placeholder="Create a password" required oninput="checkPasswordStrength()">
                <div class="password-strength">
                    <div class="strength-meter"></div>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-user-plus"></i> Register
            </button>
        </form>

        <div class="footer-links">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>