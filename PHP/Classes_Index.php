<?php

function addRowToTable($i){
    echo "<script>
      let row".$i."=document.createElement('tr');
    </script>";

}


function addDataHeadToTable($str_heading,$str_row,$data){

        echo "<script>
                  let ".$str_heading." = document.createElement('th');
                  ".$str_heading.".innerHTML='".$data."';
        
                  ".$str_row.".appendChild(".$str_heading.");
                  tableMoyennes.thead.appendChild(".$str_row.");
                  
                  console.log('dataHead_Added');
              </script>";
    }


function addDataToTable($i, $j,$data){

        $str_Cellule='cellule'.$i."_".$j;
        $str_row='row'.$i;
        echo "<script>
                 
                  let ".$str_Cellule." = document.createElement('td');
                  ".$str_Cellule.".innerHTML='".$data."';
        
                 ".$str_row.".appendChild(".$str_Cellule.");
                  
                 tableMoyennes.tbody.appendChild(".$str_row.");
                 
                 console.log('dataBody_Added');
              </script>";
    }




