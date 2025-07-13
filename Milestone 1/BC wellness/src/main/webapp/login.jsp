<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f9f9f9;
        }
        .container {
            background: white;
            padding: 30px;
            max-width: 400px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px #aaa;
            text-align: center;
        }
        h2 {
            color: #333;
        }
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
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        p a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if ("1".equals(success)) {
    %>
        <div class="success">Registration successful! Please login below.</div>
    <%
        }
        if ("1".equals(error)) {
    %>
        <div class="error">Invalid email or password. Please try again.</div>
    <%
        }
    %>

    <h2>Student Login</h2>
    <form action="login" method="post">
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>

    <p><a href="register.jsp">Don't have an account? Register here</a></p>
</div>

</body>
</html>
