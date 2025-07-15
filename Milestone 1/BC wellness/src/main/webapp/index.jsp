<!DOCTYPE html>
<html>
<head>
    <title>Welcome to BC Wellness</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
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
        
        .center-container {
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        
        .logo {
            width: 80px;
            height: 80px;
            background: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }
        
        h1 {
            color: var(--dark);
            margin-bottom: 15px;
            font-weight: 600;
            font-size: 2.2rem;
        }
        
        p.subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 15px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }
        
        .btn-primary:hover {
            background: var(--secondary);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
        }
        
        .btn-outline {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }
        
        .btn-outline:hover {
            background: var(--primary);
            color: white;
        }
        
        .features {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .feature {
            flex: 1;
            min-width: 120px;
        }
        
        .feature-icon {
            background: rgba(67, 97, 238, 0.1);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            color: var(--primary);
        }
        
        .feature-text {
            color: #666;
            font-size: 0.9rem;
        }
        
        @media (max-width: 480px) {
            h1 {
                font-size: 1.8rem;
            }
            
            p.subtitle {
                font-size: 1rem;
            }
            
            .btn {
                padding: 12px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="center-container">
        <div class="logo">
            <i class="fas fa-heartbeat"></i>
        </div>
        
        <h1>BC Wellness Portal</h1>
        <p class="subtitle">Access counseling services, schedule appointments, and provide feedback for your wellbeing</p>
        
        <div class="btn-group">
            <a href="login.jsp" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i> Login
            </a>
            <a href="register.jsp" class="btn btn-outline">
                <i class="fas fa-user-plus"></i> Register
            </a>
        </div>
        
        <div class="features">
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="feature-text">Appointments</div>
            </div>
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-user-md"></i>
                </div>
                <div class="feature-text">Counselors</div>
            </div>
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-comment-medical"></i>
                </div>
                <div class="feature-text">Feedback</div>
            </div>
        </div>
    </div>
</body>
</html>