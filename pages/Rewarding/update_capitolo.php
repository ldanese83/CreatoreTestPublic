<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION["id_utente"];
	$id_classe=$_SESSION["id_classe"];
	extract($_POST);
	
	if(!isset($num_domande))
		$num_domande=0;
	
	if($tipo_esercizio==2) {
		$params=[
			['value' => $argomento]
		]; 
		$query="select count(*) as tot from ct_domande where fk_argomento=? and fk_tipo_domanda=2";
		$row=eseguiQueryPrepareOne($query,$params);
		if($row["tot"]<=$num_domande) {}
		else {
			$num_domande=$row["tot"];
		}
	
	}
	if($tipo_esercizio==4) {
		$params=[
			['value' => $argomento]
		]; 
		$query="select count(*) as tot from ct_domande where fk_argomento=? and (fk_tipo_domanda=2 or fk_tipo_domanda=1)";
		$row=eseguiQueryPrepareOne($query,$params);
		if($row["tot"]<=$num_domande) {}
		else {
			$num_domande=$row["tot"];
		}
	
	}
	
	$nome_capitolo=htmlentities($nome_capitolo);
	$story=htmlentities($story);
	$testo_esercizio=htmlentities($testo_esercizio);
	
	$params=[$testo_esercizio,$xp_points,$story,$nome_capitolo,$num_domande,$id_esercizio];
	eseguiUpdatePrepare("update ct_esercizi set testo_esercizio=:c0,punti_esperienza=:c1,storia_esercizio=:c2,nome_capitolo=:c3,num_domande=:c4 where id_esercizio=:c5 ",$params);
	
	$params=[
		$progressivo,$id_quest,$id_esercizio
	]; 
	$query="update ct_esercizi_quest set progressivo=:c0 where fk_quest=:c1 and fk_esercizio=:c2";
	eseguiUpdatePrepare($query,$params);	
			
	header("location:modifica_quest.php?id_quest=$id_quest");
}
?>
