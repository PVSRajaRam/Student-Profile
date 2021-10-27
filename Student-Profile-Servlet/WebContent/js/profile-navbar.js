function defaultFrameSrc(){
    document.getElementById("navscroller").style.marginLeft="2.8%";
    document.getElementById("profile-frame").src="profile-summary.html";
}

function changeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="2.8%";
        document.getElementById("profile-frame").src="profile-summary.html";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("profile-frame").src="profile-enrolment-details.html";
    }
    else if(i.localeCompare("3")==0){
        document.getElementById("navscroller").style.marginLeft="29.5%";
        document.getElementById("profile-frame").src="profile-personal-details.html";
    
    }
    else if(i.localeCompare("4")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("profile-frame").src="profile-parent-details.html";
    
    }
    else if(i.localeCompare("5")==0){
        document.getElementById("navscroller").style.marginLeft="64%";
        document.getElementById("profile-frame").src="profile-academic-history.html";
    
    }
    else if(i.localeCompare("6")==0){
        document.getElementById("navscroller").style.marginLeft="85%";
        document.getElementById("profile-frame").src="profile-disciplinary-actions.html";
    
    }
}