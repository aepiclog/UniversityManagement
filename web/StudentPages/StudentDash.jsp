
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
	<title>Student Dashboard</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
	<link rel="stylesheet" href="dashboard.css">
	<script src="dashboard.js"></script>
        <style>
            body
            {
                background-image:url('studentdash.png');
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
                left: 30%;
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
                top: 40%;
                left: 20%;
                text-shadow: 5px 3px black;
            }
            h2{
                position: absolute;
                top: 3%;
                left: 2%;
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
                top: 53%;
                left: 72%;
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
                top: 61%;
                left: 34%;
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
                  top:3%;
                  left:8%;
            }
        </style>
</head>
<body>
   
      <%
          String i = request.getParameter("id");
        String p =request.getParameter("tpass");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM student where id ='"+i+"' and password='"+p+"'";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);
            
            // Loop through the results and display each movie in a table row
            if(rs.next()) {
            String id = rs.getString("id");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            
            request.getSession().setAttribute("id", id);
            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("phone", phone);
        %>
	<div class="main">
            <img class="abc" src='LOGO.png' style="width:165px; height:125px">
            <div class="head">
                <div class="head1">
                    <h1>STUDENT DASHBOARD</h1>
                </div>
                <div class="head2">
                    <h2><pre> <% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:115px;height:150px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %> 
<br><BR><br>
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
                            <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/StudentProfile.jsp?id=<%=rs.getString(1)%>">
                    <button class="button1" onclick="">MY PROFILE</button> </a></form></td>
                            <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/UpdateMyDetail.jsp?id=<%=rs.getString(1)%>">
                    <button class="button2" STYLE="FONT-SIZE: 15px; padding: 23px 23px">UPDATE PHONE/EMAIL</button> </form></td>
                           <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/Syllabus.jsp">
                                   <button class="button3">SYLLABUS</button></form></td>
                           
            </tr>
            <tr>
                <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/MyMarks.jsp?id=<%=rs.getString(1)%>">
                    <button class="button4">MY MARKS</button></form>
                 <td><form method="POST" action="http://localhost:8080/MajorProject/StudentPages/FeePayment.jsp?id=<%=rs.getString(1)%>">
                        <button class="button5" STYLE=" padding: 32px 44px">PAY  FEES</button></form></td>
                <td><a href="http://localhost:8080/MajorProject/Home.html">
                        <button class="button" style="background-color: whitesmoke; border-color:red;  color:red">LOGOUT</button></a></td>
            </tr>
            </table>
        </div>
       
      
        </div>
                         <%}
                         else{
                // Redirect to an HTML page if the search is unsuccessful
                response.sendRedirect("errorlogins.html");
            }%>
</body>
</html>
