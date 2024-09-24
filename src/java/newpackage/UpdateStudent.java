/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;


public class UpdateStudent extends HttpServlet {

    String id,fname,lname,email,phone,dept,year;
    OracleConnection oconn;
    OraclePreparedStatement ost;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registration</title>");            
            out.println("</head>");
            out.println("<body>");
            id = request.getParameter("id");
            dept = request.getParameter("dept");
            year = request.getParameter("year");
            out.println(id);
            
             //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
                //Class.forName("oracle.jdbc.OracleDriver");
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                
                 //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");
                oconn.setAutoCommit(false);
                
                //STEP 3: CREATING THE QUERY
                String q = "update student set dept=?, year=? where id=?";
            
                //STEP 4: INSTANTIATING STATEMENT OBJECT FOR EXECUTING SQL QUERIES
                ost =(OraclePreparedStatement) oconn.prepareStatement(q);
                
                
                //STEP 6: FILLING THE BLANK VALUES OF THE QUERY MARKED WITH ? 
                
                ost.setString(1,dept);
                ost.setString(2,year);
                ost.setString(3,id);
                //STEP 7: EXECUTING THE QUERY
                
                 int ra = ost.executeUpdate();
                 oconn.commit();
                
                 if(ra>0){
                     response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp");
                 }
                 else{
                     response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp");
                 }
                
                ost.close();
                oconn.close();
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            Logger.getLogger(UpdateStudent.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}