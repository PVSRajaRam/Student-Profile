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
    <div class="col-md-9">
        <table class="table table-bordered">
            <!-- Admitted Campus, Program, Joining Year, Branch, Section
                Year of study, Current Semester
                Roll number, Enrolment number
                Class Advisor Name, Phone No.
                Date of enrolment, Enrollment status
                Qualifying exam, Proof document, Qualifying Exam State
                Admission Type, Scholarship
                For PhD Students only: 
                Work Status: Project/Teaching, Part time/Full time, Employment No. -->
          
            <tr>
                <th>Roll Number</th>
                <td width="70%"><c:out value="${enr.getroll_number()}" /></td>
            </tr>
            <tr>
                <th>Enrollment Number</th>
                <td width="70%"><c:out value="${enr.getenrollment_number()}" /></td>
            </tr>
            <tr>
                <th>Enrollment Status</th>
                <td width="70%"><span class="custom-badge badge rounded-pill bg-success"><c:out value="${enr.getenrollment_status()}" /></i></span></td>
            </tr>
            <tr>
                <th>Enrollment Date</th>
                <td width="70%"><c:out value="${enr.getenrollment_date()}" /></td>
            </tr>
            <tr>
                <th>Admitted Campus</th>
                <td width="70%"><c:out value="${enr.getadmitted_campus()}" /></td>
            </tr>
            <tr>
                <th>Academic Program</th>
                <td width="70%"><c:out value="${enr.getprogram()}" /></td>
            </tr>
            <tr>
                <th>Admitted Branch</th>
                <td width="70%"><c:out value="${enr.getbranch()}" /></td>
            </tr>
            <tr>
                <th>Joining Year</th>
                <td width="70%"><c:out value="${enr.getjoining_year()}" /></td>
            </tr>
        </table>
        <table class="table table-bordered">
            <tr>
                <th>Study Year</th>
                <td width="50%"><c:out value="${enr.getcurrent_year()}" /></td>

                <th>Semester</th>
                <td width="50%"><c:out value="${enr.getcurrent_sem()}" /></td>

                <th>Section</th>
                <td width="50%"><c:out value="${enr.getsection()}" /></td>
            </tr>
        </table>
        <table class="table table-bordered">
            <tr>
                <th>Class Advisor</th>
                <td width="50%"><c:out value="${enr.getclassadvisor_name()}" /></td>

                <th>Phone</th>
                <td width="50%"><c:out value="${enr.getclassadvisor_phone()}" /></td>
            </tr>
            <tr>
                <th>Admission Type</th>
                <td width="50%"><c:out value="${enr.getadmission_type()}" /></td>

                <th>Scholarship</th>
                <td width="50%">
                    <c:choose>
                        <c:when test="${enr.getscholarship()!=null}">
                            <span class="custom-badge badge rounded-pill bg-success"><c:out value="${enr.getscholarship()}" /></span>
                        </c:when>
                        <c:otherwise>
                            <span class="custom-badge badge rounded-pill bg-secondary"><c:out value="NIL" /></span>
                        </c:otherwise>
                    </c:choose>
            </tr>
            <tr>
                <th>Qualifying Exam</th>
                <td width="50%"><c:out value="${enr.getqualifying_exam()}" /></td>

                <th>Qualifying Exam State</th>
                <td width="50%"><c:out value="${enr.getqualifying_exam_state()}" /></td>
            </tr> 
        </table>
        </div>

        <!-- <div class="col-md-12">
            <div class="panel  panel-default ">
                <div class="panel-heading">
                    <h3 class="panel-title">For PhD Students</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th>Work Status</th>
                            <td>-</td>

                            <th>Employement ID</th>
                            <td>-</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div> -->

   </div>
</body>
</html>