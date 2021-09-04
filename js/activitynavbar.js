function defaultFrameSrc(){
document.getElementById("navscroller").style.marginLeft="16%";
document.getElementById("activity-frame").src="attendance.html";
}
function changeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("activity-frame").src="club.html";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("activity-frame").src="event.html";
    }
	else if(i.localeCompare("3")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("activity-frame").src="activity_upload.html";
    }
}