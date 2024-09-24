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
        <title>All Admin</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
            body{
                text-align: center;
                background-image:url('alladmin.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden;
            }
            table{
                 position: absolute;
                top: 62%;
                left: 50%;
                color: wheat;
                transform: translate(-50%,-50%);
                width: 850px;
                height: 120px;
                padding: 80px 100px;
                box-sizing: border-box;
                border-radius:5px; 
                background-color: rgba(0,0,0,0.5);
                font-size: 25px;
                box-shadow: 0 0 25px orangered;
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
                    
                    border-collapse: collapse;
                    color: wheat;
                }
                h1{
                    position: absolute;
                    top: 10%;
                    left:35%;
                    font-size: 70px;
                    color: wheat;
                    text-shadow: 8px 8px black;
                }
                .button{
                padding:22px 22px;
                font-size: 15px;
                opacity: 1.5;
                background-color: rgba(0,0,0,0.7);
                font-weight: bold;
                border-color: wheat;
                border-radius: 25px;
                color:white;
                margin: 10px;
                box-shadow: 0 0 20px orangered;
                }
                .abc{
                  position: absolute;
                  top:10%;
                  left:15%;
            }
            .abc1{
                  position: absolute;
                  top:8%;
                  left:75%;
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
        <img class="abc1" src='adminlogo.png' style="width:125px; height:145px">
        <br>
        <header> <a href="http://localhost:8080/MajorProject/AdminPages/AllStudents.jsp"><input class="button" type="button" style="background-color: rgba(0,0,0,0.5)" value="ALL STUDENTS"></a>   
            <a href="http://localhost:8080/MajorProject/AdminPages/AddAdmin.jsp"><input class="button" style="background-color: orangered; box-shadow: 0 0 20px black" type="button" value="ADD  ADMIN"></a> 
            <input  class="button" type="button" onCLick="history.back()" value="GO BACK">  </header>
        <h1> ALL  ADMINS </h1>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM Admin";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Loop through the results and display each movie in a table row
            
        %>
        <table>
             <thead>
             <TR>
            <th>ID</tH><TH>PHOTO</TH><TH>FIRST NAME</TH><TH>LAST NAME</TH><TH>EMAIL</TH><TH>PHONE</TH><TH>DOB</TH>
            <TH>GENDER</TH><th colspan="2">Action</th>
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
            <form method="POST" action="http://localhost:8080/MajorProject/DeleteAdmin?id=<%=rs.getString(1)%>" onsubmit="return funSub()">
                <td><button class="button1" style="background-color:orangered; color:whitesmoke; border-radius: 15px; font-size:20px;"  type="submit">Remove</button></td>
                        </form>
             </TR>
             <%}%>
             </tbody>
         </table>

    </body>
</html>
