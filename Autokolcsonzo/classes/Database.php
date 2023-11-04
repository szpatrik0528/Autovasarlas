<?php

class Database {

    private $db = null;
    public $error = false;

    public function __construct($localhost, $username, $password, $db) {
        try {
            $this->db = new mysqli($localhost, $username, $password, $db);
            $this->db->set_charset("utf8");
        } catch (Exception $exc) {
            $this->error = true;
            echo '<p> Az adatbázis nem elérhető!</p>';
            exit();
        }
    }

    public function register($fullname, $username, $password) {
        $stmt = $this->db->prepare("INSERT INTO `users` (`userid` , `fullname` ,`username`, `password`) VALUES (NULL, ? , ? , ?);");
        $stmt->bind_param("sss", $fullname, $username, $password);
        try {
            if ($stmt->execute()) {
                $_SESSION['login'] = true;
            } else {
                $_SESSION['login'] = false;
                echo '<p>Rögzítés sikertelen!</p>';
            }
        } catch (Exception $exc) {
            $this->error = true;
        }
    }

    public function login($username, $password) {
        $stmt = $this->db->prepare('SELECT `userid`, `username`, `password` FROM `users` WHERE username = ? and  password = ?');
        $stmt->bind_param("ss", $username, $password);
        if ($stmt->execute()) {
            $stmt->store_result();
            if ($stmt->num_rows > 0) {
                $_SESSION['login'] = true;
                header("Location: index.php");
            }
        }
        $stmt->close();
    }

    public function autoFeltoltese($gyarto_es_modell, $evjarat, $szin, $uzemanyag, $valto_tipus, $utasok_szama, $ar) {
        $stmt = $this->db->prepare("INSERT INTO `car` (`cars_id` ,`gyarto_es_modell`, `evjarat`, `szin`, `uzemanyag`, `valto_tipus`, `utasok_szama`, `ar`) VALUE (NULL, ?,?,?,?,?,?,?);");
        $stmt->bind_param("sssssss", $gyarto_es_modell, $evjarat, $szin, $uzemanyag, $valto_tipus, $utasok_szama, $ar);
        try {
            if ($stmt->execute()) {
                $_SESSION['login'] = true;
            } else {
                $_SESSION['login'] = false;
                echo '<p>Rögzítés sikertelen!</p>';
            }
        } catch (Exception $exc) {
            $this->error = true;
        }
    }

    public function osszesAuto() {
        $result = $this->db->query("SELECT * FROM `car`");
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getKivalasztottAuto($id) {
        $result = $this->db->query("SELECT * FROM `car` WHERE cars_id=" . $id);
        return $result->fetch_assoc();
    }

    public function setKivalasztottAuto($cars_id, $gyarto_es_modell, $evjarat, $szin, $uzemanyag, $valto_tipus, $utasok_szama, $ar, $elerhetoseg) {
        $stmt = $this->db->prepare("UPDATE `car` SET `gyarto_es_modell`= ?,`evjarat`= ?,`szin`= ?,`uzemanyag`= ?,`valto_tipus`= ?,`utasok_szama`= ?,`ar/nap`= ?, `elerhetoseg`= ? WHERE cars_id= ?");
        $stmt->bind_param('isssssss', $cars_id, $gyarto_es_modell, $evjarat, $szin, $uzemanyag, $valto_tipus, $utasok_szama, $ar, $elerhetoseg);
        return $stmt->execute();
    }

    public function getAuto() {
        $result = $this->db->query("SELECT DISTINCT `car` FROM `gyarto_es_modell`;");
        return $result->fetch_all();
    }

    public function getUzemanyag() {
        $result = $this->db->query("SELECT DISTINCT `uzemanyag` FROM `car`;");
        return $result->fetch_all();
    }

    public function getValto() {
        $result = $this->db->query("SELECT DISTINCT `valto_tipus` FROM `car`;");
        return $result->fetch_all();
    }

    public function getUtasok() {
        $result = $this->db->query("SELECT DISTINCT `utasok_szama` FROM `car`;");
        return $result->fetch_all();
    }
}
