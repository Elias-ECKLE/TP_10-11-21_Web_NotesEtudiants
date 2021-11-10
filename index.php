
<?php
session_start();
require "php/connectDB.php";

$conn=connectDB();



if(!empty($_POST["input_login"])) {

    $req = 'SELECT distinct email as email, psswd FROM USER';
    $arrayCompte = askPrepare_DB($conn, $req, '', '');
    $isPsswdCorrect=false;
    $isLoginCorrect=false;

    $loginEntree = $_POST["input_login"];
    $psswdEntree = $_POST["input_MDP"];

    //on parcourt le tableau , on vérifie si le mail et psswd entrés existent
    for ($i = 0; $i < count($arrayCompte); $i++) {
        if ($arrayCompte[$i]['email'] == $loginEntree) {
            $isLoginCorrect = true;
            echo "<script> console.log('mail valide') </script>";

            if ($arrayCompte[$i]['psswd'] == $psswdEntree) {
                $isPsswdCorrect = true;
                echo "<script> console.log('psswd valide') </script>";
                break;
            }
        }
    }
// REDIRECTION VERS LA PAGE 2 -> si authentification réussie : login et psswd ------------------------------------------------------------------------------------------------
    if ($isLoginCorrect && $isPsswdCorrect) {
        // $_SESSION['mailUtilisateur']=$loginEntree;
        header("Location:page2.php");
    }
}
?>


<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Login Notes</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/headerFooter.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/headerFooter.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>



<body">

<?php
include"headerFooter/header.php";
?>

<section id="section_Digit" name="section_Digit">

    <form method='POST' action='#'>


        <input id=input_digitValider name='input_digitValider' type='submit'/>
    </form>




</section>


<?php
include("headerFooter/footer.php");

?>

</body>
</html>