<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Password Reset</title>
    <link rel="icon" href="../img/logo.ico" type="image/x-icon">
    <style> body{
                background-color: white;
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
                height: 500px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: #204d74;
                box-shadow: 0 0 50px black;
                border: 2px solid black;
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
                border: 2px solid black;
            }
            h2{
                position: absolute;
                top:5%;
                left:25%;
                color: white;
                font-size: 40px;
                text-shadow:0 0 10px black;
            }
            header{
                position: absolute;
                top: 1%;
                left:30%;
                font-size: 48px;
                
            }
            .abc{
                  position: absolute;
                  top:3%;
                  left:16%;
            }
            .abc1{
                  position: absolute;
                  top:5%;
                  left:74%;
            }
            .table{
                position: absolute;
                top: 25%;
                left: 10%;
                font-size: 20px;
                padding: 10px;
            }
    </style>
</head>
<body>
     <img class="abc" src='LOGO.png' style="width:165px; height:125px">
        <img class="abc1" src='resetlogo.png' style="width:135px; height:105px">
        <header><h3>HORIZON UNIVERSITY<h3></header>
                    <div class="a">
                    <h2>Reset Password</h2>
                        
                        <div class="b">
    
    
    <form method="post" action="http://localhost:8080/MajorProject/UpdatePasswordS">
       <table class="table">
        <tr>
            <td><b>ID:</b></td>
            <td><input type="text" name="id" style="height:25px;" readonly="#" value=<%= request.getSession().getAttribute("id") %>>
            </td></tr>
        <tr><td><b>New Password:</b></td>
        <td><input type="password" name="npassword" required style="height:25px;"></td>
        </tr><tr>
            <td><b>Confirm Password:</b></td> 
            <td><input type="password" name="cpassword" required style="height:25px;"></td>
        </tr>
                
        
        <tr><td><input type="submit" value="Reset Password" style="position: absolute;
                top: 95%;
                left: 8%;
                font-size: 20px;
                background-color: darkblue;
                border-radius: 10px;
                color: white;
                padding:6px;"></td>
        <td><input type="button" value="CANCEL" style="position: absolute;
                top: 95%;
                left: 55%;
                font-size: 20px;
                background-color: orangered;
                border-radius: 10px;
                color: white;
                padding:6px;" onClick="location.href='slogin.jsp'"></td></tr>
       </table>
    </form>
                        </div>
                    </div>
</body>
</html>
