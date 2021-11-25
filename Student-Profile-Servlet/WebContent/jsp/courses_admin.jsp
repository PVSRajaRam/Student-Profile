<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <link defer rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/achievements_styles.css">

</head>

<body>
    <h2 class="btn btn-warning custom" id="section-bar">Courses</h2>
    <div class="container-fluid" style="margin-top: 5%;">
        <div class="row justify-content-center">
            <div class="col-12 table-responsive">
                <c:choose>
                    <c:when test="${empty courses}">
                        <div class="alert alert-info" role="alert">
                            No Application for Enrollment
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-hover" id="achv_table">
                            <thead>
                                <tr class="bg-warning">
                                    <th scope="col">#</th>
                                    <th scope="col">Student</th>
                                    <th scope="col">Course Code</th>
                                    <th scope="col">Course Name</th>
                                    <th scope="col">Credits</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Acknowledge</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="itr" items="${courses}">
                                    <tr>
                                        <td class="counter-col"></td>
                                        <td> ${itr.student_id} </td>
                                        <td>${itr.course_code}</td>
                                        <td>${itr.course_name}</td>
                                        <td><span class="badge rounded-pill bg-secondary">${itr.credits}</span></td>

                                        <c:choose>
                                            <c:when test="${itr.verified==0}">
                                                <td><span class="badge rounded-pill bg-secondary">Not Verified</span>
                                                </td>
                                            </c:when>
                                            <c:when test="${itr.verified==1}">
                                                <td><span class="badge rounded-pill bg-success">Approved <i
                                                            class="bi bi-patch-check"></i></span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><span class="badge rounded-pill bg-danger">Rejected <i
                                                            class="bi bi-x-octagon"></i></span></td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td>
                                            <form method="get" action="./CoursesAdmin">
                                                <input type="hidden" name="rollno" value="${itr.student_id}">
                                                <button type="submit" class="btn btn-labeled btn-info btn-sm">
                                                    <i class="bi bi-check"></i> Allow
                                                </button>
                                                <input type="hidden" name="course_to_acc" value="${itr.courses_id}">
                                            </form>
                                            <form method="get" action="./CoursesAdmin">
                                                <input type="hidden" name="rollno" value="${itr.student_id}">
                                                <button type="submit" class="btn btn-labeled btn-warning btn-sm">
                                                    <i class="bi bi-x"></i> Deny
                                                </button>
                                                <input type="hidden" name="course_to_rej" value="${itr.courses_id}">
                                            </form>
                                        </td>

                                        <td>
                                            <form method="get" action="./CoursesAdmin">
                                                <input type="hidden" name="rollno" value="${itr.student_id}">
                                                <button type="submit" class="btn btn-labeled btn-danger btn-sm">
                                                    <i class="bi bi-trash"></i> Delete
                                                </button>
                                                <input type="hidden" name="course_to_del" value="${itr.courses_id}">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

</body>

</html>
