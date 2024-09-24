
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
	<title>Faculty Dashboard</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
	<link rel="stylesheet" href="dashboard.css">
	<script src="dashboard.js"></script>
        <style>
           body
            {
                background-image:url('facultydash.png');
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
                top: 20%;
                left: 63.1%;
                color: orangered;
                transform: translate(-50%,-50%);
                width: 750px;
                height: 120px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color: transparent;
                font-size: 25px;
            }
            h1{
                position: absolute;
                top: 27%;
                left: 12%;
                text-shadow: 5px 3px black;
            }
            h2{
                position: absolute;
                top: 3%;
                left: 4%;
                text-shadow: 2px 2px black;
            }
            h3{
                position: absolute;
                top: 6%;
                left: 1%;
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
                top: 52%;
                left: 25%;
                transform: translate(-50%,-50%);
                width: 280px;
                height: 480px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color:  transparent;
                font-size: 15px;
                box-shadow: 0 0 40px black;
                color: whitesmoke;
            }
            pre{
               
                font-size: 21px;
            }
            .buttonprog{
                position: absolute;
                top: 60%;
                left: 63.1%;
                transform: translate(-50%,-50%);
                width: 750px;
                height: 350px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: transparent;
                font-size: 17px;
                box-shadow: 0 0 40px black;
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
                  left:78%;
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
            String query = "SELECT * FROM faculty where email='"+e+"' and password='"+p+"'";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            if(rs.next()) {
                String id = rs.getString("id");
                request.getSession().setAttribute("id", id);
        %>
        <img class="abc" src='LOGO.png' style="width:165px; height:125px">
	<div class="main">
            <div class="head">
                 <div class="head1">
                    <h1>FACULTY DASHBOARD</h1>
                </div>
                <div class="head2">
                    <h2><pre> <% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:105px;height:150px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %> 
<br><br><br>
ID:<%= rs.getString(1)%>
NAME:<%= rs.getString(3)%> <%= rs.getString(4)%>
D.O.B.:<%= rs.getString(8)%><br>Phone :<%= rs.getString(7)%>
                        </pre>
                    </h2>
                </div>
            </div>
         
       
        
                
                
                <div class="buttonprog">
            <table class="buttons">
                <tr>
                            <td><form method="POST" action="http://localhost:8080/MajorProject/FacultyPages/FacultyProfile.jsp?id=<%=rs.getString(1)%>">
                    <button class="button1" onclick="" STYLE=" padding: 30px 44px">MY PROFILE</button> </a></form></td>
                            <td><form method="POST" action="http://localhost:8080/MajorProject/FacultyPages/StudentMarks.jsp">
                    <button class="button2" STYLE=" padding: 38px 48px">STUDENTS</button> <br></form></td>
                    
                           <td><form method="POST" action="http://localhost:8080/MajorProject/FacultyPages/UploadMarks.jsp">
                                   <button class="button3" STYLE=" padding: 30px 40px">UPLOAD MARKS</button></form></td>
                           
            </tr>
            <tr>
                <td><form method="POST" action="http://localhost:8080/MajorProject/FacultyPages/UpdateMydetailF.jsp?id=<%=rs.getString(1)%>">
                    <button class="button4">UPDATE PHONE/EMAIL</button></form>
                 <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/Syllabus.jsp">
                        <button class="button5" STYLE=" padding: 40px 44px">SYLLABUS</button></form></td>
                        <td><a href="http://localhost:8080/MajorProject/Home.html">
                        <button class="button" style="background-color: whitesmoke;padding: 40px 44px; border-color:red;  color:red">LOGOUT</button></a></td>
            </tr>
            </table>
        </div>
        </div>
                         <%}
                         else{
                // Redirect to an HTML page if the search is unsuccessful
                response.sendRedirect("errorloginf.html");
            }
   %>
</body>
</html>
