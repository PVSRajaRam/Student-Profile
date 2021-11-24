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
        <button id="export-button" type="button" class="btn btn-outline-warning">Export as CSV</button>
        <!-- <h3><i class="bi bi-funnel" id="filter-icon"></i></h3> -->
   </div>
   <!-- Total count
   Details of all disciplinary actions
   Status
   Date, Time, Place
   Category, Type, Notice period 
   Reporting Authority
   Details, Action -->
   <h3 style="margin-left:10%">Count: <span class="custom-badge badge rounded-pill bg-success">0</span></h3>
   
   <table class="table" id="histTable" style="width: 81.8%;">
    <thead>
      <tr>
        <th scope="col">S.No.</th>
        <th scope="col">Date 
          <!-- <button style="background-color: #fcaf03;border:0px;">
            <img id="down-arrow" src="../images/downicon.png" width="20px" height="20px" style="float: left;margin-left:5px;" onclick="sortTable()">
            <img id="up-arrow" src="../images/upicon.png" width="20px" height="20px" style="float: left;margin-left:5px;display:none;" onclick="sortTable()">
          </button> -->
        </th>
        <th scope="col">Time</th>
        <th scope="col">Place</th>
        <th scope="col">Category</th>
        <th scope="col">Notice Period</th> 
        <th scope="col">Reporting Authority</th>
        <th scope="col">Details</th>
        <th scope="col">Action</th>

      </tr>
    </thead>
    <tbody>
      <tr id="no-result" style="display: none;">
        <tr id="no-result" style="display: none;">
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
        </tr>
        <c:forEach var="d" items="${das}">
          <tr>
            <td ><c:out value="${d.getid()}" /></td>
            <td ><c:out value="${d.getreport_date()}" /></td>
            <td ><c:out value="${d.getreport_time()}" /></td>
            <td><c:out value="${d.getplace()}" /></td>
            <td><c:out value="${d.getcategory()}" /></td>
            <td><c:out value="${d.getnotice_till()}" /></td>
            <td><c:out value="${d.getreporting_authority()}" /></td>
            <td><c:out value="${d.getdetails()}" /></td>
            <td><c:out value="${d.getaction()}" /></td>
          </tr>
        </c:forEach>
      </tr>
    </tbody>
  </table>