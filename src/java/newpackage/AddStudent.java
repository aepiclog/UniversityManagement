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

@MultipartConfig(maxFileSize = 16177215) // for max 16 MB images

public class AddStudent extends HttpServlet {
 
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String fathername = request.getParameter("fathername");
        String gender = request.getParameter("gender");
        String dept = request.getParameter("dept");
        String year = request.getParameter("year");
        
        Connection conn = null;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Insert the details into the database
            String sql = "INSERT INTO student (img,fname,lname,email,password,phone,dob,fathername,gender,dept,year) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            
            statement.setString(2, fname);
            statement.setString(3, lname);
            statement.setString(4,email);
            statement.setString(5,password);
            statement.setString(6,phone);
            statement.setString(7,dob);
            statement.setString(8,fathername);
            statement.setString(9,gender);
            statement.setString(10,dept);
            statement.setString(11,year);
            Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
            InputStream fileContent = filePart.getInputStream();
            String fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();
            statement.setBinaryStream(1, fileContent, (int) fileSize);
                int row = statement.executeUpdate();

                if (row > 0) {
                    System.out.println(fname);
                    response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp");

                }
                else
                {
                    System.out.println("no");
                    response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/error.html");
                }
            } catch (SQLException ex) {
            Logger.getLogger(AddStudent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
  


}
