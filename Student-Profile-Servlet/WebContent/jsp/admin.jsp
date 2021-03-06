<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <title>Student Profile</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <script src="${pageContext.request.contextPath}/js/navbar.js"></script>
</head>
<body>
    <div class="page">
        <div class="page section" id="page-section-1" style="width:12%;">
            <div class="btn-group-vertical" id="nav-buttons" style="height: 20%; margin-top:10%;overflow:auto;">
                <button type="button" class="btn btn-warning custom" style="margin-top:20px;" id="nav-1" onclick="changeAdminFrame(1)">FINANCE</button>
            </div>
            <div class="btn-group-vertical" id="nav-buttons" style="height: 20%; margin-top:10%;overflow:auto;">
                <button type="button" class="btn btn-warning custom" style="margin-top:20px;" id="nav-2" onclick="changeAdminFrame(2)">BONAFIDE</button>
            </div>
            <div class="btn-group-vertical" id="nav-buttons" style="height: 20%; margin-top:10%;overflow:auto;">
                <button type="button" class="btn btn-warning custom" style="margin-top:20px;" id="nav-3" onclick="changeAdminFrame(3)">ACHIEVEMENTS</button>
            </div>
            <div class="btn-group-vertical" id="nav-buttons" style="height: 20%; margin-top:10%;overflow:auto;">
                <button type="button" class="btn btn-warning custom" style="margin-top:20px;" id="nav-4" onclick="changeAdminFrame(4)">COURSES</button>
            </div>


        </div>
        <div class="page section" id="page-section-2" style="width:88%;">
            <div>
            <img src="/Student-Profile-Servlet/images/univ-logo.jpg" width="20%" height="100%" style="float: left;margin-top:20px;">
            <li class="nav-item dropdown" id="welcome-msg" style="margin-left: 60%;float:left; list-style-type:none;">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" style="color: black; " role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <strong id="adminid" style="font-size: 15px;"><c:out value="${User.email}" /></strong>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="/Student-Profile-Servlet/login.html">Log out</a>
                </div>
            </li>
            </div>           
            <iframe id="main-frame" src="${pageContext.request.contextPath}/FinanceAdmin"></iframe>
        </div>
    </div>
</body>
</html>