<?php
session_start();
include("../share/funzioni2_1.php");

$id_argomento = $_GET["id_argomento"];
$id_utente = $_GET["id_utente"];


eseguiQuery("delete from ct_argomenti_kahoot where fk_utente=$id_utente and fk_argomento=$id_argomento");
?>
