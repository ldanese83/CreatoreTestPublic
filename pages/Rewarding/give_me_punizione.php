<?php
session_start();
include("../../share/funzioni2_1.php");

$id_punizione = $_GET["id_punizione"];
$id_utente = $_SESSION["id_utente"];

if ($id_punizione == 0) {

    echo "<div class='col-md-12' style='padding-top:10px'>";
    echo "<label for='descrizione_punizione'>Descrizione punizione</label></div>";
    echo "<div class='col-md-12' style='padding-top:10px'>";
    echo "<textarea style='width:100%' id='descrizione_punizione' name='descrizione_punizione'></textarea>";
    echo "<script>CKEDITOR.replace('descrizione_punizione');</script>";
    echo "</div>";

    echo "<div class='col-md-4' style='padding-top:10px'>";
    echo "<label for='img_punizione'>Immagine punizione</label></div>";
    echo "<div class='col-md-8' style='padding-top:10px'><input type='file' id='img_punizione' name='img_punizione' /></div>";

    echo "<input type='hidden' id='id_punizione_mod' name='id_punizione' value='0' />";

    echo "<div class='col-md-4' style='padding-top:10px'>";
    echo "<label for='giorni_per_consegnare'>Giorni per consegnare</label></div>";
    echo "<div class='col-md-8' style='padding-top:10px'><input style='width:100%' type='number' id='giorni_per_consegnare' name='giorni_per_consegnare' /></div>";

    echo "</div>";
} else {
    // Logica per visualizzare/modificare i dettagli di un punizione esistente
    $params = [
		["value"=>$id_punizione]
	];
	$row=eseguiQueryPrepareOne("select * from ct_punizioni where id_punizione=?",$params);

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='descrizione_punizione'>Descrizione punizione</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'>";
	echo "<textarea style='width:100%' id='descrizione_punizione' name='descrizione_punizione'>" . htmlspecialchars_decode(html_entity_decode($row['descrizione_punizione'])) . "</textarea>";
	echo "<script>CKEDITOR.replace('descrizione_punizione');</script>";
	echo "</div>";

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='img_punizione'>Immagine punizione</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='file' id='img_punizione' name='img_punizione' /></div>";

	echo "<input type='hidden' id='id_punizione_mod' name='id_punizione' value='" . $row['id_punizione'] . "' />";

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='giorni_per_consegnare'>Giorni per cosegnare</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='giorni_per_consegnare' name='giorni_per_consegnare' value='" . $row['giorni_per_consegna'] . "' /></div>";

	echo "</div>";
    
}
?>
