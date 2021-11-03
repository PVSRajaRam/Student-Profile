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
    <div id="nav-fee-table">
        <!-- <button id="export-button" type="button" class="btn btn-outline-warning">Export as CSV</button> -->
        <div id="search-bar" style="background-color: #fcaf03;">

            <input type="text" class="form-control" id="enterTxnNo" placeholder="Enter transaction no"
                oninput="searchTable(this,1)">

            <div id="search-icon-box">
                <img src="${pageContext.request.contextPath}/images/search-icon.png" width="30px" height="30px" />
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
                    <td class="txnno">
                        <c:out value='${appr.txn_number}' />
                    </td>
                    <td class="txndate">
                        <c:out value='${appr.txn_date}' />
                    </td>
                    <td class="rollno">
                        <c:out value='${appr.roll_number}' />
                    </td>
                    <td class="txnpurp">
                        <c:out value='${appr.txn_purpose}' />
                    </td>
                    <td class="amt">
                        <c:out value='${appr.txn_amt}' />
                    </td>
                    <td class="bank">
                        <c:out value='${appr.bank}' />
                    </td>
                    <td class="mode">
                        <c:out value='${appr.payment_mode}' />
                    </td>
                    <td><button type="button" id="<c:out value='${appr.txn_number}' />" class="btn btn-success"
                            onclick="expand(this)">Expand</button></td>
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
                    <input type="date" class="form-control uploadcontrol" id="disp-txn-date" name="uploadtxndate"
                        required>
                </div>
            </div>
            <div class="form-group row">
                <label for="disp-txn-roll" class="col-sm-2 col-form-label">Roll Number</label>
                <input type="text" class="form-control uploadcontrol" id="disp-txn-roll" name="uploadrollno" required>
            </div>
            <div class="form-group row">
                <label for="disp-txn-purpose" class="col-sm-2 col-form-label">Purpose</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-purpose" name="uploadtxnpurpose"
                        required>
                </div>
            </div>
            <div class="form-group row">
                <label for="disp-txn-amount" class="col-sm-2 col-form-label">Amount</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control uploadcontrol" id="disp-txn-amount" name="uploadtxnamount"
                        required>
                </div>
            </div>
            <div class="form-group row">
                <label for="disp-txn-bank" class="col-sm-2 col-form-label">Bank</label>
                <input type="text" class="form-control uploadcontrol" id="disp-txn-bank" name="uploadtxnbank" required>

            </div>
            <div class="form-group row">
                <label for="disp-txn-mode" class="col-sm-2 col-form-label">Payment <br>Mode</label>
                <input type="text" class="form-control uploadcontrol" id="disp-txn-mode" name="uploadtxnmode" required>
            </div>

            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" style="float:left;">Approve</button>
                    <button type="button" class="btn btn-danger" style="float:left; margin-left:5%;"><a id="denyref"
                            href="./DeleteReceipt" style="text-decoration:none;color:white;">Deny</a></button>
                </div>
            </div>
        </form>

    </div>
    <script>
        function expand(s) {

            tabrows = document.getElementById('histTable').rows;
            for (i = 0; i < tabrows.length; i++) {
                console.log(tabrows[i].id)
                if (tabrows[i].id.localeCompare(s.id) == 0) {
                    console.log(tabrows[i].children);
                    var txnno = tabrows[i].getElementsByClassName('txnno')[0].innerHTML;
                    var bank = tabrows[i].getElementsByClassName('bank')[0].innerHTML;
                    document.getElementById('disp-txn-no').value = txnno;
                    document.getElementById('disp-txn-date').value = tabrows[i].getElementsByClassName('txndate')[0]
                        .innerHTML;
                    document.getElementById('disp-txn-roll').value = tabrows[i].getElementsByClassName('rollno')[0]
                        .innerHTML;
                    document.getElementById('disp-txn-purpose').value = tabrows[i].getElementsByClassName('txnpurp')[0]
                        .innerHTML;
                    document.getElementById('disp-txn-amount').value = tabrows[i].getElementsByClassName('amt')[0]
                        .innerHTML;
                    document.getElementById('disp-txn-bank').value = bank;
                    document.getElementById('disp-txn-mode').value = tabrows[i].getElementsByClassName('mode')[0]
                        .innerHTML;
                    document.getElementById('rem-fee').style.display = "block";
                    var query = "./DeleteReceipt?" + "uploadtxnno=" + txnno + "&uploadtxnbank=" + bank;

                    document.getElementById('denyref').href = query;

                }
            }
        }

    </script>

</body>

</html>
