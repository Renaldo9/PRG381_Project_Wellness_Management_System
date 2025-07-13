package com.belgiumcampus.wellness;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String studentNumber = request.getParameter("student_number");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Insert into DB
        String sql = "INSERT INTO users (student_number, name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, studentNumber);
            stmt.setString(2, name);
            stmt.setString(3, surname);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, password);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.jsp?success=1");

            } else {
                PrintWriter out = response.getWriter();
                out.println("<h3>Registration failed. Please try again.</h3>");
            }

        } catch (SQLException e) {
            throw new ServletException("DB Error: " + e.getMessage(), e);
        }
    }
}
