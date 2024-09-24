<!DOCTYPE html>
<html>
<head>
  <title>Subject Marks Form</title>
  <link rel="icon" href="../img/logo.ico" type="image/x-icon">
<style>
            body
            {
                background-image:url('uploadmarks.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden; 
                text-align: center;
            }

            .header{
                font-size: 20px;
                color:black;
                opacity: 1;
            }
            .formbody
            {
                position: absolute;
                top: 40%;
                left: 30%;
                transform: translate(-50%,-50%);
                width: 700px;
                height: 650px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.7);
                box-shadow: 0 0 50px black;
            }
            .button1
            {
                position: absolute;
                top: 80%;
                left:20%;
                padding:20px 30px;
                font-size: 26px;
                opacity: 1.5;
                color: blue;
            }
            .button2
            {
                position: absolute;
                top: 80%;
                left:40%;
                padding:20px 30px;
                font-size: 26px;
                opacity: 1.5;
                color: blue;
            }
        </style>
</head>
<body>
        <div class="formbody" >
            
            <div class="header">
                <h1><b>--UPLOAD MARKS--</b></h1>
            </div>
            <center>
                <br>
                <br>
  <form action="http://localhost:8080/MajorProject/UploadMarks" method="POST">
      <table style="position: absolute; left: 10%;top:30%;width: 70%; height: 40vh">
                        <tr><td style="font-size: 1.5em;">
                        </tr>
                        <tr>
                            <td style=" color:black; font-size: 1.5em;">Student ID:</td>
                            <td><input type="text" style="height:20px" id="id" name="id" required></td>
    </tr>
                    <tr>

                         <td  style=" width:70%; color:black; font-size: 1.5em;">Subject 1 Code:</td>
                    <td><input type="text" id="sub1" style="height:20px" name="sub1" required></td>
                     <td style=" color:black; font-size: 1.5em;">Marks:</td>
                    <td> <input type="number" id="marks1" style="height:20px" name="marks1" min="0" max="100" required></td>
</tr>
                        <tr>
                             <td style=" color:black; font-size: 1.5em;">Subject 2 Code:</td>
                            <td><input type="text" id="sub2" style="height:20px" name="sub2" required></td>
                              <td style=" color:black; font-size: 1.5em;">Marks:</td>
                            <td><input type="number" id="marks2" style="height:20px" name="marks2" min="0" max="100" required></td>
</tr>
                        <tr>
                             <td style=" color:black; font-size: 1.5em;">Subject 3 Code:</td>
                            <td><input type="text" id="sub3" style="height:20px" name="sub3" required></td>
                              <td style=" color:black; font-size: 1.5em;">Marks:</td>
                            <td><input type="number" id="marks3" style="height:20px" name="marks3" min="0" max="100" required></td>
</tr>
</table>
    <button class="button1" type="submit" style="background-color: darkgreen; color:whitesmoke; border-radius:13px;font-size: 15px;" value="Submit">UPLOAD</button>
    <button class="button2" onCLick="history.back()" type="button" style="background-color: black; color:whitesmoke; border-radius:13px;font-size: 14px;" value="Uploaded Marks">BACK</button>
      
    </form>
</body>
</html>
