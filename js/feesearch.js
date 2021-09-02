var sort=0;
function searchTable(obj){
    var query=obj.value;
    tabrows=document.getElementsByTagName('tr');
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
      rows = document.getElementsByTagName("tr");
     
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