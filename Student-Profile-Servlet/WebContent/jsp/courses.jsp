<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/courses_styles.css">

</head>

<body>
    <div class="btn btn-warning custom" id="section-bar">COURSES</div>
    <div class="container d-flex justify-content-center" style="margin-top: 5%;">
        <div class="row justify-content-around align-content-center">
            <form method="get" action="./CoursesController">
                <div class="col-8">
                    <select class="form-select" aria-label="Select Semester" name="semester">
                        <option value="1" selected>Semester 1</option>
                        <option value="2">Semester 2</option>
                        <option value="3">Semester 3</option>
                        <option value="4">Semester 4</option>
                        <option value="5">Semester 5</option>
                        <option value="6">Semester 6</option>
                        <option value="7">Semester 7</option>
                        <option value="8">Semester 8</option>
                    </select>
                </div>

                <div class="col-2">
                    <button type="submit" class="btn btn-success">Go <i class="bi bi-arrow-right"></i></button>
                </div>
            </form>

            <div class="col-12">
                <h2>Semester ${semester}</h2>
                <c:choose>
                    <c:when test="${empty courses}">
                        <div class="alert alert-info col-12" role="alert">
                            No Courses Data
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="col-12 table table-hover" id="course_table">
                            <thead>
                                <tr class="bg-warning">
                                    <th scope="col">#</th>
                                    <th scope="col">Course Code</th>
                                    <th scope="col">Course Name</th>
                                    <th scope="col">Credits</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="itr" items="${courses}">
                                    <tr>
                                        <td class="counter-col"></td>
                                        <td>${itr.course_code}</td>
                                        <td>${itr.course_name}</td>
                                        <td><span class="badge rounded-pill bg-secondary">${itr.credits}</span></td>
                                        <c:choose>
                                            <c:when test="${itr.applied==0}">
                                                <td>
                                                    <form method="get" action="./CoursesController">
                                                        <input type="hidden" name="courses_id"
                                                            value="${itr.courses_id}">
                                                        <button type="submit" class="btn btn-success">Apply</button>
                                                    </form>
                                                </td>
                                            </c:when>
                                            <c:when test="${itr.verified==0}">
                                                <td><span class="badge rounded-pill bg-secondary">Waiting</span>
                                                </td>
                                            </c:when>
                                            <c:when test="${itr.verified==1}">
                                                <td><span class="badge rounded-pill bg-success">Enrolled <i
                                                            class="bi bi-patch-check"></i></span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><span class="badge rounded-pill bg-danger">Rejected <i
                                                            class="bi bi-x-octagon"></i></span></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

</body>


</html>
