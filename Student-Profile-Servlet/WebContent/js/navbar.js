function changeFrame(i){
    if(i==1){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/dashboard.html";
    }
    else if(i==2){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/feepayment"
    }
    else if(i==3){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/gatepass.html"
    }
    else if(i==4){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/bonafidemain.html"
    }
    else if(i==5){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/AchievementController"
    }
    else if(i==6){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/CoursesController"
    }
    else if(i==7){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/jsp/profile-main.jsp"
    }
    else if(i==8){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/librarymain.html"
    }
    else if(i==9){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/activity_main.html"
    }
    else if(i==10){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/html/attendance_main.html"
    }
}

function changeAdminFrame(i){
	if(i==1){
        document.getElementById("main-frame").src="/Student-Profile-Servlet/FinanceAdmin";
    }
	else if(i==2)
	{
		document.getElementById("main-frame").src="/Student-Profile-Servlet/bonafideservlet";		
	}
    else if(i==3)
	{
		document.getElementById("main-frame").src="/Student-Profile-Servlet/AchievementAdmin";		
	}
    else if(i==4)
	{
		document.getElementById("main-frame").src="/Student-Profile-Servlet/CoursesAdmin";		
	}
}