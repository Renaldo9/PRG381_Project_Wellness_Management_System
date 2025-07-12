/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2.controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author User
 */
public class DBConnection {
    private static final String DRIVER = "org.apache.derby.jdbc.EmbeddedDriver";
    private static final String JDBC_URL = "jdbc:derby:wellnessDB;create=true";
    
    Connection con;
    
    public DBConnection(){
        
    }
    
    public void connect() throws ClassNotFoundException{
        try {
            Class.forName(DRIVER);
            this.con = DriverManager.getConnection(JDBC_URL);
            if(this.con != null){
                System.out.println("Connected to database");
            }
        } catch (SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public void createTables(){
        try (Statement stmt = con.createStatement()) {

            // Create Appointments table
            stmt.executeUpdate("CREATE TABLE Appointments (" +
                "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, " +
                "student VARCHAR(100), " +
                "counselor VARCHAR(100), " +
                "date VARCHAR(20), " +
                "time VARCHAR(20), " +
                "status VARCHAR(50))");

            // Create Counselors table
            stmt.executeUpdate("CREATE TABLE Counselors (" +
                "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, " +
                "name VARCHAR(100), " +
                "specialization VARCHAR(100), " +
                "availability VARCHAR(50))");

            // Create Feedback table
            stmt.executeUpdate("CREATE TABLE Feedback (" +
                "id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, " +
                "student VARCHAR(100), " +
                "rating INT, " +
                "comments VARCHAR(255))");

            System.out.println("Tables created successfully.");

        } catch (SQLException e) {
            System.out.println("⚠️ Could not create tables (they may already exist): " + e.getMessage());
        }
    }
}
