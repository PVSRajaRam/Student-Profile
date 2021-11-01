<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <title>Student Profile</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile-styles.css">
    
</head>
<body>
   <div id="nav-profile-table">
        <!-- <h3><i class="bi bi-funnel" id="filter-icon"></i></h3> -->
        <button id="export-button" type="button" class="btn btn-outline-warning">Export as CSV</button>
   </div>

   <div class="row">
    <div class="col-md-8">
        <table class="table table-bordered" style="margin-left:11%">
            <!-- First Name, Last Name
            Picture
            Roll number
            In/Out Campus
            Year of study, Current Semester, Program, Branch, Section
            Personal Email ID, Official Email ID, Phone No.
            Class Advisor Name, Phone No.
            CGPA, Last SGPA
            Fee Payment Status
            Active Fee Scholarship
            Active Disciplinary Action
            Pending Dues -->
            <tr>
                <th>Name</th>
                <td width="70%">Arun S</td>
            </tr>
            <tr>
                <th>Roll Number</th>
                <td width="70%">CB.EN.U4CSE17001</td>
            </tr>
            <tr>
                <th>In Campus</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-success" >IN </span></td>
            </tr>
            <tr>
                <th>Academic Program</th>
                <td width="70%">B.Tech</td>
            </tr>
            <tr>
                <th>Branch</th>
                <td width="70%">Computer Science and Engineering ​<p class="text-muted" style="display:inline">(CSE)</p></td>
            </tr>
            <tr>
                <th>Section</th>
                <td width="70%">A</td>
            </tr>
            <tr>
                <th>Study Year</th>
                <td width="70%">4</td>
            </tr>
            <tr>
                <th>Semester</th>
                <td width="70%">7</td>
            </tr>
            <tr>
                <th>Class Advisor</th>
                <td width="70%">Mr. Kumar S</td>
            </tr>
            <tr>
                <th>Advisor Phone</th>
                <td width="70%">9999834567</td>
            </tr>
            <tr class="blank-row">
                <th colspan="2"></th>
            </tr>
            <tr>
                <th>Personal Email ID</th>
                <td width="70%">aruns@gmail.com</td>
            </tr>
            <tr>
                <th>Official Email ID</th>
                <td width="70%">cb.en.u4cse17001@cb.students.amrita.edu</td>
            </tr>
            <tr>
                <th>Phone</th>
                <td width="70%">9841984321</td>
            </tr>
            <tr class="blank-row">
                <th colspan="2"></th>
            </tr>
            <tr>
                <th>CGPA</th>
                <td width="70%">9.67</td>
            </tr> 
            <tr class="blank-row">
                <th colspan="2"></th>
            </tr>
            <tr>
                <th>Fee Payment Status</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-success" >PAID</span></td>
            </tr>
            <tr>
                <th>Active Fee Scholarship</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-secondary">NIL</span></td>
            </tr>
            <tr class="blank-row">
                <th colspan="2"></th>
            </tr>
            <tr>
                <th>Active Disciplinary Action</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-secondary" >NIL</span></td>
            </tr>
            <tr>
                <th>Pending Dues</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-danger" >100</span></td>
            </tr> 
        </table>
        </div>

        <div class="col-md-4 text-center">
            <div class="thumbnail">
                <img class="student-photo" src="${pageContext.request.contextPath}/images/student-pic.jpg" width="90%" height="90%"/>
            </div>
        </div>

   </div>
</body>
</html>