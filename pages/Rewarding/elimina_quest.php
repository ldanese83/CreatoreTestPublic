<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
$id_quest = $_GET["id_quest"];

$params=[
	['value' => $id_quest]
]; 
$id_classe=$_SESSION["id_classe"];
eseguiQuery("DELETE FROM ct_classi_quest WHERE fk_quest = $id_quest AND fk_classe=$id_classe");
}
?>