<!DOCTYPE html>
<html>
    <head>
        <title>Add Student</title>
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
                position: absolute;
                top: 45%;
                left:68.5%;
                transform: translate(-50%,-50%);
                width: 850px;
                height: 800px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.7);
                box-shadow: 0 0 50px black;
                
            }
            .button1
            {
                position: absolute;
                top: 90%;
                left:60%;
                padding:8px 25px;
                font-size: 16px;
                opacity: 1.5;
                color: whitesmoke;
                background-color: darkblue;
                border-radius: 13px;
            }
            .button2
            {
                position: absolute;
                top: 90%;
                left:75%;
                padding:8px 25px;
                font-size: 16px;
                opacity: 1.5;
                 background-color: black;
                color: whitesmoke;
                border-radius:13px;
            }
        </style>
        
        <script >

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
                    document.getElementById("te4").innerHTML = "password";
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
            }
            
        </script>
    </head>
    <body>

        <div class="formbody" >
            
            <div class="header">
                <h1 style="font-size:45px"><b>--ADD STUDENT--</b></h1>
            </div>
            <center>
                <br>
        <form name="loginform" onsubmit="return validate()"  method="POST" action="http://localhost:8080/MajorProject/AddStudent" enctype="multipart/form-data">
        <table style="width: 30%; height: 25vh">
                        <tr><td style="font-size: 1.5em;">
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Image: </b></td>
                            <td><input type="file" id="image" name="image" onchange ="imgLoad(event)"><span id="te" style="color:red"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Name: </b></td>
                            <td><input type="text" id="fname" name="fname"><span id="te1" style="color:red;font-size:95%"></span></td>
                            <td><input type="text" id="lname" name="lname"><span id="te2" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Email: </b></td>
                            <td><input type="email" id="email" name="email"><span id="te3" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Password: </b></td>
                            <td><input type="password" id="pass" name="pass"><span id="te4" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Phone: </b></td>
                            <td><input type="text" id="phone" name="phone"><span id="te5" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>DOB: </b></td>
                            <td><input type="date" id="dob" name="dob"><span id="te6" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Fathers Name: </b></td>
                            <td><input type="text" id="fathername" name="fathername"><span id="te7" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Gender: </b></td>
                            <td><input type="radio" value="Male" id="gender" name="gender">Male<span id="te8" style="color:red;font-size:95%"></span></td>
                            <td><input type="radio" value="Female" id="gender" name="gender">Female<span id="te8" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Department: </b></td>
                            <td><input type="text" id="dept" name="dept"><span id="te9" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Academic Year: </b></td>
                            <td><input type="text" id="year" name="year"><span id="te10" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:match-parent">
                        <center>
                            <br>
                            <br>
                            <button class="button1" type="submit"  value="login" name="button">Submit</button>
                            <button class="button2" type="button"  onCLick="history.back()">Back</button><br><br>
                        </center>
                        </td>
                        </tr>
                    </table>
                </form>


            </center>
        </div>

    </body>
</html>
