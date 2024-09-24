<%-- 
    Document   : ForgotPasswordF
    Created on : 10 May, 2023, 3:59:32 PM
    Author     : ARPITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Forgot Password</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
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
                border: 1px solid black;
            }
            h2{
                position: absolute;
                top:5%;
                left: 30%;
                color: white;
                font-size: 35px;
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
                font-size: 25px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <img class="abc" src='LOGO.png' style="width:165px; height:125px">
        <img class="abc1" src='resetlogo.png' style="width:135px; height:105px">
        <header><h3>HORIZON UNIVERSITY<h3></header>
        
                <div class="a">
                    <h2>Enter Your ID</h2>
                        
                        <div class="b">
                            <form method="post" action="http://localhost:8080/MajorProject/Sotp">
                            <table class="table">
                        <tbody>
                            <tr><td>ID: </td><td><input type="text" style="height:25px;" name="id"/></td></tr>
                            <tr><td>EMAIL: </td><td><input type="text" style="height:25px;" name="tbTo"/></td></tr>
                        
                            <tr><td><input type="submit" style="position: absolute;
                top: 95%;
                left: 35%;
                font-size: 20px;
                background-color: darkblue;
                border-radius: 10px;
                color: white;
                padding:6px;" value="Send"/></td>
                                <td><input type="reset" value="Clear" style="position: absolute;
                top: 95%;
                left: 65%;
                font-size: 20px;
                background-color: black;
                border-radius: 10px;
                color: white;
                padding:6px;"></td></tr>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                                </form>
                </div>
            
    </body>
</html>