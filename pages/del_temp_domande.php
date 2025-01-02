<?php
session_start();
include("../share/funzioni2_1.php");

$id_domanda = $_GET["id_domanda"];
$id_utente = $_GET["id_utente"];


eseguiQuery("delete from ct_temporary_dom where fk_utente=$id_utente and fk_domanda=$id_domanda");
?>
