<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course</title>
    <link rel="icon" href="../img/logo.ico" type="image/x-icon">
    <style>
        body{
                background-image:url('addadminbg.jpg');
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                overflow: hidden;
                text-align: center;
        }
        .a{
                position: absolute;
                top: 60%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 500px;
                height: 400px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: rgba(255,255,255,0.85);
                box-shadow: 0 0 30px white;
                font-size: 22px;
        }
    </style>
</head>
<body>
    <h1 style="font-size: 100px ; color: white;">COURSE</h1>
    <div class="a">
    <form name="save" id="save"action="http://localhost:8080/MajorProject/AddSyllabus" method="post">
        Course Name:
        <input type="text" name="course" style="font-size: 25px; border-radius: 25px; background-color: black; color: white" >
        <br><br>
        <u>Enter Syllabus link</u><br><br>
        <textarea form="save" id="syllabus" name="syllabus" rows="6" cols="50" style="background-color: rgb(88,88,88);height:80px; color:white" required></textarea><br><br>
        
        <button type="submit" style="font-size: 25px; border-radius: 25px; background-color: black; color: white">ADD</button>
        
            <input type="button" style="font-size: 25px; border-radius: 25px; background-color: black; color: white" onCLick="history.back()" value="BACK">
    </form>
    </div>

</body>
</html>
