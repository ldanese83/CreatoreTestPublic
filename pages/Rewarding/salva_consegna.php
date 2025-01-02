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
	
	$params=[
		['value' => $id_utente],
		['value' => $id_classe]
	]; 
	$query_stud="select * from (ct_studenti inner join ct_studenti_classi on id_studente=fk_studente) inner join ct_utenti on fk_utente=id_utente where fk_utente=? and fk_classe=?";
	$row_stud=eseguiQueryPrepareOne($query_stud,$params);
	$id_studente=$row_stud["id_studente"];
	
	if($tipo_ese=="Domanda aperta") {
	
		$testo_risposta=htmlentities($testo_risposta);
		
		$params=[
			['value' => $id_esercizio],
			['value' => $id_studente]
			
		]; 
		
		$query_cons="select * from ct_consegne_studenti where fk_esercizio=? and fk_studente=?";
		$row_cons=eseguiQueryPrepareOne($query_cons,$params);
		
		if(!$row_cons) {
			$params=[$id_studente,$id_esercizio,"0","0"];
			$id_consegna=eseguiInsertPrepare("insert into ct_consegne_studenti(fk_studente,fk_esercizio,valutazione,valutato) values ",$params);
			
			$data_risposta=date("Y-m-d");
			$params=[$id_studente,$id_esercizio,$id_consegna,$testo_risposta,$data_risposta];
			$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta) values ",$params);
		}
		else {
			$id_consegna=$row_cons["id_consegna"];
			$data_risposta=date("Y-m-d");
			$params=[$id_studente,$id_esercizio,$id_consegna,$testo_risposta,$data_risposta];
			eseguiUpdatePrepare("update ct_esercizio_risposte set testo_risposta=:c3, data_risposta=:c4 where fk_studente=:c0 and fk_esercizio=:c1 and fk_consegna=:c2",$params);
			
		}
		
	
	}
	else if($tipo_ese=="Quiz con risposte multiple e domande aperte") {
		
		$params=[
			['value' => $id_esercizio],
			['value' => $id_studente]
			
		]; 
		
		$query_cons="select * from ct_consegne_studenti where fk_esercizio=? and fk_studente=?";
		$row_cons=eseguiQueryPrepareOne($query_cons,$params);
	
		if(!$row_cons) {
			
			$params=[
				['value' => $id_esercizio],
				['value' => $id_studente]
				
			]; 
			
			$query_domande="select * from ct_esercizio_domande inner join ct_domande on fk_domanda=id_domanda where fk_esercizio=? and fk_studente=?";
			$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
			
			$params=[$id_studente,$id_esercizio,"0","0"];
			$id_consegna=eseguiInsertPrepare("insert into ct_consegne_studenti(fk_studente,fk_esercizio,valutazione,valutato) values ",$params);
			
			foreach($dataset_domande as $row_domande) {
				if($row_domande["fk_tipo_domanda"]==2) {
					//ottengo la risposta
					$srisp="rispdom_".$row_domande["fk_domanda"];
					
					//echo $srisp;
					
					$id_risp = $$srisp;
					
					if($id_risp=="") $id_risp=0;
					
					$data_risposta=date("Y-m-d");
					$params=[$id_studente,$id_esercizio,$id_consegna,"",$data_risposta,$row_domande["fk_domanda"],$id_risp];
					$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta,fk_domanda,fk_risposta) values ",$params);
				}
				else {
					
					$data_risposta=date("Y-m-d");
					$testo_rispostas="testo_risposta".$row_domande["id_domanda"];
					echo $testo_rispostas."<br>";
					$params=[$id_studente,$id_esercizio,$id_consegna,htmlentities($$testo_rispostas),$data_risposta,$row_domande["id_domanda"]];
					$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta,fk_domanda) values ",$params);
				}
			}
		}
		else {
			$id_consegna=$row_cons["id_consegna"];
			$data_risposta=date("Y-m-d");
			
			$params=[
				['value' => $id_esercizio],
				['value' => $id_studente]
				
			]; 
			
			$query_domande="select * from ct_esercizio_domande inner join ct_domande on id_domanda=fk_domanda where fk_esercizio=? and fk_studente=?";
			$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
			
			eseguiQuery("delete from ct_esercizio_risposte where fk_consegna=$id_consegna");
			
			foreach($dataset_domande as $row_domande) {
			
				if($row_domande["fk_tipo_domanda"]==2) {
					//ottengo la risposta
					$srisp="rispdom_".$row_domande["fk_domanda"];
					
					//echo $srisp;
					
					$id_risp = $$srisp;
					
					if($id_risp=="") $id_risp=0;
					
					$data_risposta=date("Y-m-d");
					$params=[$id_studente,$id_esercizio,$id_consegna,"",$data_risposta,$row_domande["fk_domanda"],$id_risp];
					$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta,fk_domanda,fk_risposta) values ",$params);
				}
				else {
					$data_risposta=date("Y-m-d");
					$testo_rispostas="testo_risposta".$row_domande["id_domanda"];
					$id_consegna=$row_cons["id_consegna"];
					$data_risposta=date("Y-m-d");
					$params=[$id_studente,$id_esercizio,$id_consegna,htmlentities($$testo_rispostas),$data_risposta,$row_domande["id_domanda"]];
					eseguiUpdatePrepare("update ct_esercizio_risposte set testo_risposta=:c3, data_risposta=:c4 where fk_studente=:c0 and fk_esercizio=:c1 and fk_consegna=:c2 and fk_domanda=:c5",$params);
				}
				
			}
			
		}
	}
	
	
	else if($tipo_ese=="Quiz a risposta multipla") {
		
		$params=[
			['value' => $id_esercizio],
			['value' => $id_studente]
			
		]; 
		
		$query_cons="select * from ct_consegne_studenti where fk_esercizio=? and fk_studente=?";
		$row_cons=eseguiQueryPrepareOne($query_cons,$params);
	
		if(!$row_cons) {
			
			$params=[
				['value' => $id_esercizio],
				['value' => $id_studente]
				
			]; 
			
			$query_domande="select * from ct_esercizio_domande where fk_esercizio=? and fk_studente=?";
			$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
			
			$params=[$id_studente,$id_esercizio,"0","0"];
			$id_consegna=eseguiInsertPrepare("insert into ct_consegne_studenti(fk_studente,fk_esercizio,valutazione,valutato) values ",$params);
			
			foreach($dataset_domande as $row_domande) {
			
				//ottengo la risposta
				$srisp="rispdom_".$row_domande["fk_domanda"];
				
				//echo $srisp;
				
				$id_risp = $$srisp;
				
				if($id_risp=="") $id_risp=0;
				
				$data_risposta=date("Y-m-d");
				$params=[$id_studente,$id_esercizio,$id_consegna,"",$data_risposta,$row_domande["fk_domanda"],$id_risp];
				$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta,fk_domanda,fk_risposta) values ",$params);
				
			}
		}
		else {
			$id_consegna=$row_cons["id_consegna"];
			$data_risposta=date("Y-m-d");
			
			$params=[
				['value' => $id_esercizio],
				['value' => $id_studente]
				
			]; 
			
			$query_domande="select * from ct_esercizio_domande where fk_esercizio=? and fk_studente=?";
			$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
			
			eseguiQuery("delete from ct_esercizio_risposte where fk_consegna=$id_consegna");
			
			foreach($dataset_domande as $row_domande) {
			
				//ottengo la risposta
				$srisp="rispdom_".$row_domande["fk_domanda"];
				
				//echo $srisp;
				
				$id_risp = $$srisp;
				
				if($id_risp=="") $id_risp=0;
				
				$data_risposta=date("Y-m-d");
				$params=[$id_studente,$id_esercizio,$id_consegna,"",$data_risposta,$row_domande["fk_domanda"],$id_risp];
				$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta,fk_domanda,fk_risposta) values ",$params);
				
			}
			
		}
	}
	else if($tipo_ese=="Esercizio da consegnare") {
	
		$params=[
			['value' => $id_esercizio],
			['value' => $id_studente]
			
		]; 
		
		$query_cons="select * from ct_consegne_studenti where fk_esercizio=? and fk_studente=?";
		$row_cons=eseguiQueryPrepareOne($query_cons,$params);
		if(!$row_cons) {
		
			$params=[$id_studente,$id_esercizio,"0","0"];
			$id_consegna=eseguiInsertPrepare("insert into ct_consegne_studenti(fk_studente,fk_esercizio,valutazione,valutato) values ",$params);
			
			//var_dump($_POST);
			//var_dump($_FILES);
			
			if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
				$uploadDir = 'consegne/';
				$fileName = basename($_FILES['file']['name']);
				$fileName2 = $_FILES['file']['name'];
				$fileExtension = pathinfo($fileName2, PATHINFO_EXTENSION);
				$uploadFile = $uploadDir . $row_stud["nome"]."_".$row_stud["cognome"]."_".$id_consegna.".".$fileExtension;

				if (!is_dir($uploadDir)) {
					mkdir($uploadDir, 0777, true);
				}

				if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadFile)) {
					echo "Il file è stato caricato con successo.";
					$params=[$id_consegna,$uploadFile];
					eseguiUpdatePrepare("update ct_consegne_studenti set file_consegnato=:c1 where id_consegna=:c0",$params);
				} else {
					echo "Errore durante lo spostamento del file.";
				}
			} else {
				echo "Nessun file caricato o errore durante il caricamento.";
			}
			
			$data_risposta=date("Y-m-d");
			$params=[$id_studente,$id_esercizio,$id_consegna,"",$data_risposta];
			$id_risposta=eseguiInsertPrepare("insert into ct_esercizio_risposte(fk_studente,fk_esercizio,fk_consegna,testo_risposta,data_risposta) values ",$params);
		}
		else {
			$id_consegna=$row_cons["id_consegna"];
			$data_risposta=date("Y-m-d");
			$params=[$id_studente,$id_esercizio,$id_consegna,$testo_risposta,$data_risposta];
			eseguiUpdatePrepare("update ct_esercizio_risposte set testo_risposta=:c3, data_risposta=:c4 where fk_studente=:c0 and fk_esercizio=:c1 and fk_consegna=:c2",$params);
			
		}
		
	
	}
	
	
	//inserire alert
	$data_risposta=date("Y-m-d");
	
	$params=[
		['value' => $id_esercizio]
	]; 
	$query_ese="select * from ct_esercizi where id_esercizio=?";
	$row_ese=eseguiQueryPrepareOne($query_ese,$params);
	
	$params=[
		['value' => $id_quest]
	]; 
	$query_quest="SELECT * FROM ct_quest WHERE id_quest=?";
	$row_quest=eseguiQueryPrepareOne($query_quest,$params);
	
	$testo_alert="Lo studente $row_stud[nome] $row_stud[cognome] ha completato l'esercizio $row_ese[nome_capitolo] nella quest $row_quest[nome_quest]";
	$link_alert="vedi_consegna_studente.php?id_esercizio=$id_esercizio&id_quest=$id_quest&id_studente=$id_studente";
	$params=[$id_classe,$data_risposta,0,$testo_alert,"Esercizi",$link_alert,0,0];
	eseguiInsertPrepare("insert into ct_alerts(fk_classe,data_alert,letto,testo,tipologia,link,doc_stud,fk_studente) values ",$params);

	
	//header("location:accedi_quest_studente.php?id_quest=$id_quest&consegnato=ok");
}
?>
