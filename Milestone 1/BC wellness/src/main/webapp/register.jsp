<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f9f9f9;
        }
        .container {
            background: white;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px #aaa;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #1e7e34;
        }
        p a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Student Registration</h2>
    <form action="register" method="post">
        <input type="text" name="student_number" placeholder="Student Number" required><br>
        <input type="text" name="name" placeholder="Name" required><br>
        <input type="text" name="surname" placeholder="Surname" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="text" name="phone" placeholder="Phone" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Register</button>
    </form>

    <p><a href="login.jsp">Already have an account? Login here</a></p>
</div>

</body>
</html>
