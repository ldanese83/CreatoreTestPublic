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
		if($row["tot"]>=$num_domande) {}
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
		if($row["tot"]>=$num_domande) {}
		else {
			$num_domande=$row["tot"];
		}
	
	}
	
	$nome_capitolo=htmlentities($nome_capitolo);
	$story=htmlentities($story);
	$testo_esercizio=htmlentities($testo_esercizio);
	
	$params=[$testo_esercizio,$xp_points,$story,$argomento,$tipo_esercizio,$nome_capitolo,$num_domande];
	$id_esercizio=eseguiInsertPrepare("insert into ct_esercizi(testo_esercizio,punti_esperienza,storia_esercizio,fk_argomento,tipo_esercizio,nome_capitolo,num_domande) values ",$params);
	
	$params=[
		['value' => $id_quest]
	]; 
	$query="select max(progressivo) as massimo from ct_esercizi_quest where fk_quest=?";
	$row=eseguiQueryPrepareOne($query,$params);
	$progressivo = $row["massimo"]+1;
	
	$params=[$id_quest,$id_esercizio,$progressivo];
	eseguiInsertPrepare("insert into ct_esercizi_quest(fk_quest,fk_esercizio,progressivo) values ",$params);
	
	$params=[$id_quest,$id_esercizio,$id_classe,0];
	eseguiInsertPrepare("insert into ct_classi_esercizi_attivi(fk_quest,fk_esercizio,fk_classe,attivo) values ",$params);
			
			
	header("location:modifica_quest.php?id_quest=$id_quest");
}
?>
