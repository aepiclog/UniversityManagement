<%-- 
    Document   : FeePayment
    Created on : 13 May, 2023, 11:49:42 AM
    Author     : ARPITA
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fees Payment</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
            body{
                background-image: url('fees.png');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
            }
            .tab{
                position:absolute;
                top:22%;
                left:10%;
                font-size: 30px;
                text-align: left;
                border: 2px wheat solid;
                border-radius: 35px;
                background-color: #204d74;
                box-shadow: 0 0 30px black;
            }
            .table1{
                padding: 80px 130px;
                width: 140px;
                height: 160px;
            }
            .table1 td{
                color:white;
            }
            .abc{
                  position: absolute;
                  top:0.6%;
                  left:8%;
            }
            .qr{
                position: absolute;
                  top:25%;
                  left:70%;
            }
            h1{
               position: absolute;
                  top:57%;
                  left:76%; 
                  font-size: 45px;
            }
        </style>
    </head>
    
        <%
            String id =request.getParameter("id");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT id, fname, lname,email,dept,year from student where id='"+id+"' ";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            
        %>
        <body>
        <% while(rs.next()) { %>
        <img class="abc" src='LOGO.png' style="width:135px; height:125px">
        <img class="qr" src='qr.jpg' style="width:240px; height:240px">
        <h1>QR</h1>
        <div class="tab">
       <form action="http://localhost:8080/MajorProject/FeesUpdate" method="post">
           <table class="table1">
               <tr>
                   <td>ID: </td><td><input type="text" name="id"style="height: 20px" value="<%= rs.getString("id")%>" readonly ></td>
               </tr>
               <tr><td>NAME: </td><td><input type="text" name="fname" style="height: 20px" value="<%= rs.getString("fname")%>" readonly></td>
                   <td><input type="text" name="lname" style="height: 20px" value="<%= rs.getString("lname")%>" readonly></td>
               </tr>
               <tr><td>EMAIL: </td><td><input type="text" name="email" style="height: 20px" value="<%= rs.getString("email")%>" readonly>
               </tr>
               <tr>
               <td>DEPARTMENT: </td><td><input type="text" name="dept" style="height: 20px" value="<%= rs.getString("dept")%>" readonly>
                   </tr>
                   <tr><td>YEAR: </td>
                       <td><input type="text" name="year" style="height: 20px" value="<%= rs.getString("year")%>" readonly></td>
                   </tr>
                   <tr><td rowspan="2">TRANSACTION ID: </td>
                       <td><input type="text" id="transaction_id" name="transaction_id" style="height: 20px" required>
                       </td></tr>
                   <tr><td><input type="submit" value="Submit" style="position:absolute;top:84%;left:30%; background-color: #a6e1ec; color:black; border-radius:13px;font-size: 30px;"></td></tr>
                   <tr><td><input type="button" value="Dashboard" onCLick="history.back()" style="position:absolute;top:84%;left:46%; background-color: white; color:black; border-radius:13px;font-size: 30px;"></td></tr> 
           </table>
  </form>
        </div>
         <%}%>
    </body>
</html>
