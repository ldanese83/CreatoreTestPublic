<?php
session_start();
include("../share/funzioni2_1.php");

$id_domanda = $_GET["id_domanda"];
$id_utente = $_GET["id_utente"];


eseguiQuery("insert into ct_temporary_dom(fk_utente,fk_domanda) values($id_utente,$id_domanda)");
?>
