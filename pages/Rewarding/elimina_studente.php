<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
$id_studente = $_GET["id_studente"];

$params=[
	['value' => $id_studente]
]; 
$query="select fk_utente from ct_studenti where id_studente=?";
$row=eseguiQueryPrepareOne($query,$params);
$id_classe=$_SESSION["id_classe"];
eseguiQuery("DELETE FROM ct_studenti WHERE id_studente=$id_studente");
eseguiQuery("DELETE FROM ct_studenti_classi WHERE fk_utente = $row[fk_utente] AND fk_classe=$id_classe");
}
?>