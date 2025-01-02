<?php
session_start();
include("../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION["id_utente"];
	$id_classe = $_GET["id_classe"];
	$nome_classe = htmlspecialchars($_GET["nome_classe"]);
	$anno_scolastico = $_GET["anno_scolastico"];
	$icona_classe=$_GET["icona_classe"];
	$colore_classe=$_GET["colore_classe"];
	$colore_classe="#".$colore_classe;

	if($id_classe==0) {
		
		$params=[$nome_classe,$anno_scolastico,$icona_classe,$colore_classe];
		$id_cl=eseguiInsertPrepare("insert into ct_classi(nome_classe,fk_anno_scolastico,icona,colore) values ",$params);
		$params=[$id_cl,$id_utente];
		eseguiInsertPrepare("insert into ct_utenti_classi(fk_classe,fk_utente) values ",$params);
		echo "Classe inserita correttamente";
	}
	else {
		$params=[$nome_classe,$anno_scolastico,$id_classe,$icona_classe,$colore_classe];
		//echo "color:".$colore_classe;
		eseguiUpdatePrepare("UPDATE ct_classi SET nome_classe=:c0,fk_anno_scolastico=:c1,colore=:c4,icona=:c3 WHERE id_classe=:c2",$params);
		echo "Classe modificata correttamente";
		

	}
}
?>
