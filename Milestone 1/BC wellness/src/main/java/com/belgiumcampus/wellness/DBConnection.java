package com.belgiumcampus.wellness;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/bc_wellness";
    private static final String USER = "postgres";
    private static final String PASS = "1234";

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL Driver not found!", e);
        }

        return DriverManager.getConnection(URL, USER, PASS);
    }
}
