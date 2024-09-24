/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class AddSyllabus extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("course");
        String syllabus = request.getParameter("syllabus");
        System.out.println(syllabus);
        Connection conn = null;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");
            conn.setAutoCommit(false);
            // Insert the details into the database
            String sql = "INSERT INTO course (name,syllabus) values (?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, name);
            statement.setString(2, syllabus);
            
                int row = statement.executeUpdate();
                conn.commit();
                if (row > 0) {
                    System.out.println(name);
                    response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/AllSyllabus.jsp");

                }
                else
                {
                    System.out.println("no");
                    response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/error.html");
                }
            } catch (SQLException ex) {
            Logger.getLogger(AddSyllabus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddSyllabus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  


}
