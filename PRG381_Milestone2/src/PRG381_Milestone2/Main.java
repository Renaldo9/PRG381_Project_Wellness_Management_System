/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PRG381_Milestone2;
import PRG381_Milestone2.view.MainFrame;
import com.formdev.flatlaf.FlatDarkLaf;
import javax.swing.UIManager;

/**
 *
 * @author User
 */
public class Main {
    public static void main(String[] args){
        try {
            UIManager.setLookAndFeel(new FlatDarkLaf());
        } catch(Exception ex){
            System.err.println("Failed to initialize");
        }
        
        MainFrame mainFrame = new MainFrame();

    }
}
