/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2.model;

/**
 *
 * @author User
 */
public class Counselor {
    private int id;
    private String name;
    private String specialization;
    private String availability;

    // Constructor without ID
    public Counselor(String name, String specialization, String availability) {
        this.name = name;
        this.specialization = specialization;
        this.availability = availability;
    }

    // Constructor with ID
    public Counselor(int id, String name, String specialization, String availability) {
        this(name, specialization, availability);
        this.id = id;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getSpecialization() { return specialization; }
    public String getAvailability() { return availability; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
    public void setAvailability(String availability) { this.availability = availability; }
}
