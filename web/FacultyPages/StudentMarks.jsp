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
        <title>Students Marks</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
             body{
                text-align: center;
                background-image:url('students.jpg');
                background-repeat:no-repeat;
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
                background-color: rgba(0,0,0,0.6);
                }
        h1{
                    position: absolute;
                    top: 5%;
                    left:32%;
                    font-size: 70px;
                    color: orangered;
                    text-shadow: 5px 4px black;
                }
                table{
                 position: absolute;
                top: 52%;
                left: 48%;
                color: wheat;
                transform: translate(-50%,-50%);
                width: 600px;
                height: 120px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius:5px; 
                background-color: rgba(0,0,0,0.3);
                font-size: 19px;
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
                    border: 4px solid whitesmoke;
                    text-shadow: 4px 4px black;
                    border-collapse: collapse;
                    color: wheat;
                }
                
            .abc{
                  position: absolute;
                  top:6%;
                  left:20%;
            }
    </style>
    <script>
            function funSub()
            {
                if(confirm("Are you sure to remove this student's marks???") === true)
                    return true;
                else
                    return false;
            }
        </script>
    </head>
    <body>
         <img class="abc" src='LOGO.png' style="width:135px; height:125px">
        <h1> MARKS RECORDS </h1>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT s.id,s.img, s.fname, s.lname,m.sub1, m.marks1,m.sub2, m.marks2,m.sub3, m.marks3 FROM student s INNER JOIN marks m ON s.id = m.id";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
        %>
        
         <table>
             <thead>
             <TR>
                 <th>ID</tH><th>IMG</th><TH>FIRST NAME</TH><TH>LAST NAME</TH><TH>SUB1</TH><TH>MARKS1</TH><TH>SUB2</TH><TH>MARKS2</TH>
            <TH>SUB3</TH><TH>MARKS3</TH><th colspan="2">ACTIONS</th>
             </tr>
             </thead>
             <tbody>
             <% while(rs.next()) { %>
             <TR>
                <TD><%= rs.getString("id")%></td>
                <td ><% //to show the image
                        Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:40px;height:35px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                        %> 
                </td>
                <td><%= rs.getString("fname")%></td>
                <td><%= rs.getString("lname")%></td>
                <td><%= rs.getString("sub1")%></td>
                <td><%= rs.getString("marks1")%></td>
                <td><%= rs.getString("sub2")%></td>
                <td><%= rs.getString("marks2")%></td>
                <td><%= rs.getString("sub3")%></td>
                <td><%= rs.getString("marks3")%></td>
                
            <form method="POST" action="http://localhost:8080/MajorProject/DeleteMarks?id=<%=rs.getString("id")%>" onsubmit="return funSub()">
                    <td><button type="submit" style="background-color: orangered; color:whitesmoke; border-radius: 10px; font-size: 20px;  box-shadow:0 0 2px white">Remove</button></td>
                        </form>
             </TR>
             <%}%>
             </tbody>
         </table>
             
                 <button type="button" onCLick="history.back()" style="position:absolute; top:81%; left:85%; background-color: orangered; color:wheat; border-radius: 10px; font-size: 27px;  box-shadow:0 0 2px white; padding: 15px 15px">
                  BACK
                 </button>
     
    </body>
</html>
