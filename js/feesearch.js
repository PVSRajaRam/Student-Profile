
var sort=0;
function searchTable(obj){
    var query=obj.value;
    tabrows=document.getElementById('histTable').rows;
    document.getElementById('no-result').style.display="none";
    if(query.length>0){
        var f=0;
        for(i=0;i<tabrows.length;i++){
            txnnoDOM=tabrows[i].getElementsByClassName('txnno');
            if(txnnoDOM.length!=0){
                console.log(txnnoDOM);
                if(txnnoDOM[0].innerHTML.startsWith(query)){
                    tabrows[i].style.display="";
                    f=1;
                }
                else{
                    tabrows[i].style.display="none";
                }
            }
        }

        if(f==0)
        {
            document.getElementById('no-result').style.display="table-row";
        }
    }

    else{
        
        for(i=0;i<tabrows.length;i++){
            tabrows[i].style.display="table-row";
        }
        document.getElementById('no-result').style.display="none";
    }
}

function sortTable() {
    var table, rows, switching, i, x, y, shouldSwitch;
    
    swap = true;
   
    
    while (swap) {
     console.log("inside loop");
      swap = false;
      rows = document.getElementsById('histTable').rows;;
     
      for (i = 2; i < (rows.length - 1); i++) {
        
        shouldSwap = false;
        x = rows[i].getElementsByClassName("txndate")[0].innerHTML;
        y = rows[i + 1].getElementsByClassName("txndate")[0].innerHTML;
        console.log(x+" "+y);
        fd=new Date(x);
        sd=new Date(y);
        console.log(fd+" "+sd+(fd<sd));
        if(sort==0){
            if (fd<sd) {
            shouldSwap = true;
            break;
            }
        }

        else{
            if (fd>sd) {
                shouldSwap = true;
                break;
            }
        }
      }
      if (shouldSwap) {
        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
        swap = true;
      }
    }
    if(sort==0){
        document.getElementById("up-arrow").style.display="none";
        document.getElementById("down-arrow").style.display="block";
        sort=1;
    }

    else{
        document.getElementById("up-arrow").style.display="block";
        document.getElementById("down-arrow").style.display="none";
        sort=0;
    }
    
}

function checkFilter(){
    year="";
    purp="";
    filttable=document.getElementById("filterTable");
    row=filttable.rows;
    f=0;
    for(i=0;i<row.length;i++)
    {
        chktr=row[i].getElementsByClassName("filtersel")[0];
        //console.log(chktr);
        chk=chktr.childNodes[0];
        console.log(chk.checked);
        if(chk.checked==true){
            f=1;
            fname=row[i].getElementsByClassName("filtername")[0].innerHTML;
            filterval=row[i].getElementsByClassName("filterval")[0];
            ip=filterval.childNodes[0];
            console.log(fname);
            if(fname.localeCompare("Year")==0){
                if(ip.value.length==0)
                alert("Year not specified");

                else{
                    year=ip.value;
                alert("Year Filter Applied");
                }
            }
            else{
                console.log(ip);
                if(ip.value.localeCompare("noopt")==0)
                alert("Purpose not specified");

                else{
                purp=ip.value;
                alert("Purpose Filter Applied");
                }
            }
        }
    }
    applyFilter(year,purp);

}

function applyFilter(year,purp){
    tabrows=document.getElementById('histTable').rows;
    document.getElementById('no-result').style.display="none";
    if(year.length>0){
        var f=0;
        for(i=2;i<tabrows.length;i++){
            txnnoDOM=tabrows[i].getElementsByClassName('txndate');
            if(txnnoDOM.length!=0){
                console.log(txnnoDOM);
                if(txnnoDOM[0].innerHTML.startsWith(year)){
                    tabrows[i].style.display="";
                    f=1;
                }
                else{
                    tabrows[i].style.display="none";
                }
            }
        }

    }

    else{
        var f=0;
        for(i=2;i<tabrows.length;i++){
            txnnoDOM=tabrows[i].getElementsByTagName('td');
            if(txnnoDOM.length!=0){
                console.log(txnnoDOM);
                if(txnnoDOM[2].innerHTML.startsWith(purp)){
                    tabrows[i].style.display="";
                    f=1;
                }
                else{
                    tabrows[i].style.display="none";
                }
            }
        }

        
        
    }
}

function removeFilter(){
    tabrows=document.getElementById('histTable').rows;
    document.getElementById('no-result').style.display="none";
    for(i=2;i<tabrows.length;i++){
        tabrows[i].style.display="table-row";
    }
}
