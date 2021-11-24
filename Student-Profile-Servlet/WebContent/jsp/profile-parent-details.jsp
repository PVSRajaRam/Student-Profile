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


<c:forEach var="p" items="${parents}">
<div class="row">
<div class="col-md-12">
<div class="panel  panel-success">
        
        <div class="panel-heading parent-table-heading">
            <b> <h5 class="panel-title"><strong>Details of <c:out value="${p.getrelation()}" /> </strong></h5></b>

            <c:choose>
                        <c:when test="${p.getprimary_contact()==True}">
                            <h5>(Primary Contact)</h5>
                        </c:when>
            </c:choose>
            
        </div>

        <div class="panel-body" style="padding: 5px;">
        <table class="table parent-table table-borderless">
            <tr>
                <th>Name</th>
                <td><c:out value="${p.getname()}" /> </td>

                <th>D.O.B</th>
                <td>
                    05-05-1965
                    <span class="text-muted">(Age: 56)</span></td>
            </tr>

            <tr>
                <th>Occupation</th>
                <td> <c:out value="${p.getoccupation()}" /> </td>

                <th>Annual Income</th>
                <td> <c:out value="${p.getannual_income()}" />  </td>
            </tr>

            <tr>
                <th>Mobile</th>
                <td> <c:out value="${p.getoffice_phone()}" />  </td>

                <th>E-Mail</th>
                <td> <c:out value="${p.getemail()}" />  </td>
            </tr>
            <tr>
                <th>Address</th>
                <td colspan="3"><c:out value="${p.getoffice_address()}" /> </td>

            </tr>

        </table>
    </div>
</div>
</div>
</div>
</c:forEach>
<!-- 
            <div class="col-md-12">
<div class="panel  panel-default ">
    <div class="panel-heading parent-table-heading">
        <h5 class="panel-title">
            <strong>Details of Mother</strong>
                                    </h5>
    </div>
    <div class="panel-body" style="padding: 5px;">
        <table class="table parent-table table-borderless">
            <tr>
                <th>Name</th>
                <td>N Nagarathinam</td>

                <th>D.O.B</th>
                <td>
                    13-05-1967
                    <span class="text-muted">(Age: 54)</span> 
                </td>
            </tr>

            <tr>
                <th>Occupation</th>
                <td> Home Maker </td>

                <th>Annual Income</th>
                <td><span class='text-muted'>N/A</span></td>
            </tr>

            <tr>
                <th>Mobile</th>
                <td> 8056509893 </td>

                <th>E-Mail</th>
                <td><span class='text-muted'>N/A</span></td>
            </tr>
            <tr>
                <th>Address</th>
                <td colspan="3"><span class='text-muted'>N/A</span></td>
            </tr>

        </table>
    </div>
</div>
</div>
<div class="col-md-12">
<div class="panel  panel-default ">
    <div class="panel-heading parent-table-heading">
        <h5 class="panel-title">
            <strong>Details of Guardian</strong>
                                    </h5>
    </div>
    <div class="panel-body" style="padding: 5px;">
        <table class="table parent-table table-borderless">
            <tr>
                <th>Name</th>
                <td><span class='text-muted'>N/A</span></td>

                <th>Relationship</th>
                <td><span class='text-muted'>N/A</span></td>
            </tr>

            <tr>
                <th>Mobile</th>
                <td><span class='text-muted'>N/A</span></td>

                <th>E-Mail</th>
                <td><span class='text-muted'>N/A</span></td>
            </tr>
            <tr>
                <th>Address</th>
                <td colspan="3"><span class='text-muted'>N/A</span></td>

            </tr>

        </table>
    </div>
</div>
</div> -->
</body>
</html>