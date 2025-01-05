<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	extract($_POST);
	$descr_pers=htmlspecialchars(htmlentities($descr_pers));
	
	if($id_personaggio==0) {
		
		if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = './img/Personaggi/';
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
		$params=[$nome_personaggio,$uploadFile,$vite_pers,$descr_pers,$color_pers,$color_persb,$mana_pers];
		$nuovo_id=eseguiInsertPrepare("insert into ct_personaggi(nome_personaggio,immagine,vita_iniziale,descrizione,color,bordercolor,mana_iniziale) values ",$params);
		echo "Nuovo personaggio creato correttamente";
	}
	else {
		if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = './img/Personaggi/';
        $fileName = basename($_FILES['file']['name']);
        $uploadFile = $uploadDir . uniqid() . "_" .  $fileName;

        // Creare la directory se non esiste
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // Spostare il file caricato nella directory di destinazione
        if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadFile)) {
            echo "Il file è stato caricato con successo.";
			$params=[$nome_personaggio,$uploadFile,$vite_pers,$descr_pers,$color_pers,$color_persb,$id_personaggio,$mana_pers];
			eseguiUpdatePrepare("update ct_personaggi set nome_personaggio=:c0,immagine=:c1,vita_iniziale=:c2,descrizione=:c3,color=:c4,bordercolor=:c5,mana_iniziale=:c7 where id_personaggio=:c6",$params);
			echo "Personaggio modificato correttamente";
        } else {
            echo "Errore durante lo spostamento del file.";
        }
		} else {
			$params=[$nome_personaggio,$vite_pers,$descr_pers,$color_pers,$color_persb,$id_personaggio,$mana_pers];
			eseguiUpdatePrepare("update ct_personaggi set nome_personaggio=:c0,vita_iniziale=:c1,descrizione=:c2,color=:c3,bordercolor=:c4,mana_iniziale=:c6 where id_personaggio=:c5",$params);
			echo "Personaggio modificato correttamente";
		}
		
		
	}
	
}
?>
