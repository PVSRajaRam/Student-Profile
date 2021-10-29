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
    <script src="${pageContext.request.contextPath}/js/feenavbar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainstyles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feestyles.css">

</head>
<body onload="defaultFrameSrc()">
    <div>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            Upload details for payments done via offline mode only
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div id="history-table" style="margin-left: 2%;">
          <table class="table" style="width: 81.8%;margin-top:100px;margin-left:0%;">
                  <thead>
                  <tr>
                      <th scope="col">DD/Txn Date</th>
                      <th scope="col">Purpose</th>
                      <th scope="col">Amount</th>
                      <th scope="col">Bank</th>
                      <th scope="col">Payment Mode</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="appr" items="${approvals}">
				      <tr>
				        <td><c:out value="${appr.txn_date}" /></td>
				        <td><c:out value="${appr.txn_purpose}" /></td>
				        <td><c:out value="${appr.txn_amt}" /></td>
				        <td><c:out value="${appr.bank}" /></td>
				        <td><c:out value="${appr.payment_mode}" /></td>
				      </tr>
			      </c:forEach>
                  
                  </tbody>
          </table>
        </div>
        <div class="genreceipts" id="upload-receipt">
            <form action="./InsertReceipt" method="post">
                <div class="form-group row">
                  <label for="upload-txn-no" class="col-sm-2 col-form-label">Txn No</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="upload-txn-no" name="uploadtxnno" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="upload-txn-date" class="col-sm-2 col-form-label">Txn Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control uploadcontrol" id="upload-txn-date" name="uploadtxndate" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="upload-txn-purpose" class="col-sm-2 col-form-label">Purpose</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="upload-txn-purpose" name="uploadtxnpurpose" required>
                  </div>
                </div>
                <div class="form-group row">
                    <label for="upload-txn-amount" class="col-sm-2 col-form-label">Amount</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control uploadcontrol" id="upload-txn-amount" name="uploadtxnamount" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="upload-txn-bank" class="col-sm-2 col-form-label">Bank</label>
                    <select class="form-control uploadcontrol" id="upload-txn-bank" name="uploadtxnbank" required>
                      <option>SBI</option>
                      <option>HDFC</option>
                      <option>Dhanalakshmi</option>
                    </select>
                </div>
                <div class="form-group row">
                    <label for="upload-txn-mode" class="col-sm-2 col-form-label">Payment <br>Mode</label>
                    <select class="form-control uploadcontrol" id="upload-txn-mode" name="uploadtxnmode" required>
                      <option>DD</option>
                      <option>Cheque</option>
                    </select>
                </div>
                <!--  <div class="form-group row">
                    <label for="upload-txn-proof" class="col-sm-2 col-form-label">Proof</label>
                    <input type="file" class="form-control-file uploadcontrol" id="upload-txn-proof" required>
                </div> -->
                <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-success">Upload</button>
                    </div>
                </div>
              </form>
        </div>
    </div>
</body>
</html>