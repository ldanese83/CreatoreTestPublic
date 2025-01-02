<?php
session_start();
include("../share/funzioni2_1.php");

$id_argomento = $_GET["id_argomento"];
$id_utente = $_GET["id_utente"];


eseguiQuery("insert into ct_argomenti_kahoot(fk_utente,fk_argomento) values($id_utente,$id_argomento)");
?>
