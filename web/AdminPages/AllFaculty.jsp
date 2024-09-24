<%-- 
    Document   : AllStudents
    Created on : 10 May, 2023, 1:30:07 AM
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
        <title>All Faculty</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
          body{
                text-align: center;
                background-image:url('allfacultybg.jpg');
                
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden;
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
                background-color: rgba(0,0,0,0.5);
                }
            
            h1{
                    position: absolute;
                    top: 10%;
                    left:35%;
                    font-size: 70px;
                    color: orangered;
                    text-shadow: 4px 4px black;
                }
                table{
                 position: absolute;
                top: 60%;
                left: 50%;
                color: wheat;
                transform: translate(-50%,-50%);
                width: 750px;
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
                .abc{
                  position: absolute;
                  top:10%;
                  left:20%;
            }
            .abc1{
                  position: absolute;
                  top:10%;
                  left:73%;
            }
    </style>
    <script>
            function funSub()
            {
                if(confirm("Are you sure to remove this account???") === true)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>
        <img class="abc" src='LOGO.png' style="width:135px; height:125px">
        <img class="abc1" src='facultylogo.png' style="width:135px; height:125px">
        <br>
        <header> <a href="http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp"><input class="button" type="button" style="background-color: rgba(0,0,0,0.5)" value="ALL STUDENTS"></a> 
            <a href="http://localhost:8080/MajorProject/AdminPages/AddFaculty.jsp"><input class="button" style="background-color: orangered; box-shadow:0 0 15px black" type="button" value="ADD FACULTY"></a> 
            <input  class="button" type="button" style="background-color: rgba(0,0,0,0.5)" onCLick="history.back()" value="GO BACK"></a>  </header>
        <h1> ALL  FACULTY </h1>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM faculty";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            
        %>
        
         <table>
             <thead>
             <TR>
            <th>ID</tH><TH>PHOTO</TH><TH>FIRST NAME</TH><TH>LAST NAME</TH><TH>EMAIL</TH><TH>PHONE</TH><TH>DOB</TH>
            <TH>GENDER</TH><TH>DEPARTMENT</TH><th colspan="2">Actions</th>
             </tr>
             </thead>
             <tbody>
                 <% while(rs.next()) { %>
             <TR>
                <TD><%= rs.getString(1)%></td>
                <td ><% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:40px;height:35px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %> 
                </td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td><%= rs.getString(5)%></td>
                <td><%= rs.getString(7)%></td>
                <td><%= rs.getString(8)%></td>
                <td><%= rs.getString(9)%></td>
                <td><%= rs.getString(10)%></td>
                <form method="POST" action="http://localhost:8080/MajorProject/EditFaculty?id=<%=rs.getString(1)%>" onsubmit="return fubSub()">
                                <td><button type="submit" style="background-color: orangered; color:whitesmoke; border-radius: 10px; font-size: 20px; box-shadow:0 0 2px white">Edit</button></td></form>
            <form method="POST" action="http://localhost:8080/MajorProject/DeleteFaculty?id=<%=rs.getString(1)%>" onsubmit="return funSub()">
                        <td><button type="submit" style="background-color: orangered; color:whitesmoke; border-radius: 10px; font-size: 20px;  box-shadow:0 0 2px white">Remove</button></td>
                        </form>
             </TR>
             <%}%>
             </tbody>
         </table>

    </body>
</html>
