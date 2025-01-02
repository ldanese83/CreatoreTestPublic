<?php
session_start();
include("../../share/funzioni2_1.php");

function check_badges() {
	
}

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION["id_utente"];
	$id_classe=$_SESSION["id_classe"];
	extract($_POST);
	
	$params=[
		['value' => $id_esercizio]
	]; 
	$query="select * from ct_esercizi where id_esercizio=?";
	$row=eseguiQueryPrepareOne($query,$params);
	$xp=$row["punti_esperienza"];
	
	$params2=[
		['value' => $id_quest]
	]; 
	$query2="select * from ct_quest where id_quest=?";
	$row2=eseguiQueryPrepareOne($query2,$params2);
	
	if($row["tipo_esercizio"]==1 || $row["tipo_esercizio"]==3) {
		
		$commento=htmlentities($commento);
		
		$params=[$commento,$id_consegna]; 
		$query="update ct_esercizio_risposte set commento_prof=:c0 where fk_consegna=:c1";
		eseguiUpdatePrepare($query,$params);
		
	}	
	
	if($row["tipo_esercizio"]==4) {
		
		$params = [["value"=>$id_studente],["value"=>$id_esercizio]];
		$rowcount=eseguiQueryPrepareOne("select count(*) as tot from ct_esercizio_domande inner join ct_domande on id_domanda=fk_domanda where ct_esercizio_domande.fk_studente=? and ct_esercizio_domande.fk_esercizio=? and fk_tipo_domanda=1",$params);
		$tot_aperte=$rowcount["tot"];
		
		for($i=0;$i<$tot_aperte;$i++) {
			
			$variabile="commento$i";
			$vardom="domanda$i";
			
			$$variabile=htmlentities($$variabile);
		
			$params=[$$variabile,$id_consegna,$$vardom]; 
			$query="update ct_esercizio_risposte set commento_prof=:c0 where fk_consegna=:c1 and fk_domanda=:c2";
			eseguiUpdatePrepare($query,$params);
			
		}
		
	}
	
	$params=[$valutazione,$id_consegna]; 
	$query="update ct_consegne_studenti set valutazione=:c0,valutato=1 where id_consegna=:c1";
	eseguiUpdatePrepare($query,$params);
	
	$params=[$xp,$id_studente]; 
	$query="update ct_studenti set xp=xp+:c0 where id_studente=:c1";
	eseguiUpdatePrepare($query,$params);

	$data_odierna = date('Y-m-d H:i:s');
	$link="vedi_esercizio_studente.php?id_esercizio=$id_esercizio&id_quest=$id_quest";

	$alert="Guadagni $xp punti esperienza per aver completato il capitolo $row[nome_capitolo] della quest $row2[nome_quest]!";
	$params=[$id_classe,$alert,$id_studente,$data_odierna,"ValutazioneEsercizio",$link,0,1];
	eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
	
	$params3=[
		['value' => $id_studente]
	]; 
	$query3="select * from ct_studenti where id_studente=?";
	$row3=eseguiQueryPrepareOne($query3,$params3);
	//controllo se passa di livello	
	$xp_livello=0;
	$livello=0;
	while($xp_livello<$row3["xp"]) {
		$xp_livello+=pow(1.2,($livello+1))*150;
		$livello++;
	}
	if($livello>$row3["livello"]) {
		$params=[$id_studente]; 
		$query="update ct_studenti set livello=livello+1 where id_studente=:c0";
		eseguiUpdatePrepare($query,$params);
		
		$link="classe_studente.php";

		$alert="Il tuo personaggio è salito al livello $livello!";
		$params=[$id_classe,$alert,$id_studente,$data_odierna,"SaliLivello",$link,0,1];
		eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
		
	}
	
	//controllo se acquisisce un nuovo potere
	
	check_badges();
			
	header("location:vedi_consegne.php?id_quest=$id_quest&id_esercizio=$id_esercizio");
}
?>
