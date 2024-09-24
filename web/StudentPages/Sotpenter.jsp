<html>
    <head>
        <title>Forget Password OTP</title>
        <link rel="icon" href="../img/logo.ico" type="image/x-icon">
        <style>
            body{
                background-color: white;
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:100% 100%;
                
            }
            header{
                position: absolute;
                top: 1%;
                left:30%;
                font-size: 48px;
                
            }
            .a{
             position: absolute;
                top: 59%;
                left:50%;
                transform: translate(-50%,-50%);
                width: 500px;
                height: 500px;
                padding: 70px 40px;
                box-sizing: border-box;
                border-radius: 30px; 
                background-color: #204d74;
                box-shadow: 0 0 50px black;
                text-align: center;
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
            h1{
                position: absolute;
                top:5%;
                left: 22%;
                color: white;
                font-size: 35px;
            }
            h2{
                position: absolute;
                top: 5%;
                left: 20%;
                font-size: 30px;
            }
            .table{
                position: absolute;
                top: 30%;
                left: 10%;
                font-size: 20px;
                padding: 10px;
            }
            button{
                position: absolute;
                top: 77%;
                left: 35%;
                font-size: 20px;
                background-color: darkblue;
                border-radius: 10px;
                color: white;
                padding:10px;
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
        </style>
        <script>
        function verifyOTP() {
            var x = <%= request.getSession().getAttribute("x")%>; // Replace with your desired OTP number
            var userEnteredOTP = document.getElementById("otp").value;

            if (parseInt(userEnteredOTP) === x) {
                window.location.href = "http://localhost:8080/MajorProject/StudentPages/ResetPasswordS.jsp"; // Replace with your desired action
                // You can perform additional actions here
            } else {
                alert("Incorrect OTP. Please try again."); // Replace with your desired action
                // You can perform additional actions here
            }
        }
    </script>
    </head>
    <body>
        <img class="abc" src='LOGO.png' style="width:165px; height:125px">
        <img class="abc1" src='resetlogo.png' style="width:135px; height:105px">
        <header><h3>HORIZON UNIVERSITY<h3></header>
        <div class="a">
        <h1> Verify OTP </h1>
        <div class="b">
        <h2> Enter Your : </h2>
        <table class="table">
            <tr>
                <td><b> ID : </b></td>
                <td><input type="text" readonly="#" value=<%= request.getSession().getAttribute("id") %> style="height:25px;"></td></tr>
            <tr><td><b>Email : </b></td>
                <td><input type="text" readonly="#" value=<%= request.getSession().getAttribute("vto") %> style="height:25px;"></td></tr>
            <tr><td><b> Enter OTP : </b></td>
                <td><input type="text" id="otp" name="otp" style="height:25px;"></td></tr>
        <button type="button" value="Verify" onclick="verifyOTP()"> CONFIRM </button>
        </div>
        </div>
    </body>
</html>
