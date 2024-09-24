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
import oracle.jdbc.OracleResultSet;

public class EditFaculty extends HttpServlet {

     OracleConnection oconn;
    OraclePreparedStatement ost;
    OracleResultSet ors = null;
     String id;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>RedirectEdit</title>");            
            out.println("</head>");
            out.println("<body>");
              //ltype = request.getParameter("type");
            id = request.getParameter("id");
            out.println(id);
            
            
             //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
                //Class.forName("oracle.jdbc.OracleDriver");
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                
             //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");
                
               // Search for matching user in the users table
           
            
             ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM faculty where id=?");
            
           
            //ost.setString(1, ltype);
            ost.setString(1, id);
            
            ors = (OracleResultSet) ost.executeQuery();
            if(ors.next())
            { out.println(id);
               out.println("success");
              String id = ors.getString("id"); 
              String fname = ors.getString("fname");
              String lname = ors.getString("lname");
              String email = ors.getString("email");
              String phone = ors.getString("phone");
              String  dept = ors.getString("dept");
              
              request.getSession().setAttribute("id", id);
              request.getSession().setAttribute("fname", fname);
              request.getSession().setAttribute("lname", lname);
              request.getSession().setAttribute("email", email);
              request.getSession().setAttribute("phone", phone);
              request.getSession().setAttribute("dept", dept);
              response.sendRedirect("http://localhost:8080/MajorProject/AdminPages/EditFaculty.jsp");
            }
            else{
               String referer = request.getHeader("Referer");
            response.sendRedirect(referer);
               
            }
                
                ost.close();
                oconn.close();

            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
             Logger.getLogger(EditFaculty.class.getName()).log(Level.SEVERE, null, ex);
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