<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {

	extract($_POST);
	$descrizione_potere=htmlspecialchars(htmlentities($descrizione_potere));

	// Gestione upload immagine
	$img_potere = null;
	if (!empty($_FILES['file']['name'])) {
		$target_dir = "./img/Poteri/";
		$file_name = basename($_FILES['file']['name']);
		$target_file = $target_dir . uniqid() . "_" . $file_name;

		if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
			$img_potere = $target_file;
		} else {
			echo "Errore nel caricamento dell'immagine.";
			exit;
		}
	}

	// Controllo se si tratta di un inserimento o aggiornamento
	if ($id_potere == 0) {
		// Inserimento
		$query = "INSERT INTO ct_poteri (nome_potere, descrizione_potere, img_potere, livello,mana_necessario) VALUES ";
		$params = [$nome_potere, $descrizione_potere, $img_potere, $livello,$mana_pot];
		eseguiInsertPrepare($query, $params);
		echo "Potere inserito con successo.";
	} else {
		// Aggiornamento
		if ($img_potere) {
			$query = "UPDATE ct_poteri SET nome_potere = :c0, descrizione_potere = :c1, img_potere = :c2, livello = :c3, mana_necessario=:c5 WHERE id_potere = :c4";
			$params = [$nome_potere, $descrizione_potere, $img_potere, $livello, $id_potere,$mana_pot];
		} else {
			$query = "UPDATE ct_poteri SET nome_potere = :c0, descrizione_potere = :c1, livello = :c2, mana_necessario=:c4 WHERE id_potere = :c3";
			$params = [$nome_potere, $descrizione_potere, $livello, $id_potere,$mana_pot];
		}
		
		eseguiUpdatePrepare($query, $params);

		echo "Potere aggiornato con successo.";

	}


		
		
}
	

?>
