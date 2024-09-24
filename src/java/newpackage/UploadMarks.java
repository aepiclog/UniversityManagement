/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class UploadMarks extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String sub1 = request.getParameter("sub1");
        String marks1 = request.getParameter("marks1");
        String sub2 = request.getParameter("sub2");
        String marks2= request.getParameter("marks2");
        String sub3 = request.getParameter("sub3");
        String marks3 = request.getParameter("marks3");
        System.out.println(id);
        Connection conn = null;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");
            conn.setAutoCommit(false);
            // Insert the details into the database
            String sql = "INSERT INTO marks (id,sub1,marks1,sub2,marks2,sub3,marks3) values (?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, id);
            statement.setString(2, sub1);
            statement.setString(3,marks1);
            statement.setString(4, sub2);
            statement.setString(5,marks2);
            statement.setString(6, sub3);
            statement.setString(7,marks3);
            
                int row = statement.executeUpdate();
                conn.commit();
                if (row > 0) {
                    System.out.println(id);
                    response.sendRedirect("http://localhost:8080/MajorProject/FacultyPages/StudentMarks.jsp");

                }
                else
                {       System.out.println(id);
                   response.sendRedirect("http://localhost:8080/MajorProject/FacultyPages/errormarks.html"); 
                
                }
            } catch (SQLException ex) {
            Logger.getLogger(UploadMarks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UploadMarks.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  


}
