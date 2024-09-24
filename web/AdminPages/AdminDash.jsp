
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
	<style>
            body
            {
                background-image:url('admindash.png');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden; 
                text-align: center;
                align-content: center;
            }
            .head1
            {
                position: absolute;
                top: 23%;
                left: 64.1%;
                color: orangered;
                transform: translate(-50%,-50%);
                width: 750px;
                height: 120px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color: transparent;
                font-size: 35px;
            }
            h1{
                position: absolute;
                top: 24%;
                left: 12%;
                text-shadow: 5px 3px black;
            }
            h2{
                position: absolute;
                top: 3%;
                left: 4%;
                text-shadow: 1px 1px white;
            }
            h3{
                position: absolute;
                top: 6%;
                left: 30%;
                text-align: center;
            }
            p{
                position: absolute;
                top: 60%;
                left: 65%;
                font-size: 18px;
            }
            .head2
            {
                position: absolute;
                top: 54%;
                left: 20%;
                transform: translate(-50%,-50%);
                width: 280px;
                height: 440px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color:  transparent;
                font-size: 15px;
                box-shadow: 0 0 40px white;
                color: whitesmoke;
            }
            pre{
               position: absolute;
                top: 55%;
                left: 0.5%;
                font-size: 21px;
            }
            .buttonprog{
                position: absolute;
                top: 60%;
                left: 58.1%;
                transform: translate(-50%,-50%);
                width: 730px;
                height: 320px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: transparent;
                font-size: 17px;
                box-shadow: 0 0 40px white;
            }
            .buttons{
                width: 100%;
  table-layout: fixed; 
            }
            .buttons tr {
  display: flex;
}
.buttons tr td {
  flex: 1;
  display: flex;
  flex-direction: column;
}
button {
  flex: 1;
  
                padding:32px 32px;
                font-size: 15px;
                opacity: 1.5;
                background-color: orangered;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                margin: 10px;
                box-shadow: 0 0 15px white;
                
}
.b{
 
    font-size: 20px;
    color: whitesmoke;
}
.abc{
                  position: absolute;
                  top:1%;
                  left:11%;
            }
        </style>
</head>
<body>
   
      <%
          String e = request.getParameter("temail");
        String p =request.getParameter("tpass");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM admin where email='"+e+"' and password='"+p+"'";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            if(rs.next()) {
        %>
   <img class="abc" src='LOGO.png' style="width:165px; height:125px">              
<div class="main">
            <div class="head">
                <div class="head1">
                    <h2>ADMIN DASHBOARD</h2>
                </div>
                <div class="head2">
                    <h3><%Blob imageBlob = rs.getBlob("img");
                    byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    out.write("<img style='box-shadow:0 0 20px wheat;width:125px;height:160px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                    %> </h3>
                            <pre>
                            <table class="t" style="text-shadow: 1px 1px #ff5349">
                                <tr>
                                      <td>   ID: <%= rs.getString(1)%></td>
                                </tr>
                                <tr>
                                      <td>    NAME: <%= rs.getString(3)%> <%= rs.getString(4)%></td>
                                </tr>
                            
                                <tr>  <td>    D.O.B.: <%= rs.getString(8)%> </td> </tr>
                                <tr>  <td>    Phone: <%= rs.getString(7)%> </td></tr>
                             </tr>
                            </table>
                             </pre>
                        </div>
                </div>
            </div>
         
       
        <div class="buttonprog">
            <table class="buttons">
                <tr>
                    <td><a href="http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp"><button class="button" STYLE=" padding: 32px 40px">STUDENTS</button></a></td>
                            <td><a href="http://localhost:8080/MajorProject/AdminPages/AllFaculty.jsp"><button class="button">FACULTIES</button></a></td>
                            <td><a href="http://localhost:8080/MajorProject/AdminPages/PaidFees.jsp"><button class="button">FEE DETAILS</button></a></td>
            </tr>
            <tr>
                <td><a href="http://localhost:8080/MajorProject/AdminPages/AllSyllabus.jsp"><button class="button">SYLLABUS</button></a></td>
                <td><a href="http://localhost:8080/MajorProject/AdminPages/AllAdmin.jsp"><button class="button" STYLE=" padding: 32px 43px" >ADMINS</button></a></td>
                <td><a href="http://localhost:8080/MajorProject/Home.html">
                        <button class="button" style="background-color: whitesmoke; border-color:red;  color:red">LOGOUT</button></a></td>
                
            </tr>
            </table>
        </div>
        </div>
                          <%} else
            
         {
                // Redirect to an HTML page if the search is unsuccessful
                response.sendRedirect("errorlogina.html");
            }
   
                          %>
</body>
</html>