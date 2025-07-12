/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2.controller;
import PRG381_Milestone2.model.Counselor;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author User
 */
public class CounselorController {
    private final Connection con;

    public CounselorController(Connection con) {
        this.con = con;
    }

    // Add a new counselor
    public boolean addCounselor(Counselor counselor) {
        String sql = "INSERT INTO Counselors (name, specialization, availability) VALUES (?, ?, ?)";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, counselor.getName());
            ps.setString(2, counselor.getSpecialization());
            ps.setString(3, counselor.getAvailability());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Failed to add counselor: " + e.getMessage());
            return false;
        }
    }

    // View list of all counselors
    public List<Counselor> getAllCounselors() {
        List<Counselor> list = new ArrayList<>();
        String sql = "SELECT * FROM Counselors";

        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Counselor c = new Counselor(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("specialization"),
                    rs.getString("availability")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Failed to fetch counselors: " + e.getMessage());
        }

        return list;
    }

    // Update counselor by ID
    public boolean updateCounselor(Counselor counselor) {
        String sql = "UPDATE Counselors SET name=?, specialization=?, availability=? WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, counselor.getName());
            ps.setString(2, counselor.getSpecialization());
            ps.setString(3, counselor.getAvailability());
            ps.setInt(4, counselor.getId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to update counselor: " + e.getMessage());
            return false;
        }
    }

    // Delete counselor by ID
    public boolean deleteCounselor(int id) {
        String sql = "DELETE FROM Counselors WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to delete counselor: " + e.getMessage());
            return false;
        }
    }

}
