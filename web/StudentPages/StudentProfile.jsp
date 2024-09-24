<%-- 
    Document   : FacultyProfile
    Created on : 10 May, 2023, 6:14:07 AM
    Author     : ARPITA
--%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student | My Profile</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
         body{
                background-image: url('studentprofile.jpg');
                background-size: cover;
                background-repeat: no-repeat;
            }
            .main{
                position: absolute;
                top: 55%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 1000px;
                height: 600px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.6);
                box-shadow: 0 0 80px black;
            }
            h1{
                position: absolute;
                top:0.8%;
                text-align: center;
                background-color: #fc9c8c;
                width: 820px;
                height: 100px;
                font-size: 20px;
                box-sizing: border-box;
                border-radius: 20px 50px 15px 50px;
                box-shadow: 0 0 15px black;
            }
            .left{
                position: absolute;
                top: 30%;
                left: 10%;
                font-size: 15px;
                background-color: #fc9c8c;
                box-sizing: border-box;
                width:300px;
                height: 368px;
                align-content: center;
                text-align: center;
                box-shadow: 0 0 15px black;
                 border-radius:30px;
            }
            .right{
               
                 position: absolute;
                top: 26%;
                left: 50%;
                font-size: 15px;
            }
            button{
                position:absolute;
                top:85%;
                left:74%;
                font-size:30px;
                padding: 10px 10px;
                background-color: #122b40;
                color:whitesmoke;
                border: 2px solid wheat;
                border-radius: 20px;
            }
            </style>
    </head>
    <body>
         <%
             String id =request.getParameter("id");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM student WHERE ID='"+id+"'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            
        %>
        <header>
            <div class="main">
                
                <h1> <br>
            <b style="font-size:45px"> MY PROFILE </b>
        
        </h1>
           <div class="left">
                   <% while(rs.next()) { %>
                   <p ><br><br>  <% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='box-shadow: 0 0 10px black;width:140px;height:200px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                   %> </p><br>
                   <p style="text-shadow: 0 0 1px whitesmoke; font-size: 25px"><b><%= rs.getString(3)%> <%= rs.getString(4)%> </b>
</p>

</div>
               <div class="right" style="font-size:23px; color: black; text-shadow: 0 0 0.2px whitesmoke">
                   <p><b>ID: </b> <%= rs.getString(1)%>
                   <p><b>EMAIL: </b> <%= rs.getString(5)%>
                   <p><b>D.O.B.: </b> <%= rs.getString(8)%>
                
                   <p><b>PHONE: </b> <%= rs.getString(7)%>
                
                   <p><b>DEPT: </b> <%= rs.getString(11)%>
                 
                   <p><b>FATHER NAME: </b><%= rs.getString(9)%>
                       
                   <p><b>GENDER: </b><%= rs.getString(10)%>
        
                   <p><b>YEAR:  </b><%= rs.getString(12)%>
               </div>
        
        <button type=button value="Back" onCLick="history.back()">DASHBOARD</button>
        
        </header>
        
        <%}%>
    </body>
</html>
