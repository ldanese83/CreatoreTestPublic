<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {

	extract($_POST);
	$descrizione_punizione=htmlspecialchars(htmlentities($descrizione_punizione));

	// Gestione upload immagine
	$img_punizione = null;
	if (!empty($_FILES['file']['name'])) {
		$target_dir = "./img/Punizioni/";
		$file_name = basename($_FILES['file']['name']);
		$target_file = $target_dir . uniqid() . "_" . $file_name;

		if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
			$img_punizione = $target_file;
		} else {
			echo "Errore nel caricamento dell'immagine.";
			exit;
		}
	}

	// Controllo se si tratta di un inserimento o aggiornamento
	if ($id_punizione == 0) {
		// Inserimento
		$query = "INSERT INTO ct_punizioni (descrizione_punizione, img_punizione, giorni_per_consegna) VALUES ";
		$params = [$descrizione_punizione, $img_punizione, $giorni_per_consegna];
		eseguiInsertPrepare($query, $params);
		echo "Punizione inserita con successo.";
	} else {
		// Aggiornamento
		if ($img_punizione) {
			$query = "UPDATE ct_punizioni SET descrizione_punizione = :c0, img_punizione = :c1, giorni_per_consegna = :c2 WHERE id_punizione = :c3";
			$params = [$descrizione_punizione, $img_punizione, $giorni_per_consegna, $id_punizione];
		} else {
			$query = "UPDATE ct_punizioni SET descrizione_punizione = :c0, giorni_per_consegna = :c1 WHERE id_punizione = :c2";
			$params = [$descrizione_punizione, $giorni_per_consegna, $id_punizione];
		}
		
		eseguiUpdatePrepare($query, $params);

		echo "Punizione aggiornata con successo.";

	}


		
		
}
	

?>
