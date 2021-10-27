function defaultFrameSrc(){
document.getElementById("navscroller").style.marginLeft="16%";
document.getElementById("attendance-frame").src="attendance.html";
}
function changeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("attendance-frame").src="attendance.html";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("attendance-frame").src="attendance_report.html";
    }
}