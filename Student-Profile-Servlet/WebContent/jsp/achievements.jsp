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

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <link defer rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <script src="${pageContext.request.contextPath}/js/trigger_toast.js"></script>
    <script src="${pageContext.request.contextPath}/js/delete_achievement.js"></script>

    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/achievements_styles.css">

</head>

<body>
    <h2 class="btn btn-warning custom" id="section-bar">Achievements</h2>
    <div class="container-fluid" style="margin-top: 5%;">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr class="bg-warning">
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Date</th>
                            <th scope="col">Verified</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Modal -->
                        <!-- <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Delete Achievement</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure to delete this?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button"
                                            onclick="deleteAchievement(document.getElementById('video'))"
                                            class="btn btn-danger">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div> -->

                        <c:forEach var="achv" items="${achievements}">
                            <tr>
                                <td>
                                    <c:out value="${achv.id}" />
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
                                <td><span class="badge rounded-pill bg-secondary">Not Verified</span></td>
                                <td><button type="button" class="btn btn-labeled btn-info btn-sm">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </button>
                                </td>

                                <td>
                                    <form method="get" action="./AchievementController">
                                        <button type="submit" class="btn btn-labeled btn-danger btn-sm">
                                            <!-- data-bs-toggle="modal" data-bs-target="#deleteModal"> -->
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                        <input type="hidden" name="achievement_to_del" value="${achv.id}">
                                    </form>
                                </td>
                            </tr>

                        </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="col-10 col-lg-3">
                <form method="post" action="./AchievementController">
                    <legend>
                        <h3>Add Achievements</h3>
                    </legend>
                    <label for="achievement_title" class="form-label required-field">Title</label>
                    <input type="text" class="form-control" id="achievement_title" minlength="2" maxlength="200"
                        required name="achievement_title">

                    <label for="achievement_type" class="form-label required-field">Type</label>
                    <select class="form-select" id="achievement_type" name="achievement_type" aria-label="Select Type"
                        required>
                        <option selected disabled hidden value> -- select an option -- </option>
                        <option value="1">Academic</option>
                        <option value="2">Co-Curricular</option>
                        <option value="3">Sports</option>
                        <option value="4">Other</option>
                    </select>

                    <label for="achievement_date" class="form-label required-field">Date</label>
                    <input type="date" class="form-control" id="achievement_date" name="achievement_date">

                    <div class="">
                        <label for="formFile" class="form-label">Document</label>
                        <input class="form-control" type="file" name="proof_file" id="formFile"
                            accept="image/*,.doc,.pdf,.docx">
                    </div>

                    <button type="submit" class="btn btn-primary" id="add_button">
                        <i class="bi bi-plus-circle"></i> Add
                    </button>
                    <!-- Toast -->
                    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                        <div id="success_toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="toast-header">
                                <small class="me-auto">A Second ago</small>
                                <button type="button" class="btn-close" data-bs-dismiss="toast"
                                    aria-label="Close"></button>
                            </div>
                            <div class="toast-body">
                                Successfully Added Achievement
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

</body>

</html>
