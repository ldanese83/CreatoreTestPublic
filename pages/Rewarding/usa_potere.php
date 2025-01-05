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
	
	$params=[$id_studente,$id_potere]; 
	$query="update ct_studenti_poteri set usato=usato+1 where fk_studente=:c0 and fk_potere=:c1";
	eseguiUpdatePrepare($query,$params);
	
	$params=[$id_studente,$id_potere]; 
	$query="update ct_studenti set mana=mana-(select mana_necessario from ct_poteri where id_potere=:c1) where id_studente=:c0";
	eseguiUpdatePrepare($query,$params);
	
	echo "Potere utilizzato con successo!";
	$params=[
		['value' => $id_studente]
	]; 
	$query_stud="select * from ct_studenti inner join ct_utenti on id_utente=fk_utente where id_studente=?";
	$row_stud=eseguiQueryPrepareOne($query_stud,$params);
	$nome=$row_stud["nome"];
	$cognome=$row_stud["cognome"];
	
	$params=[
		['value' => $id_potere]
	]; 
	$query_pow="select * from ct_poteri where id_potere=?";
	$row_pow=eseguiQueryPrepareOne($query_pow,$params);
	$nome_potere=$row_pow["nome_potere"];
	$descrizione = $row_pow["descrizione_potere"];
	
	$alert="Lo studente $nome $cognome utilizza il potere: $nome_potere";
	$data_odierna = date('Y-m-d H:i:s');
	$link="all_powers.php";
	$params=[$id_classe,$alert,$id_studente,$data_odierna,"UsatoPotere",$link,0,0];
	eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
}
	

?>
