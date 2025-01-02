<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];
$id_utente = $_GET["id_utente"];

eseguiQuery("DELETE FROM ct_utenti_materie WHERE fk_utente=$id_utente AND fk_materia=$id_materia");

header("location:./index.php");


?>