<?php


//CONNECT DATABASE AND ASK REQUESTS
class dataBaseProperties
{
    private $str_Host = "localhost";
    private $str_Root = "root";
    private $str_NameDB = "systemeintranet_v2";
    private $str_Pswd = "";
    public $conn;

    public function connection()
    {
        try {
            $this->conn = new PDO("mysql:host=$this->str_Host;dbname=" . $this->str_NameDB, $this->str_Root, $this->str_Pswd);
            //On définit le mode d'erreur de PDO sur Exception
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return true;
        } catch (PDOException $e) {
            echo "Erreur : " . $e->getMessage();
            return false;
        }
    }

    public function askQuery_DB($req)
    {
        try {
            if (!$res = $this->conn->query($req)) echo "<script> console.log('requete vide')</script>";
            else $res->execute();
            return $res->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error :" . $e->getMessage();
        }
        return false;
    }


    public function askPrepare_DB($req, $array)
    {
        try {

            if (!$res = $this->conn->prepare($req)) echo "<script> console.log('requete vide')</script>";
            else {
                $res->execute($array);
                return $res->fetchAll(PDO::FETCH_ASSOC);
            }
        } catch (PDOException $e) {
            echo "Erreur :" . $e->getMessage();
        }
        return false;
    }


    public function askPrepareMultiple_DB($req, $multipleValues)
    {
        try {
            for ($i = 0; $i < count($multipleValues); $i++) {

                if (!$res = $this->conn->prepare($req)) echo "<script> console.log('requete vide')</script>";
                else {
                    $res->execute(array($multipleValues[$i]));
                    $array[$i] = $res->fetch(PDO::FETCH_ASSOC);
                }
            }
            return $array;
        } catch
        (PDOException $e) {
            echo "Erreur :" . $e->getMessage();
        }
        return false;
    }


    public function sendPrepare_DB($req, $array)
    {
        try {

            if (!$res = $this->conn->prepare($req)) echo "<script> console.log('requete vide')</script>";
            else {
                $res->execute($array);
                return true;
            }
        } catch (PDOException $e) {
            echo "Erreur :" . $e->getMessage();
        }
        return false;
    }


}




?>




