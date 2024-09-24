<%-- 
    Document   : AllSyllabus
    Created on : 16 May, 2023, 6:17:18 AM
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
        <title>ALL SYLLABUS</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
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
                table{
                 position: absolute;
                top: 65%;
                left: 40%;
                color: wheat;
                transform: translate(-50%,-50%);
                width: 950px;
                height: 100px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius:5px; 
                background-color: rgba(0,0,0,0.5);
                font-size: 25px;
                box-shadow: 0 0 10px wheat;
                border: 4px whitesmoke solid;
                border-radius: 5px;
                }
                table,th,td 
        {
            text-align: center;
            padding: 10px;
            border-bottom: 4px solid whitesmoke;
            border-collapse: collapse;
            color:white;
        }
                th
                {
                    padding: 10px;
                    height: 3px;
                    border: 4px solid whitesmoke;
                    text-shadow: 4px 4px black;
                    border-collapse: collapse;
                    color: wheat;
                }
                h1{
                
                position: absolute;
                top: 0%;
                left:14%;
                font-size: 50px;
                color:white
            
            }
            .button1{
                 position: absolute;
                top: 48%;
                left:80%;
                padding:35px 50px;
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
            .button2{
                 position: absolute;
                top: 68%;
                left:80%;
                padding:35px 40px;
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
        </style>
    </head>
    <body>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM course";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            
        %>
        <img class="abc" src='LOGO.png' style="width:185px; height:145px">
    <img class="abc1" src='clipart.png' style="width:185px; height:145px">
    <div class="a"><h1>Horizon University</h1></div>
    <table>
             <thead>
             <TR>
            <th>NAME</tH><TH>SYLLABUS</TH><th colspan="2">Actions</th>
             </tr>
             </thead>
             <tbody>
                 <% while(rs.next()) { %>
            <tr><td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
            <form method="POST" action="http://localhost:8080/MajorProject/DeleteCourse?name=<%=rs.getString(1)%>" onsubmit="return funSub()">
                    <td><button type="submit" style="background-color: orangered; color:whitesmoke; border-radius: 10px; font-size: 20px;  box-shadow:0 0 2px white">Remove</button></td>
                        </form>
            </tr>
            <%}%>
             </tbody>
        </table>
            
             <a href="http://localhost:8080/MajorProject/AdminPages/AddCourseSyllabus.jsp"><button class="button1" >ADD</button></a>
             <button class="button2" onCLick="history.back()" >BACK</button>
    </body>
</html>
