function changeNav(obj){
    i=obj.id;
    if(i.localeCompare("1")==0){
        document.getElementById("navscroller").style.marginLeft="16%";
        document.getElementById("bonafide-frame").src="bonafide.html";
    }
    else if(i.localeCompare("2")==0){
        document.getElementById("navscroller").style.marginLeft="45%";
        document.getElementById("bonafide-frame").src="applybonafide.html";
    }
    else if(i.localeCompare("3")==0){
        document.getElementById("bonafide-frame").style.marginLeft="73.5%";
    }
}