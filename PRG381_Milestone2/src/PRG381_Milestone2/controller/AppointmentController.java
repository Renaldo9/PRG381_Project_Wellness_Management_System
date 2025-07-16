/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2.controller;
import PRG381_Milestone2.model.Appointment;


import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
/**
 *
 * @author User
 */
public class AppointmentController {
    private final Connection con;
    
    
    public AppointmentController(Connection con){
        this.con = con;
    }
    
    public boolean bookAppointment(Appointment appointment) {
        String sql = "INSERT INTO Appointments (student, counselor, date, time, status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, appointment.getStudent());
            pst.setString(2, appointment.getCounselor());
            pst.setString(3, appointment.getDate());
            pst.setString(4, appointment.getTime());
            pst.setString(5, appointment.getStatus());

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Failed to add Appointment: " + e.getMessage());
            return false;
        }
    }
    
    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT * FROM Appointments";

        try (Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Appointment c = new Appointment(
                    rs.getInt("id"),
                    rs.getString("student"),
                    rs.getString("counselor"),
                    rs.getString("date"),
                    rs.getString("time"),
                    rs.getString("status")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Failed to fetch appointments: " + e.getMessage());
        }

        return list;
    }
    
    public List<Appointment> getAllUpcomingAppointments() {

        List<Appointment> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate today = LocalDate.now();

        String sql = "SELECT * FROM Appointments";

        try (Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String dateStr = rs.getString("date");
                LocalDate appointmentDate = LocalDate.parse(dateStr, formatter);

                if (!appointmentDate.isBefore(today)) { // appointmentDate >= today
                   Appointment c = new Appointment(
                        rs.getInt("id"),
                        rs.getString("student"),
                        rs.getString("counselor"),
                        dateStr,
                        rs.getString("time"),
                        rs.getString("status")
                    );
                list.add(c);
                }
            }
        } catch (SQLException | DateTimeParseException e) {
            System.out.println("Failed to fetch upcoming appointments: " + e.getMessage());
        }

        return list;
    }
    
    // Update appointment by ID
    public boolean updateAppointment(Appointment appointment) {
        String sql = "UPDATE Appointments SET student=?, counselor=?, date=?, time=?, status=? WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, appointment.getStudent());
            ps.setString(2,appointment.getCounselor());
            ps.setString(3,appointment.getDate());
            ps.setString(4,appointment.getTime());
            ps.setString(5,appointment.getStatus());
            ps.setInt(6, appointment.getId());
            
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to update appointment: " + e.getMessage());
            return false;
        }
    }
    
    public ResultSet loadAvailableCounselors(){
        String sql = "SELECT name FROM Counselors WHERE availability = 'Available'";

        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Failed to load counselors: " + e.getMessage());
        }
        return null;
    }
    
    public boolean deleteAppointment(int id){
        String sql = "DELETE FROM Appointments WHERE id=?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.out.println("Failed to delete appointment: " + e.getMessage());
            return false;
        }
    }
}
