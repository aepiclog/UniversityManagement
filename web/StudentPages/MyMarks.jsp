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
        <title>My Marks</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
            body{
                background-image: url('mymarks.png');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
            }
            .detailsbox
            {
                position: absolute;
                top: 34%;
                left: 46%;
                color: White;
                transform: translate(-50%,-50%);
                width: 1090px;
                height: 150px;
                padding: 50px 80px;
                box-sizing: border-box;
                border-radius: 25px; 
                background-color: transparent;
                box-shadow: 0 0 30px black;
                font-size: 25px;
                border: 2px wheat solid;
            }
            .table1{
                position:absolute;
                top:11%;
                left:5%;
                width:90%; 
                height:70%;
                font-size: 30px;
            }
            .tab{
                position:absolute;
                top:50%;
                left:17%;
                font-size: 30px;
                text-align: center;
                border: 2px wheat solid;
                border-radius: 35px;
                background-color: rgba(0,0,0,0.1);
                box-shadow: 0 0 30px black;
            }
            .table2{
                padding: 40px 55px;
                
            }
            .table2 th{
                padding: 10px 10px;
                color:orangered;
                border: 1px solid wheat;
                border-radius: 20px;
            }
            .table2 td{
                color:white;
            }
            button{
                position:absolute;
                top:60%;
                left:68%;
                font-size:30px;
                padding: 30px 30px;
                background-color: rgba(0,0,0,0.3);
                color:whitesmoke;
                border: 2px solid wheat;
                border-radius: 20px;
            }
            .abc{
                  position: absolute;
                  top:0.6%;
                  left:8%;
            }
            h1{
                 position:absolute;
                top:30%;
                left:30%;
            }
            h2{
               position:absolute;
                top:40%;
                left:38%; 
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
        <%
            String id =request.getParameter("id");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT s.id,s.password,s.img, s.fname, s.lname,s.dob,s.dept,s.year,s.email,m.sub1,m.marks1,m.sub2, m.marks2,m.sub3, m.marks3 FROM student s INNER JOIN marks m ON s.id = m.id where s.id='"+id+"' ";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            
        %>
       
        <img class="abc" src='LOGO.png' style="width:135px; height:125px">
         <% if(rs.next()) { %>
        <div class="detailsbox">
            <table class="table1"> <tr><td>Name: <%= rs.getString("fname")%> <%= rs.getString("lname")%></td>     
                    <td>ID: <%= rs.getString("ID")%></td><td>DOB: <%= rs.getString("dob")%></td>
                    <td rowspan="2"><% Blob imageBlob = rs.getBlob("img");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        out.write("<img style='width:90px;height:100px'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");
                    %> </td></tr>
                <tr><td>DEPT: <%= rs.getString("dept")%></td><td>YEAR: <%= rs.getString("year")%></td><td>EMAIL: <%= rs.getString("email")%></td></tr>               
            </table>
        </div>
            
            <div class="tab">
            <table class="table2">
                <tr>
                    <th> Subject Code </th>
                    <th>Total Marks</th>
                    <th> Obtained Marks </th>
                </tr>
                <tr>
                    <td> <%= rs.getString("sub1")%> </td>
                    <td>100</td>
                    <td><%= rs.getString("marks1")%> </td>
                </tr>
                <tr>
                    <td> <%= rs.getString("sub2")%> </td>
                    <td>100</td>
                    <td><%= rs.getString("marks2")%> </td>
                </tr>
                <tr>
                    <td> <%= rs.getString("sub3")%> </td>
                    <td>100</td>
                    <td><%= rs.getString("marks3")%> </td>
                </tr>
            </table>
        </div>
         <%}
else{%>
<h1 style="color:white"> Your Marks Have not been Uploaded</h1>
<h2 style="color:white">Contact Your faculty</h2>
<%}
             %>
               
                 
                    <button type=button value="Back" onCLick="history.back()">DASHBOARD</button></form>
            
             </TR>
            
             </tbody>
         </table>

    </body>
</html>
