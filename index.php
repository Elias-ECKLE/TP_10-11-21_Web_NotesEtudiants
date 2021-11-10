
<?php

require "PHP/connectDB.php";
$conn=connectDB();
if(!empty($_POST["input_valider"])) {
    echo "<script> console.log('submited')</script>";

    if(!empty($_POST['input_check'])){
        $arrayIdNotes=$_POST['input_check'];

        if(!empty($_POST['inputNote'])){
            $arrayNewNotes=$_POST['inputNote'];

            for($i=0; $i<count($arrayIdNotes);$i++){

                $intVarNote=intval($arrayNewNotes[$i]);
                $intVarId=intval($arrayIdNotes[$i]);

                $req='UPDATE notes
                              SET notes.valueNote='.$intVarNote.'
                              WHERE notes.idNote= '.$intVarId.'';
                sendData_DB($conn,$req,'','');
            }

        }
    }

}
$req='SELECT n.idNote as idNote,c.labelCourse as matiere , n.subjectNote as sujet ,u.lastName as nom , u.firstName as prenom , n.valueNote as note FROM course c, user u, notes n WHERE n.idUser=u.idUser AND c.idCourse=n.idCourse';
$arrayNotes=askPrepare_DB($conn,$req,'','');

$req='SELECT DISTINCT c.labelCourse as matiere,u.lastName as nom , u.firstName as prenom , AVG(n.valueNote) as moyenneNote
FROM course c, user u, notes n
WHERE n.idUser=u.idUser
AND c.idCourse=n.idCourse
group by u.lastName, c.labelCourse';
$arrayMoyenne=askPrepare_DB($conn,$req,'','');


?>


<!DOCTYPE html>
<html lang="fr">
<head>
    <title>TP Notes </title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/headerFooter.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/headerFooter.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>



<body">

<?php
include"headerFooter/header.php";
?>

<section>

    <?php
        if($arrayNotes) {
            echo "<form method='POST' action='#'>";
             echo "<table>";
              echo "<thead>";
                    echo"<td>Matière</td>
                          <td>Sujet</td>
                          <td>Nom</td>
                          <td>Prénom</td>
                          <td>Note</td>
                          <td>Editer</td>";
                echo"</thead >";
               echo"<tbody>";
                    for($i=0;$i<count($arrayNotes);$i++){
                        echo "<tr>";
                            echo "<td>".$arrayNotes[$i]["matiere"]."</td>";
                            echo "<td>".$arrayNotes[$i]["sujet"]."</td>";
                            echo "<td>".$arrayNotes[$i]["nom"]."</td>";
                            echo "<td>".$arrayNotes[$i]["prenom"]."</td>";
                            echo "<td>".$arrayNotes[$i]["note"]." </br> <input name='inputNote[]' id='input_check".$i." Note' type='number' min='0' max='20' disabled></td>";
                            echo "<td><input type='checkbox' id='input_check".$i." ' value=".$arrayNotes[$i]['idNote']." name='input_check[]' onchange='editNote(this.id)'></td>";
                        echo"</tr>";
                    }
                echo"</tbody>";
            echo"</table>";
            echo" <div id='divFlex_InputSubmit'><input id = input_valider name = 'input_valider' type = 'submit'/> </div>";
       echo" </form >";
        }
        else{
            echo "<h1><center>Erreur connexion Base De Données </center></h1>";
        }

        if($arrayMoyenne){
            echo "<table>";
                echo"<thead>";
                     echo"<td>Matière</td>
                           <td>Nom</td>
                            <td>Prénom</td>
                            <td>Moyenne</td>";
                 echo"</thead>";
                 echo"<tbody>";
                        for($i=0;$i<count($arrayMoyenne);$i++) {
                            echo"<tr>";
                            echo "<td>" . $arrayMoyenne[$i]["matiere"] . "</td>";
                            echo "<td>" . $arrayMoyenne[$i]["nom"] . "</td>";
                            echo "<td>" . $arrayMoyenne[$i]["prenom"] . "</td>";
                            echo "<td>" . $arrayMoyenne[$i]["moyenneNote"] . "</td>";
                            echo "</tr>";
                        }
                 echo"</tbody>";
            echo "</table>";

        }



    ?>




</section>


<?php
include("headerFooter/footer.php");

?>

</body>
</html>