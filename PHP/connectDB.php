<?php


//CONNECT DATABASE AND ASK REQUESTS
function connectDB(){
    $str_Host="localhost";
    $str_Root="root";
    $str_Pswd="";

    try{
        $conn = new PDO("mysql:host=$str_Host;dbname=systemeintranet_v2", $str_Root, $str_Pswd);
        //On définit le mode d'erreur de PDO sur Exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
    catch(PDOException $e) {
        echo "Erreur : " . $e->getMessage();
    }
    return false;
}


function askPrepare_DB($conn, $req, $str_Value, $value){
    try{

        if (!$res= $conn->prepare($req)) echo"<script> console.log('requete vide')</script>";
        else{
            $res->bindValue($str_Value,$value);
            $res->execute();
            return $res->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    catch(PDOException $e){
        echo "Erreur :".$e->getMessage();
    }
    return false;
}

function sendData_DB($conn, $req, $str_Value, $value){
    try{
        if (!$res= $conn->prepare($req)) echo"<script> console.log('requete vide')</script>";
        else{
            $res->bindValue($str_Value,$value);
            $res->execute();
            return true;
        }
    }
    catch(PDOException $e){
        echo "Erreur :".$e->getMessage();
    }
    return false;
}









?>




