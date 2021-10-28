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
   <div id="nav-fee-table">
        <!-- <button id="export-button" type="button" class="btn btn-outline-warning">Export as CSV</button> -->
        <div id="search-bar" style="background-color: #fcaf03;">
            
          <input type="text" class="form-control" id="enterTxnNo" placeholder="Enter transaction no" oninput="searchTable(this,1)">
            
            <div id="search-icon-box">
                <img src="${pageContext.request.contextPath}/images/search-icon.png" width="30px" height="30px"/>
            </div> 

            <!--<div class="form-group has-search bg-warning">
              <span class="bi bi-search search-form-control-feedback"></span>
              <input type="text" class="search-form-control" id="enterTxnNo" placeholder="Enter transaction no" oninput="searchTable(this)">
            </div>-->
        </div>
   </div>
   <table class="table" id="histTable" style="width: 97%;margin-left:1%;">
    <thead>
      <tr>
        <th scope="col">DD/Txn No</th>
        <th scope="col">DD/Txn Date </th>
        <th scope="col">Roll Number </th>
        <th scope="col">Purpose</th>
        <th scope="col">Amount</th>
        <th scope="col">Bank</th>  
        <th scope="col">Payment Mode</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <tr id="no-result" style="display: none;">
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <c:forEach var="appr" items="${approvals}">
      	
	      <tr id="<c:out value='${appr.txn_number}' />">
	        <td class="txnno"><input type="text" class="form-control uploadcontrol" id="upload-txn-no" name="uploadtxnno" value="<c:out value='${appr.txn_number}' />" readonly></td>
	        <td class="txndate"><input type="date" class="form-control uploadcontrol" id="upload-txn-date" name="uploadtxndate" value="<c:out value='${appr.txn_date}' />" readonly></td>
	        <td class="rollno"><input type="text" class="form-control uploadcontrol" id="uploadrollno" name="uploadrollno" value="<c:out value='${appr.roll_number}' />" readonly></td>
	        <td class="txnpurp"><input type="text" class="form-control uploadcontrol" id="upload-txn-purpose" name="uploadtxnpurpose" value="<c:out value='${appr.txn_purpose}' />" readonly></td>
	        <td class="amt"><input type="text" class="form-control uploadcontrol" id="upload-txn-amount" name="uploadtxnamount" value="<c:out value='${appr.txn_amt}' />" readonly></td>
	        <td class="bank"><input type="text" class="form-control uploadcontrol" id="upload-txn-bank" name="uploadtxnbank" value="<c:out value='${appr.bank}' />" readonly></td>
	        <td class="mode"><input type="text" class="form-control uploadcontrol" id="upload-txn-mode" name="uploadtxnmode" value="<c:out value='${appr.payment_mode}' />" readonly></td>
	        <td><button type="button" id="<c:out value='${appr.txn_number}' />" class="btn btn-success" onclick="expand(this)">Expand</button></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div id="rem-fee" style="display:none;">
      <form action="./ChangeReceipt" method="post">
                <div class="form-group row">
                  <label for="disp-txn-no" class="col-sm-2 col-form-label">Txn No</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-no" name="uploadtxnno" readonly>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="disp-txn-date" class="col-sm-2 col-form-label">Txn Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control uploadcontrol" id="disp-txn-date" name="uploadtxndate" required>
                  </div>
                </div>
                <div class="form-group row">
                    <label for="disp-txn-roll" class="col-sm-2 col-form-label">Roll Number</label>
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-roll" name="uploadrollno" required>
                </div> 
                <div class="form-group row">
                  <label for="disp-txn-purpose" class="col-sm-2 col-form-label">Purpose</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-purpose" name="uploadtxnpurpose" required>
                  </div>
                </div>
                <div class="form-group row">
                    <label for="disp-txn-amount" class="col-sm-2 col-form-label">Amount</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control uploadcontrol" id="disp-txn-amount" name="uploadtxnamount" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="disp-txn-bank" class="col-sm-2 col-form-label">Bank</label>
                    <input type="text"class="form-control uploadcontrol" id="disp-txn-bank" name="uploadtxnbank" required>
                      
                </div>
                <div class="form-group row">
                    <label for="disp-txn-mode" class="col-sm-2 col-form-label">Payment <br>Mode</label>
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-mode" name="uploadtxnmode" required>
                </div>
                
                <div class="form-group row">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-success">Approve</button>
                    </div>
                </div>
              </form>

  </div>
  <script>
  function expand(s){
	  
	  tabrows=document.getElementById('histTable').rows;
	  for(i=0;i<tabrows.length;i++){
		  console.log(tabrows[i].id)
		  if(tabrows[i].id.localeCompare(s.id)==0)
			 {
			  console.log(tabrows[i].children);
			  document.getElementById('disp-txn-no').value=tabrows[i].getElementsByClassName('txnno')[0].children[0].value;
			  document.getElementById('disp-txn-date').value=tabrows[i].getElementsByClassName('txndate')[0].children[0].value;
			  document.getElementById('disp-txn-roll').value=tabrows[i].getElementsByClassName('rollno')[0].children[0].value;
			  document.getElementById('disp-txn-purpose').value=tabrows[i].getElementsByClassName('txnpurp')[0].children[0].value;
			  document.getElementById('disp-txn-amount').value=tabrows[i].getElementsByClassName('amt')[0].children[0].value;
			  document.getElementById('disp-txn-bank').value=tabrows[i].getElementsByClassName('bank')[0].children[0].value;
			  document.getElementById('disp-txn-mode').value=tabrows[i].getElementsByClassName('mode')[0].children[0].value;	  
              document.getElementById('rem-fee').style.display="block";			 
			 } 
	  }
  }
  </script>
  
</body>
</html>