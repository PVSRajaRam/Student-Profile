<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BonafideAdmin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bonafidestyles.css">
</head>
<body>
 <div class="container d-flex justify-content-center" style="margin-top: 5%;">

        <div class="d-flex justify-content-center">
            <form action ="<%=request.getContextPath() %>/bonafideservlet" method="post">
                <legend>
                    <h1 class="h4">Bonafide Certificate Detalis</h1>
                </legend>

				<label for="reqno" class="form-label">Request Number</label>
                <input type="text" class="form-control" name="applieddate">
                
                <label for="applieddate" class="form-label">Applied Date</label>
                <input type="date" class="form-control" name="applieddate">
                
                <label for="purpose" class="form-label">Purpose</label>
                <input type="text" class="form-control" name="purpose">
                
                <label for="status" class="form-label">Status</label>
                <input type="text" class="form-control" name="status">
                
                <label for="approvedstaff" class="form-label">Approved Staff</label>
                <input type="text" class="form-control" name="approvedstaff">
                
                <label for="approvedtime" class="form-label">Approved Time</label>
                <input type="time" class="form-control" name="approvedtime">
                
                <label for="preparedstaff" class="form-label">Prepared Staff</label>
                <input type="text" class="form-control" name="preparedstaff">
                
                <label for="preparedtime" class="form-label">Prepared Time</label>
                <input type="time" class="form-control" name="preparedtime">
                
                <label for="action" class="form-label">Action</label>
                <input type="text" class="form-control" name="action">


                <button type="submit" class="btn btn-primary">submit
                </button>

            </form>
        </div>





    </div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


</body>
</html>