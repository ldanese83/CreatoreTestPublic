<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION["id_utente"];
	$id_classe=$_SESSION["id_classe"];
	$id_studente = $_GET["id_studente"];
	$nome_studente = htmlspecialchars($_GET["nome_studente"]);
	$cognome_studente = htmlspecialchars($_GET["cognome_studente"]);
	$email_studente = $_GET["email_studente"];

	if($id_studente==0) {
		
		$username=strtolower(substr($nome_studente,0,1).$cognome_studente);
		$password=sha1($username);

		$params = [
			["value"=>$username]
		];
		$row=eseguiQueryPrepareOne("select count(*) as tot from ct_utenti where username=?",$params);
		if($row["tot"]>=1) {
			$progressivo=$row["tot"]+1;
			$username=$username.$progressivo;
		}
		
		$params = [
			["value"=>$email_studente]
		];
		$row=eseguiQueryPrepareOne("select id_utente from ct_utenti where email=?",$params);
		if($row) {
		
			$params=[["value"=>$row["id_utente"]],["value"=>$id_classe]];
			$row2=eseguiQueryPrepareOne("select count(*) as tot from ct_studenti inner join ct_studenti_classi on fk_studente=id_studente where fk_utente=? and fk_classe=?",$params);
			if($row2["tot"]==0) {
			
				$params=[$row["id_utente"]];
				$id_stud=eseguiInsertPrepare("insert into ct_studenti(fk_utente) values ",$params);
				$params=[$id_classe,$id_stud];
				eseguiInsertPrepare("insert into ct_studenti_classi(fk_classe,fk_studente) values ",$params);
				echo "Nuovo studente creato correttamente";
			}
			else
				echo "Nuovo studente già presente nella classe";
		}
		else {
		
			$params=[$nome_studente,$cognome_studente,$email_studente,$username,$password,1,2];
			$nuovo_id=eseguiInsertPrepare("insert into ct_utenti(nome,cognome,email,username,password,validato,fk_tipo_utente) values ",$params);
			
			$params=[$nuovo_id,2];
			eseguiInsertPrepare("insert into ct_utenti_tipi(fk_utente,fk_tipo_utente) values ",$params);
			
			$params=[$nuovo_id];
			$id_stud=eseguiInsertPrepare("insert into ct_studenti(fk_utente) values ",$params);
			$params=[$id_classe,$id_stud];
			eseguiInsertPrepare("insert into ct_studenti_classi(fk_classe,fk_studente) values ",$params);
			echo "Nuovo studente creato correttamente";
		}
	}
	else {
		
		if(!isset($_GET["password_studente"]) or $_GET["password_studente"]=="") {
		
			$params = [
				["value"=>$id_studente]
			];
			$row=eseguiQueryPrepareOne("select fk_utente from ct_studenti where id_studente=?",$params);
		
			$params=[$nome_studente,$cognome_studente,$row["fk_utente"]];
			eseguiUpdatePrepare("UPDATE ct_utenti SET nome=:c0,cognome=:c1 WHERE id_utente=:c2",$params);
			echo "Utente modificato correttamente";
		
		}
		else {
			$password=sha1($_GET["password_studente"]);
			$params = [
				["value"=>$id_studente]
			];
			$row=eseguiQueryPrepareOne("select fk_utente from ct_studenti where id_studente=?",$params);
		
			$params=[$nome_studente,$cognome_studente,$password,$row["fk_utente"]];
			eseguiUpdatePrepare("UPDATE ct_utenti SET nome=:c0,cognome=:c1,password=:c2 WHERE id_utente=:c3",$params);
			echo "Utente modificato correttamente";
		}

	}
}
?>
