<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$nome_quest = htmlspecialchars($_POST["nome_quest"]);
	$id_quest=$_POST["id_quest"];
	
	
	
	
	if($id_quest==0) {
		
		if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = './img/Quest/';
        $fileName = basename($_FILES['file']['name']);
        $uploadFile = $uploadDir . $fileName;

        // Creare la directory se non esiste
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // Spostare il file caricato nella directory di destinazione
        if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadFile)) {
            echo "Il file è stato caricato con successo.";
        } else {
            echo "Errore durante lo spostamento del file.";
        }
		} else {
			echo "Nessun file caricato o errore durante il caricamento.";
		}
		$params=[$nome_quest,$uploadFile];
		$nuovo_id=eseguiInsertPrepare("insert into ct_quest(nome_quest,image_quest) values ",$params);
		$params=[$nuovo_id,$_SESSION["id_classe"]];
		eseguiInsertPrepare("insert into ct_classi_quest(fk_quest,fk_classe) values ",$params);
		echo "Nuova quest creata correttamente";
	}
	else {
		if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = './img/Quest/';
        $fileName = basename($_FILES['file']['name']);
        $uploadFile = $uploadDir . $fileName;

        // Creare la directory se non esiste
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // Spostare il file caricato nella directory di destinazione
        if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadFile)) {
            echo "Il file è stato caricato con successo.";
			$params=[$nome_quest,$id_quest,$uploadFile];
			eseguiUpdatePrepare("update ct_quest set nome_quest=:c0,image_quest=:c2 where id_quest=:c1",$params);
			echo "Quest modificata correttamente";
        } else {
            echo "Errore durante lo spostamento del file.";
        }
		} else {
			$params=[$nome_quest,$id_quest];
			eseguiUpdatePrepare("update ct_quest set nome_quest=:c0 where id_quest=:c1",$params);
			echo "Quest modificata correttamente";
		}
		
		
	}
	
}
?>
