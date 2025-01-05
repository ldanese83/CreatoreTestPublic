<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION["id_utente"];
	$id_classe=$_SESSION["id_classe"];
	extract($_GET);
	
	$params=[$id_studente]; 
	$query="update ct_studenti set vite=vite-1 where id_studente=:c0";
	eseguiUpdatePrepare($query,$params);
	
	$params = [["value"=>$id_studente]];
	$row_stud=eseguiQueryPrepareOne("select * from ct_studenti where id_studente=?",$params);

	if($row_stud["vite"]>0) {
		$alert="Perdi una vita per la seguente motivazione: $motivazione";
		
		$link="classe_studente.php";
		$data_odierna = date('Y-m-d H:i:s');
		$params=[$id_classe,$alert,$id_studente,$data_odierna,"PersoCuori",$link,0,1];
		eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
	}
	else {
		
		$alert="Perdi una vita per la seguente motivazione: $motivazione";
		
		$link="classe_studente.php";
		$data_odierna = date('Y-m-d H:i:s');
		$params=[$id_classe,$alert,$id_studente,$data_odierna,"PersoCuori",$link,0,1];
		eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
		
		$alert="Non hai più vite. Sei morto! Resusciti con tutti i cuori, ma devi completare il seguente compito aggiuntivo:";
		
		$link="classe_studente.php";
		$data_odierna = date('Y-m-d H:i:s');
		$params=[$id_classe,$alert,$id_studente,$data_odierna,"Morte",$link,0,1];
		eseguiInsertPrepare("insert into ct_alerts(fk_classe,testo,fk_studente,data_alert,tipologia,link,letto,doc_stud) values ",$params);
		
		$params=[$id_studente]; 
		$query="update ct_studenti as cs set vite=(select vita_iniziale from ct_personaggi where id_personaggio=cs.fk_personaggio) where id_studente=:c0";
		eseguiUpdatePrepare($query,$params);
		
	}
	
}
?>
