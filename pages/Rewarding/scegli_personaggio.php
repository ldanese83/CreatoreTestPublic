<?php 
session_start();
include("header_classe_studente.php");

include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION['id_utente'];
	$id_personaggio=$_GET["id_personaggio"];
	$params=[
		['value' => $id_utente]
	]; 
	$query="select count(*) as tot from ct_utenti where id_utente=? and (fk_tipo_utente=2 or fk_tipo_utente=3)";
	$row=eseguiQueryPrepareOne($query,$params);
	
	if($row["tot"]==0) {
		echo "<div class='alert alert-danger'>Non hai i permessi per accedere alla pagina: non sei uno studente</div>";
	}
	else {
		if(!isset($_SESSION["id_classe"])) {
			echo "<div class='alert alert-danger'>Errore: nessuna classe selezionata! <strong><a href='./homepage_studente.php'>INDIETRO</a></strong></div>";
		}
		else {
			$id_classe=$_SESSION["id_classe"];
			$params=[
				['value' => $id_utente],
				['value' => $id_classe]
			]; 
			$query_stud="select * from ct_studenti inner join ct_studenti_classi on id_studente=fk_studente where fk_utente=? and fk_classe=?";
			$row_stud=eseguiQueryPrepareOne($query_stud,$params);
			
			$params=[$id_personaggio,$row_stud["id_studente"]];
			eseguiUpdatePrepare("UPDATE ct_studenti SET fk_personaggio=:c0,vite=(select vita_iniziale from ct_personaggi where id_personaggio=:c0) WHERE id_studente=:c1",$params);
			
			header("location:classe_studente.php");
			
		}
	}
} ?>