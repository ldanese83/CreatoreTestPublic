<?php 
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	
	if(!isset($_GET["id_classe"])) {
		echo "<div class='alert alert-danger'>Errore: nessuna classe selezionata! <strong><a href='./homepage_studente.php'>INDIETRO</a></strong></div>";
	}
	else {
		$id_classe=$_GET["id_classe"];
		$_SESSION["id_classe"]=$id_classe;
		header("location: classe_studente.php");
	}
}
?>

	