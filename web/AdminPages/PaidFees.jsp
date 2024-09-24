<%-- 
    Document   : PaidFees
    Created on : 16 May, 2023, 8:04:28 AM
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
        <title>All Fees</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
             body{
                background-image: url('fees.png');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
            }
            .button{
                padding:22px 22px;
                font-size: 15px;
                opacity: 1.5;
                background-color: transparent;
                font-weight: bold;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                margin: 10px;
                box-shadow: 0 0 20px wheat;
                background-color: rgba(0,0,0,0.6);
                }
        h1{
                    position: absolute;
                    top: 10%;
                    left:32%;
                    font-size: 70px;
                    color: orangered;
                    text-shadow: 5px 4px black;
                }
                table{
                 position: absolute;
                top: 40%;
                left: 40%;
                color: wheat;
                transform: translate(-50%,-50%);
                width: 180px;
                height: 120px;
                box-sizing: border-box; 
                background-color: #23527c;
                font-size: 19px;
                box-shadow: 0 0 10px black;
                border: 2px whitesmoke solid;
                border-radius: 25px; 
                }
                table
        {
            text-align: center;
            border-bottom: 2px solid whitesmoke;
            border-collapse: collapse;
            color:white; 
            border-radius: 25px; 
        }
        table th,td{
            text-align: center;
            color:white;
            padding: 10px 30px;
            
        }
                th
                {
                    border: 2px solid whitesmoke;
                    text-shadow: 4px 4px black;
                    border-collapse: collapse;
                    color: wheat; 
                }
                .abc{
                  position: absolute;
                  top:1%;
                  left:7%;
            }
            .button1{position: absolute;
                  top:35%;
                  left:77%;
                padding:40px 40px;
                font-size: 15px;
                opacity: 1.5;
                background-color: transparent;
                font-weight: bold;
                border-color: wheat;
                border-radius: 30px;
                color:white;
                margin: 10px;
                box-shadow: 0 0 20px wheat;
                background-color: rgba(0,0,0,0.6);
                }
        </style>
    </head>
    <body>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM student s INNER JOIN fees f ON s.id = f.id ";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            
        %>
        <img class="abc" src='LOGO.png' style="width:135px; height:125px">
         <table>
             <thead>
             <TR>
                 <th>ID</tH><th>NAME</th><th>dept</th><th>year</th><TH>DATE</TH><TH>TRANSACTION ID</TH><th colspan="2">Actions</th>
             </tr>
             </thead>
             <tbody>
                 <% while(rs.next()) { %>
             <TR>
                <TD><%= rs.getString("id")%></td>
                <TD><%= rs.getString("fname")%> <%= rs.getString("lname")%></td>
                <TD><%= rs.getString("dept")%></td>
                <TD><%= rs.getString("year")%></td>
                <TD><%= rs.getString("pdate")%></td>
                <TD><%= rs.getString("transaction_id")%></td>
                <form method="POST" action="http://localhost:8080/MajorProject/DeleteFees?id=<%=rs.getString("id")%>" onsubmit="return funSub()">
                    <td><button type="submit" style="background-color: orangered; color:whitesmoke; border-radius: 10px; font-size: 20px;  box-shadow:0 0 2px white">Remove</button></td>
                        </form>
             </TR>
             <%}%>
    <button class="button1" type="button" style="background-color: black; color:whitesmoke; border-radius:13px"  onCLick="history.back()">Back</button>
         </body>
</html>
