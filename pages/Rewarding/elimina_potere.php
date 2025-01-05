<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_potere = $_GET["id_potere"];
	$id_classe=$_SESSION["id_classe"];
	$params=[
		['value' => $id_potere]
	]; 
	$query="select count(*) as tot from ct_studenti_poteri where fk_potere=? ";
	$row=eseguiQueryPrepareOne($query,$params);
	if($row["tot"]==0) {
		eseguiQuery("DELETE FROM ct_poteri WHERE id_potere= $id_potere");
		echo "Potere eliminato correttamente!";
	}
	else {
		echo "Il potere è collegato ad almeno un utente, non può essere eliminato!";
	}
}
?>