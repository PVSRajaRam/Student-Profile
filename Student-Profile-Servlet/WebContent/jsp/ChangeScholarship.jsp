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
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/feesearch.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feestyles.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    
</head>
<body>
    <table class="table" id="histTable" style="width: 97%;margin-left:1%;">
    <thead>
      <tr>
        <th scope="col">Roll Number </th>
        <th scope="col">Scholarship</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <tr id="no-result" style="display: none;">
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <c:forEach var="fee" items="${fees}">
      	<form action="./UpdateScholarship" method="post">
	      <tr id="<c:out value='${fee.rollnumber}' />">
	        <td> <input class="form-control" id="rollno" name="rollno" value="${fee.rollnumber}" type="text" readonly></td>
	        <td><select class="form-control" id="slab" name="slab" value="${fee.slab}">
			      <option value="0">0 %</option>
			      <option value="50">50 %</option>
			      <option value="75">75 %</option>
			    </select>
	    	</td>
	        <td><button type="submit" class="btn btn-success receiptbutton">Update</button></td>
	       </tr>
	     </form>
      </c:forEach>
    </tbody>
  </table>
  
  
</body>
</html>