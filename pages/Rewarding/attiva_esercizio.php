<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
$id_quest = $_GET["id_quest"];
$id_esercizio = $_GET["id_esercizio"];
$id_classe=$_SESSION["id_classe"];
$params=[$id_quest,$id_esercizio,$id_classe]; 

eseguiUpdatePrepare("UPDATE ct_classi_esercizi_attivi set attivo=1 where fk_quest=:c0 and fk_esercizio=:c1 and fk_classe=:c2",$params);

echo "Esercizio attivato!";
}
?>