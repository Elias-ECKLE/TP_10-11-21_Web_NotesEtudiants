
<!-------------------------------------------------------GESTION DU PHP------------------------------------------------------------------->

<?php

require "PHP/connectDB.php";


//connexion BDD
$dataBase=new dataBaseProperties();
$dataBase->connection();

//maj data en fct des modifications effectuées par l'utilisateur -> une fois le formulaire validé
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

                $arraySend=array(
                        ':valueNote'=>$intVarNote,
                        ':idNote'=>$intVarId
                );
                $dataBase->sendPrepare_DB($req,$arraySend);
            }

        }
    }

}

//on cherche la data
$req='SELECT n.idNote as idNote,c.labelCourse as matiere , n.subjectNote as sujet ,u.lastName as nom , u.firstName as prenom , n.valueNote as note FROM course c, user u, notes n WHERE n.idUser=u.idUser AND c.idCourse=n.idCourse';
//on interroge la base
$arrayNotes=$dataBase->askQuery_DB($req);

$req='SELECT DISTINCT c.labelCourse as matiere,u.lastName as nom , u.firstName as prenom , AVG(n.valueNote) as moyenneNote
FROM course c, user u, notes n
WHERE n.idUser=u.idUser
AND c.idCourse=n.idCourse
group by u.lastName, c.labelCourse';
//on interroge la base et on récupère les valeurs sous forme de tab associatif
$arrayMoyenne=$dataBase->askQuery_DB($req);


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
    <script type="text/javascript" src="js/Classes_index.js"></script>
</head>

<!-------------------------------------------------------GESTION DU JS----------------------------------------------------------->
<script>

    //tableMoyennes.addTableToDOM('body');

</script>


<!-------------------------------------------------------GESTION DU CONTENU------------------------------------------------------->
<body id="body">

<?php
include"headerFooter/header.php";
require "PHP/Classes_Index.php";
?>

<section>

    <?php // Affichage tableau de notes
        if($arrayNotes) { // si les données récupérées dans la bdd ok
                        // alors on affiche le tout sous la forme d'un tab
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
            //affichage tableau des moyennes s'il existe


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

   <article id='articleTabMoy_DOM'>

            <script>
                tableMoyennes= new JsTable();
                tableMoyennes.createTable();
                tableMoyennes.addTableToDOM('articleTabMoy_DOM');
            </script>;
            <?php
            addRowToTable(0);
            addDataHeadToTable("heading0","row0","Matière");
            addDataHeadToTable("heading1","row0","Nom");
            addDataHeadToTable("heading2","row0","Prénom");
            addDataHeadToTable("heading3","row0","Moyenne");
            $j=0;

            for($i=1;$i<count($arrayMoyenne);$i++){
                addRowToTable($i+1);
                addDataToTable($i,$j,$arrayMoyenne[$i]["matiere"]);
                $j++;
                addDataToTable($i,$j, $arrayMoyenne[$i]["nom"]);
                $j++;
                addDataToTable($i,$j,$arrayMoyenne[$i]["prenom"]);
                $j++;
                addDataToTable($i,$j,$arrayMoyenne[$i]["moyenneNote"]);

            }



              ?>




    </article>




</section>


<?php
include("headerFooter/footer.php");

?>

</body>
</html>