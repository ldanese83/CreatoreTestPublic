<?php
session_start();
include("../share/funzioni2_1.php");

$id_domanda = $_GET["id_domanda"];
$id_utente = $_SESSION["id_utente"];

eseguiQuery("INSERT INTO ct_utente_domande(fk_utente,fk_domanda) VALUES($id_utente,$id_domanda)");

?>
Domanda importata correttamente!