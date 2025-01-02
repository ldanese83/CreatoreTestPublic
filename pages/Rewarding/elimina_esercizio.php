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

eseguiQuery("DELETE FROM ct_esercizi_quest WHERE fk_quest = $id_quest AND fk_esercizio=$id_esercizio");
eseguiQuery("DELETE FROM ct_classi_esercizi_attivi WHERE fk_quest = $id_quest AND fk_esercizio=$id_esercizio AND fk_classe=$id_classe");

echo "Esercizio eliminato dalla quest!";
}
?>