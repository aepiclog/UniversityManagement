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
    <title>Course Syllabus</title>
    <link rel="icon" href="../img/logo.ico" type="image/x-icon">
    <style>
        #newWindow {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 20%;
            height: 20%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 1);
        }
         body{
                background-color: #204d74;
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
            }
           .abc{
                  position: absolute;
                  top:3%;
                  left:14%;
            }
            .abc1{
                  position: absolute;
                  top:3%;
                  left:74%;
            }
            h1{
                
                position: absolute;
                top: 0%;
                left:14%;
                font-size: 50px;
                color:white
            
            }
            h2{
                
                position: absolute;
                top: 18%;
                left:43%;
                font-size: 54px;
                color:white;
                text-shadow: 5px 5px black;
            
            }
            
            .b1{
                position: absolute;
                top: 38%;
                left:27%;
                padding:35px 300px;
                font-size: 35px;
                opacity: 1.5;
                background-color: #d43f3a;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                text-shadow: 3px 2px black;
                margin: 10px;
                box-shadow: 0 0 15px black;
                }
                .b2{
                position: absolute;
                top: 58%;
                left:27%;
                padding:35px 299.1px;
                font-size:35px;
                opacity: 1.5;
                background-color: #d43f3a;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                text-shadow: 3px 2px black;
                margin: 10px;
                box-shadow: 0 0 15px black;
                }
                .b3{
                position: absolute;
                top: 78%;
                left:27%;
                padding:35px 300px;
                font-size: 35px;
                opacity: 1.5;
                background-color: #d43f3a;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                text-shadow: 3px 2px black;
                margin: 10px;
                box-shadow: 0 0 15px black;
                }
                .a{
                     position: absolute;
                top: 12%;
                left: 50%;
                color: orangered;
                transform: translate(-50%,-50%);
                width: 560px;
                height: 100px;
                padding: 60px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color: transparent;
                box-shadow: 0 0 40px black;
                font-size: 25px;
                }
    </style>
    </head>
<body>
    <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM course where name='BCA'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            if(rs.next()){
               
           String link1 = rs.getString(2);                 
                   %>
    <img class="abc" src='LOGO.png' style="width:185px; height:145px">
    <img class="abc1" src='clipart.png' style="width:185px; height:145px">
    <div class="a"><h1>Horizon University</h1></div>
    <h2>Syllabus</h2>
    
    <button class="b1" onclick="location.href='<%= link1 %>'">BCA</button><br>
    <%}
    String query2 = "SELECT * FROM course where name='BHM'";
            Statement stmt2 = conn.createStatement();
             rs = stmt.executeQuery(query2);

            // Loop through the results and display each movie in a table row
            if(rs.next()){
               
           String link2 = rs.getString(2);                 
    %>
    
         <button class="b2" onclick="location.href='<%= link2 %>'">BHM</button><br>
   
         <% }
String query3 = "SELECT * FROM course where name='BBA'";
            Statement stmt3 = conn.createStatement();
            rs = stmt.executeQuery(query3);

            // Loop through the results and display each movie in a table row
            if(rs.next()){
               
           String link3 = rs.getString(2); 
%>
       
    <button class="b3" onclick="location.href='<%= link3 %>'">BBA</button>
  
    <%}%>  
</body>
</html>
