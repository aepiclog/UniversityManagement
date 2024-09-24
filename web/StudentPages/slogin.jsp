<%-- 
    Document   : slogin
    Created on : 10 May, 2023, 7:12:55 PM
    Author     : ARPITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head><title>Student Login</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
            body
            {
                background-image:url('Studentloginbackground.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden; 
                text-align: center;
            }

            .header{
                font-size: 15px;
                color:black;
                
                opacity: 1;
            }
            .formbody
            {
                backdrop-filter: blur(5px);
                position: absolute;
                top: 50%;
                left:70%;
                transform: translate(-50%,-50%);
                width: 400px;
                height: 500px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.7);
                box-shadow: 0 0 50px black;
            }
            .button
            {
                padding:8px 25px;
                font-size: 16px;
                opacity: 1.5;
                color: blue;
            }
        </style>
        <script>
            function funBack()
            {
                if (window.parent)
                {
                    if (confirm("Do you want to Exit") === true)
                    {
                        
                        window.parent.window.close();
                    }
                } else
                {
                    if (confirm("Do you want to Exit") === true)

                    {
                        
                        alert("Closing window......");
                        window.close();
                    }
                }
            }
            function validate() {
                if (document.loginform.temail.value === "")
                {
                    document.getElementById("te").innerHTML = "Email is empty";
                    return false;
                } else
                    document.getElementById("te").innerHTML = "";
                if (document.loginform.tpass.value === "")
                {
                    document.getElementById("tp").innerHTML = "password is empty";
                    return false;
                }
                document.getElementById("tp").innerHTML = "";
            }
        </script>
    </head>

    <body>

        <div class="formbody" >
            
            <div class="header">
                <h1><b>-- STUDENT LOGIN --</b></h1>
            </div>
            <center>
                <br>

            
                <form name="loginform" onsubmit="return validate()" method="POST" action="http://localhost:8080/MajorProject/StudentPages/StudentDash.jsp">
                    <table style="width: 30%; height: 25vh">
                        <tr><td style="font-size: 1.5em;">
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>ID: </b></td>
                            <td><input type="text" name="id"><span id="te" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style="color:black; font-size: 2.0em;"><b>Password: </b></td>
                            <td><input type="password" name="tpass"><span id="tp" style="color:red;font-size:95%"></span></td><br>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:match-parent">
                        <center>
                            <br>
                            <br>
                            <button class="button" type="submit" style="background-color: white; color:black; border-radius:13px;" value="login" name="button">Login</button>
                            <button class="button" type="button" style="background-color: red; color:white; border-radius:13px;" onclick="location.href='http://localhost:8080/MajorProject/Home.html'" >Home</button><br><br>
                        </center>
                        </td>
                        </tr>
                        <tr>
                        <br>
                            <td colspan="2"><a style="color:red;"  href="http://localhost:8080/MajorProject/StudentPages/ForgetPasswordS.jsp">Forgot Password</a></td>

                        </tr>
                    </table>
                </form>


            </center>
        </div>

    </body>
</html>



