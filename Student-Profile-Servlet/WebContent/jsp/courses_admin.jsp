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

    <!-- <script src="${pageContext.request.contextPath}/js/delete_achievement.js"></script> -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/achievements_styles.css">

</head>

<body>
    <h2 class="btn btn-warning custom" id="section-bar">Courses</h2>
    <div class="container-fluid" style="margin-top: 5%;">
        <div class="row justify-content-center">
            <div class="col-12 table-responsive">
                <c:choose>
                    <c:when test="${empty achievements}">
                        <div class="alert alert-info" role="alert">
                            No Achievement Data
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-hover" id="achv_table">
                            <thead>
                                <tr class="bg-warning">
                                    <th scope="col">#</th>
                                    <th scope="col">Student</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Date</th>
                                    <!-- <th scope="col">Proof</th> -->
                                    <th scope="col">Status</th>
                                    <th scope="col">Acknowledge</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="achv" items="${achievements}">
                                    <tr>
                                        <td class="counter-col"></td>
                                        <td>
                                            <c:out value="${achv.student_id}" />
                                        </td>
                                        <td>
                                            <c:out value="${achv.title}" />
                                        </td>
                                        <td>
                                            <c:out value="${achv.achievement_type}" />
                                        </td>
                                        <td>
                                            ${achv.proof_date}
                                        </td>

                                        <!-- <td><a class="btn btn-labeled btn-info btn-sm" download
                                                href="${achv.proof_file}">
                                                <i class="bi bi-file-earmark-arrow-down"></i> Proof
                                            </a>
                                        </td> -->
                                        <c:choose>
                                            <c:when test="${achv.verified==0}">
                                                <td><span class="badge rounded-pill bg-secondary">Not Verified</span>
                                                </td>
                                            </c:when>
                                            <c:when test="${achv.verified==1}">
                                                <td><span class="badge rounded-pill bg-success">Verified <i
                                                            class="bi bi-patch-check"></i></span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><span class="badge rounded-pill bg-danger">Rejected <i
                                                            class="bi bi-x-octagon"></i></span></td>
                                            </c:otherwise>
                                        </c:choose>

                                        <td>
                                            <form method="get" action="./AchievementAdmin">
                                                <button type="submit" class="btn btn-labeled btn-info btn-sm">
                                                    <i class="bi bi-check"></i> Accept
                                                </button>
                                                <input type="hidden" name="achievement_to_acc" value="${achv.id}">
                                            </form>
                                            <form method="get" action="./AchievementAdmin">
                                                <button type="submit" class="btn btn-labeled btn-warning btn-sm">
                                                    <i class="bi bi-x"></i> Reject
                                                </button>
                                                <input type="hidden" name="achievement_to_rej" value="${achv.id}">
                                            </form>
                                        </td>

                                        <td>
                                            <form method="get" action="./AchievementAdmin">
                                                <button type="submit" class="btn btn-labeled btn-danger btn-sm">
                                                    <i class="bi bi-trash"></i> Delete
                                                </button>
                                                <input type="hidden" name="achievement_to_del" value="${achv.id}">
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
