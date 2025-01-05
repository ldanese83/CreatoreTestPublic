<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {

	extract($_POST);

	// Inserimento
	$query = "INSERT INTO ct_studenti_poteri (fk_potere,fk_studente,usato) VALUES ";
	$params = [$id_potere,$id_studente,0];
	eseguiInsertPrepare($query, $params);
	echo "Potere scelto con successo!";
	
	$params=[$id_studente]; 
	$query="update ct_studenti set pot_da_scegliere=pot_da_scegliere-1 where id_studente=:c0";
	eseguiUpdatePrepare($query,$params);
	
		
}
	

?>
