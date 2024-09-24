<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Update</title>
    <link rel="icon" href="../img/logo.ico" type="image/x-icon">
    <style> body{
                background-color: #ddd;
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                
            }
            .a{
             position: absolute;
                top: 58%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 500px;
                height: 380px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: #204d74;
                box-shadow: 0 0 50px black;
                border:2px solid black;
            }
            .b{
             position: absolute;
                top: 60%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 400px;
                height: 300px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.4);
            }
            h1{
                position: absolute;
                top:5%;
                left: 38%;
                color: #204d74;
                font-size: 65px;
                text-shadow:0 0 10px wheat;
            }
            header{
                position: absolute;
                top: 1%;
                left:30%;
                font-size: 48px;
                
            }
            .abc{
                  position: absolute;
                  top:6%;
                  left:20%;
            }
            .abc1{
                  position: absolute;
                  top:8%;
                  left:70%;
            }
            .table{
                position: absolute;
                top: 20%;
                left: 15%;
                font-size: 40px;
                padding: 15px;
                color: white;
                
            }
    </style>
</head>
<body>
    <img class="abc" src='LOGO.png' style="width:165px; height:125px">
    <img class="abc1" src='resetlogo.png' style="width:135px; height:105px">
    <h1>User Update</h1>
    
    <%-- Connect to the Oracle database --%>
    <%
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "arpita";
    String password = "roy";
    Connection conn = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    
    <%-- Update the user information --%>
    <%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        PreparedStatement pstmt = null;
        try {
            String query = "UPDATE faculty SET email=?, phone = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(2, phone);
            pstmt.setString(1, email);
            pstmt.setString(3, id);
            
            int rowsUpdated = pstmt.executeUpdate();
            conn.commit();
            if (rowsUpdated > 0) {               
                response.sendRedirect("http://localhost:8080/MajorProject/FacultyPages/updatesucces.html");
            } else {
                out.println("Failed to update user information.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
        }
    }
    %>
    
    <%-- Display the user update form --%>
    <div class="a">
    <form method="post" action="">
        <table class="table">
            <tr><td>ID: </td>
                <td><input type="text" name="id" readonly="#" style="height:25px;" value=<%= request.getSession().getAttribute("id") %>></td></tr>
            <tr><td>Email: </td><td><input type="text" name="email" style="height:25px;" ></td></tr>
            <tr><td>Phone: </td><td><input type="text" name="phone" style="height:25px;" ></td></tr>
            <tr><td><input type="submit" name="submit" style="position: absolute;
                top: 99%;
                left: 20%;
                font-size: 20px;
                background-color: orangered;
                border-radius: 10px;
                color: white;
                padding:10px;" value="Update"></td></tr>
            <tr><td><input type="button" name="submit" style="position: absolute;
                top: 99%;
                left: 49%;
                font-size: 20px;
                background-color: white;
                border-radius: 10px;
                color: black;
                padding:10px;" value="DASHBOARD" onCLick="history.back()"></td></tr>
        </table>
    </form>
    </div>
    <%-- Close the database connection --%>
    <%
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
