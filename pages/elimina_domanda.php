<?php
session_start();
if (!isset($_SESSION['Username']))
{
  echo "Non hai l'autorizzazione per entrare in questa pagina. Sessione scaduta.";
}
else{
	$user = $_SESSION['Username'];
	$id_utente = $_SESSION['id_utente'];
	$id_domanda = $_GET["id_domanda"];
	include("../share/funzioni2_1.php");

	eseguiQuery("DELETE FROM ct_utente_domande WHERE fk_domanda = $id_domanda and fk_utente = $id_utente");
}

?>