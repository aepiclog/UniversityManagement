<!DOCTYPE html>
<html>
    <head>
        <title>AddAdmin</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
         <style>
            body
            {
                background-image:url('addadminbg.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden; 
                text-align: center;   
                font-family: "Georgia", Times, serif;
            }

            .header{
                position: absolute;
                top: 0%;
                left: 30%;
                font-size: 25px;
                color:black;
                opacity: 1;
            }
            .formbody
            {
                position: absolute;
                top: 50%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 800px;
                height: 600px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.85);
                box-shadow: 0 0 35px red;
                font-size: 22px;
                
            }
            .button
            {
                padding:8px 25px;
                font-size: 22px;
                opacity: 1.5;
                background-color: black;
                color: whitesmoke;
                border-radius: 25px;
            }
            table{
                position: absolute;
                top: 17%;
                left: 10%;
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
                    document.getElementById("te4").innerHTML = "Enter the password";
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
                <h1><b>-- ADD ADMIN --</b></h1>
            </div>
            <center>
                <br>
                <br>
                <br>
        <form name="loginform" onsubmit="return validate()"  method="POST" action="http://localhost:8080/MajorProject/AddAdmin" enctype="multipart/form-data">
        <table style="width: 30%; height: 25vh">
                        <tr><td style="font-size: 1.5em;">
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Image: </b></td>
                            <td><input type="file" id="image" name="image" onchange ="imgLoad(event)" style="height:25px;"><span id="te" style="color:red"></span></td>
                        </tr>
                    <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Name: </b></td>
                            <td><input type="text" id="fname" name="fname" style="height:25px;"><span id="te1" style="color:red;font-size:95%"></span></td>
                            <td><input type="text" id="lname" name="lname" style="height:25px;"><span id="te2" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Email: </b></td>
                            <td><input type="email" id="email" name="email" style="height:25px;"><span id="te3" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Password: </b></td>
                            <td><input type="password" id="pass" name="pass" style="height:25px;"><span id="te4" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Phone: </b></td>
                            <td><input type="text" id="phone" name="phone" style="height:25px;"><span id="te5" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>DOB: </b></td>
                            <td><input type="date" id="dob" name="dob" style="height:25px;"><span id="te6" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 2.0em;"><b>Gender: </b></td>
                            <td><input type="radio" value="Male" id="gender" name="gender" style="height:25px;">Male<span id="te7" style="color:red;font-size:95%"></span></td>
                            <td><input type="radio" id="gender" value="Female" name="gender" style="height:25px;">Female<span id="te7" style="color:red;font-size:95%"></span></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:match-parent">
                        <center>
                            <br>
                            <button class="button" type="submit"  value="Submit" name="button">Submit</button>
                            <button class="button" type="button"  onCLick="history.back()">Back</button><br><br>
                        </center>
                        </td>
                        </tr>
                    </table>
                </form>


            </center>
        </div>

    </body>
</html>
