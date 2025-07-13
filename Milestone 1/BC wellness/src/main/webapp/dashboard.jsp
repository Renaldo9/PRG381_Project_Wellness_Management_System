<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
    </style>
</head>
<body>

<%
    // Check if session is valid
    if (session == null || session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) session.getAttribute("name");
    String surname = (String) session.getAttribute("surname");
%>

<div class="container">
    <h2>Welcome, <%= name %> <%= surname %>!</h2>

    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</div>

</body>
</html>
