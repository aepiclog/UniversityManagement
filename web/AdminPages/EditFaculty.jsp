<html>
    <head>
        <title>Edit Faculty</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
         <style>
                       body
            {
                background-image:url('Facultyloginbackground.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden; 
                text-align: center;
            }

            .header{
                color:black;
                
                opacity: 1;
            }
            .formbody
            {
                position: absolute;
                top: 40%;
                left:30%;
                transform: translate(-50%,-50%);
                width: 700px;
                height: 650px;
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
            table{
                position: absolute;
                top: 35%;
                left: 13%;
            }
        </style>
        
        <script >
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
            
            function imgLoad(event) {

                var image = document.getElementById('imgout');
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg' || ext==='pdf')
                {
                    image.src = URL.createObjectURL(event.target.files[0]);
                    document.getElementById("imgerr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("imgerr").innerHTML = "Only png, jpg, jpeg types allowed";
                    image.src = "null/";
                    return false;
                }
            }
            function validate() {
                if (document.loginform.fname.value === "")
                {
                    document.getElementById("te1").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te1").innerHTML = "";
                if (document.loginform.lname.value === "")
                {
                    document.getElementById("te2").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te2").innerHTML = "";
                if (document.loginform.email.value === "")
                {
                    document.getElementById("te3").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te3").innerHTML = "";
                if (document.loginform.pass.value === "")
                {
                    document.getElementById("te4").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te4").innerHTML = "";
                if (document.loginform.phone.value === "")
                {
                    document.getElementById("te5").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te5").innerHTML = "";
                if (document.loginform.dob.value === "")
                {
                    document.getElementById("te6").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te6").innerHTML = "";
                if (document.loginform.gender.value === "")
                {
                    document.getElementById("te7").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te7").innerHTML = "";
                if (document.loginform.dept.value === "")
                {
                    document.getElementById("te8").innerHTML = "empty";
                    return false;
                } else
                    document.getElementById("te8").innerHTML = "";
            }
            
        </script>
    </head>
    <body>

        <div class="formbody" >
            
            <div class="header">
                <h1 style="font-size:45px"><b>--EDIT FACULTY--</b></h1>
            </div>
            <center>
        <form name="loginform" onsubmit="return validate()"  method="POST" action="http://localhost:8080/MajorProject/UpdateFaculty">
        <table style="width: 30%; height: 25vh">
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>ID: </b></td>
                            <td><input type="id" id="id" name="id" readonly=""  style="height:25px" value=<%= request.getSession().getAttribute("id") %>><span id="te" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <br>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Name: </b></td>
                            <td><input type="text" id="fname" name="fname" style="height:25px" value=<%= request.getSession().getAttribute("fname") %>><span id="te1" style="color:red;font-size:95%"></span></td>
                            <td><input type="text" id="lname" name="lname" style="height:25px" value=<%= request.getSession().getAttribute("lname") %>><span id="te2" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <br>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Email: </b></td>
                            <td><input type="email" id="email" name="email" style="height:25px" value=<%= request.getSession().getAttribute("email") %>><span id="te3" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <br>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Phone: </b></td>
                            <td><input type="text" id="phone" name="phone" style="height:25px" value=<%= request.getSession().getAttribute("phone") %>><span id="te5" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <br>
                       
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Department: </b></td>
                            <td><input type="text" id="dept" name="dept"><span id="te9" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:match-parent">
                        <center>
                            <br>
                            <br>
                            <button class="button" type="submit" style="background-color: darkgreen; color:whitesmoke; border-radius:13px" value="login" name="button">Submit</button>
                            <button class="button" type="button" style="background-color: black; color:whitesmoke; border-radius:13px" onCLick="history.back()">Back</button><br><br>
                        </center>
                        </td>
                        </tr>
                    </table>
                </form>


            </center>
        </div>

    </body>
</html>
