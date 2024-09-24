<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Receipt</title>
  <link rel="icon" href="../img/logo.ico" type="image/x-icon">
  <style>
      body{
          background-color: yellow;
      }
      .abc{
                  position: absolute;
                  top:0.6%;
                  left:1%;
            }
            h1{
                position: absolute;
                top: 13%;
                left:6%;
                font-size: 40px;
            }
            
            h3{
                position: absolute;
                top: 1%;
                left:10%;
                font-size: 48px;
                
            }
            table{
                position: absolute;
                top: 25%;
                left:1%;
                border: 2px solid black;
                padding: 30px 10px;
            }
            table td{
                padding: 30px 20px;
            }
            button{
                position: absolute;
                top: 17%;
                left:38%;
                padding: 10px;
                border-radius: 10px;
                background-color: white;
                color: orangered
            }
  </style>
          
</head>
<body>
  <h1>Receipt</h1>
  
  <% 
      String id =(String) request.getSession().getAttribute("id");
     Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","arpita","roy");

            // Retrieve movies for the selected city from the database
            String query = "SELECT * FROM student s INNER JOIN fees f ON s.id = f.id where s.id='"+id+"'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {

  %>
<img class="abc" src='LOGO.png' style="width:105px; height:105px">
<header><h3>HORIZON UNIVERSITY<h3></header>
            <table>
                <tr><td>ID:</td><td><%= rs.getString("id")%></td><tr>
                    <td>NAME:</td><td><%= rs.getString("FNAME")%>   <%= rs.getString("lname")%></td>
<tr><td>DATE:</td><td> <%= rs.getString("pdate")%><td><td>DEPT:</td><td><%= rs.getString("dept")%></td></tr>
<tr><td>YEAR:</td><td><%= rs.getString("year")%></td><td>DOB:</td><td><%= rs.getString("dob")%></td></tr>
<tr><td> TRANSACTION ID:</td><td><%= rs.getString("transaction_id")%></td></tr>
            </table>
  
  <form>     
      <button type="button" value="Print" onClick="window.print()">PRINT</button>
  </form>
   <%}%>
</body>
</html>
