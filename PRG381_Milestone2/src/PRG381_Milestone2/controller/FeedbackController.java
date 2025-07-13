/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2.controller;
import PRG381_Milestone2.model.Feedback;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author User
 */
public class FeedbackController {
    private final Connection con;

    public FeedbackController(Connection con) {
        this.con = con;
    }
    
    public boolean addFeedback(Feedback feedback){
        String sql = "INSERT INTO Feedback (student, rating, comments) VALUES (?, ?, ?)";

        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, feedback.getStudent());
            pst.setInt(2, feedback.getRating());
            pst.setString(3,feedback.getComments());
            

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Failed to add Feedback: " + e.getMessage());
            return false;
        }
    }
    
    public List<Feedback> getAllFeedback(){
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";

        try (Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Feedback c = new Feedback(
                    rs.getInt("id"),
                    rs.getString("student"),
                    rs.getInt("rating"),
                    rs.getString("comments")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Failed to fetch feedback: " + e.getMessage());
        }

        return list;
    }
    
    public boolean updateFeedback(Feedback feedback) {
        String sql = "UPDATE Feedback SET student=?, rating=?, comments=? WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, feedback.getStudent());
            ps.setInt(2, feedback.getRating());
            ps.setString(3, feedback.getComments());
            ps.setInt(4, feedback.getId());
            
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to update Feedback: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deleteFeedback(int id){
        String sql = "DELETE FROM Feedback WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to delete feedback: " + e.getMessage());
            return false;
        }
    }
}
