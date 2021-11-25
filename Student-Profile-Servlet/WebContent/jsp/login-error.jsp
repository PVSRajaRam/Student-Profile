<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,800" rel="stylesheet"> 
    <style>
        body{
            background-image: url('./images/background.png');
            background-repeat: no-repeat; 
            background-attachment: fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            font-family: 'Open Sans',sans-serif; 
            
            
            
        }

        p{
        
            width: 200px;
            text-align: center;
            font-weight: 800; 
            font-size: 40px;
        }
        a{
            color: black;
            font-size: 15px;
            font-weight: 100;
        }
    </style>
</head>
<body>
    <div style="float: left;margin-top:12%; margin-left:13%;">
        <p><strong>STUDENT</strong></p>
        <p style="color: #fcaf03;"><strong>PROFILE</strong></p>
        <form method="post" action="./Login">
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" required>
              
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
            </div>
            <h6 id="err-msg">Invalid Credentials</h6>
            <button type="submit" style="border: 0px;margin-left:20%; background-color:transparent;"><img src="./images/loginbutton.png" width="100" height="50"></button>
        
        </form>
        
    </div>
    <div style="float: left; margin-left:23.5%;margin-top:13%;">
        <img src="./images/student.png" width="250px" height="250px" />
    </div>
    <script>
        function changePage(){

            var em=document.getElementById('email').value;
            var pwd=document.getElementById('pwd').value;
            if((em.length!=0)&&(pwd.length!=0)){
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if(em.match(mailformat))
                window.location.href="index.html";

                else
                alert('Invalid email format');
            }
            else{
                alert('both fields mandatory');
            }
        
        }
    </script>
    
</body>
</html>