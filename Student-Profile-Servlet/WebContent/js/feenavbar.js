function defaultFrameSrc(){
document.getElementById("navscroller").style.marginLeft="16%";
document.getElementById("fee-frame").src="/Student-Profile-Servlet/PaymentHistory";
}
function defaultFeeFrameSrc(){
document.getElementById("navscroller").style.marginLeft="16%";
document.getElementById("fee-frame").src="/Student-Profile-Servlet/ApprovePayments";
}

function changeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("fee-frame").src="/Student-Profile-Servlet/PaymentHistory";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("fee-frame").src="/Student-Profile-Servlet/GenerateReceipt";
    }
    else if(i.localeCompare("3")==0){
        document.getElementById("navscroller").style.marginLeft="73.5%";
        document.getElementById("fee-frame").src="/Student-Profile-Servlet/UploadReceipt";
    
    }
}

function changeFeeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("fee-frame").src="/Student-Profile-Servlet/ApprovePayments";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("fee-frame").src="/Student-Profile-Servlet/ChangeScholarship";
    }
}