<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];
$id_utente = $_GET["id_utente"];

$dataset2 = eseguiQuery("select count(*) as tot from ct_utenti_materie where fk_utente=$id_utente and fk_materia=$id_materia");
$row2=($dataset2->fetch_assoc());

if($row2["tot"]==1) {}
else
	eseguiQuery("INSERT INTO ct_utenti_materie(fk_utente,fk_materia) VALUES($id_utente,$id_materia)");


?>