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
            <!-- First Name, Last Name
Picture
Personal Email ID, Official Email ID, Phone No.
Gender, Date of birth, Nationality, Native State, Native Place, Mother Tongue, Country of Residence
Community, Caste, Marital Status
Government Identification Type, Number, (NRI Students) Passport Number, Validity Date, Visa Type, Number, Validity Date
Hostelite: Hostel Name, Block, Room No.
Day Scholar: Self or Bus Route, Boarding Point
Communication Address, Permanent Address
Blood Group, Allergies, Health Remarks
 -->
          
            <tr>
                <th>First Name</th>
                <td width="70%"><c:out value="${stu.getfirst_name()}" /></td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td width="70%"><c:out value="${stu.getlast_name()}" /></td>
            </tr>
            <tr>
                <th>Official Email ID</th>
                <td width="70%"><c:out value="${stu.getemail()}" /></td>
            </tr>
            <tr>
                <th>Personal Email ID</th>
                <td width="70%"><c:out value="${stu.getpersonal_email()}" /></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td width="70%"><c:out value="${stu.getphone()}" /></td>
            <tr>
                <th>Gender</th>
                <td width="70%"><c:out value="${stu.getgender()}" /></td>
            </tr>
            <tr>
                <th>DOB</th>
                <td width="70%"><c:out value="${stu.getdob()}" /></td>
            </tr>
            <tr>
                <th>Natioanlity</th>
                <td width="70%"><c:out value="${stu.getnationality()}" /></td>
            </tr>
            <tr>
                <th>Native State</th>
                <td width="70%"><c:out value="${stu.getnative_state()}" /></td>
            </tr>
            <tr>
                <th>Mother Tongue</th>
                <td width="70%"><c:out value="${stu.getmother_tongue()}" /></td>
            </tr>
            <tr>
                <th>Country of Residence</th>
                <td width="70%"><c:out value="${stu.getcountry_of_residence()}" /></td>
            </tr>
            
            <tr>
                <th>Address</th>
                <td width="70%"><c:out value="${stu.getaddress()}" /></td>
            </tr>
            <tr>
                <th>Aadhar No.</th>
                <td width="70%"><c:out value="${stu.getaadhar_no()}" /></td>
            </tr>
        </table>

        <c:choose>
            <c:when test="${ht!=null}">
                <table class="table table-bordered">
                    <tr>
                        <th>Hostel</th>
                        <td width="70%"><span class="custom-badge badge rounded-pill bg-primary"><c:out value="${ht.gethostel_name()}" /></span></td>

                        <th>Block</th>
                        <td width="70%"><span class="custom-badge badge rounded-pill bg-primary"><c:out value="${ht.getblock()}" /></span></td>

                        <th>Room</th>
                        <td width="70%"><span class="custom-badge badge rounded-pill bg-primary"><c:out value="${ht.getroom()}" /></span></td>
                    </tr>
                </table>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered">
                    <tr>
                        <th>Dayscholar Route</th>
                        <td ><span class="custom-badge badge rounded-pill bg-primary"><c:out value="${dsr.getroute()}" /></span></td>
                        
                        <th>Boarding Point</th>
                        <td ><span class="custom-badge badge rounded-pill bg-primary"><c:out value="${dsr.getboarding_point()}" /></span></td>
                    </tr>
                </table>
            </c:otherwise>
        </c:choose>
        

        <table class="table table-bordered">
            <tr>
                <th>Blood Group</th>
                <td width="70%"><c:out value="${health.getblood_group()}" /></td>
            </tr>
            <tr>
                <th>Allergies</th>
                <td width="70%">
                    <c:choose>
                        <c:when test="${health.getallergies()!=null}">
                            <b> <c:out value="${health.getallergies()}" /> </b>
                        </c:when>
                        <c:otherwise>
                            <span class="custom-badge badge rounded-pill bg-success"><c:out value="NIL" /></span>
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
            <tr>
                <th>Health Remarks</th>
                <td width="70%">
                    <c:choose>
                        <c:when test="${health.getremarks()!=null}">
                            <span class="custom-badge badge rounded-pill bg-danger"><c:out value="${health.getremarks()}" /></span>
                        </c:when>
                        <c:otherwise>
                            <span class="custom-badge badge rounded-pill bg-success"><c:out value="NIL" /></span>
                        </c:otherwise>
                    </c:choose>
                    
                </td>
            </tr>
        </table>

        </div>

   </div>
</body>
</html>