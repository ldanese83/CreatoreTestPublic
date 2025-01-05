<?php
session_start();
include("../../share/funzioni2_1.php");

$id_potere = $_GET["id_potere"];
$id_utente = $_SESSION["id_utente"];

if ($id_potere == 0) {
    echo "<div class='row'>";
    echo "<div class='col-md-2' style='padding-top:10px'>";
    echo "<label for='nome_potere'>Nome Potere</label></div>";
    echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_potere' name='nome_potere' /></div>";

    echo "<div class='col-md-12' style='padding-top:10px'>";
    echo "<label for='descrizione_potere'>Descrizione Potere</label></div>";
    echo "<div class='col-md-12' style='padding-top:10px'>";
    echo "<textarea style='width:100%' id='descrizione_potere' name='descrizione_potere'></textarea>";
    echo "<script>CKEDITOR.replace('descrizione_potere');</script>";
    echo "</div>";

    echo "<div class='col-md-2' style='padding-top:10px'>";
    echo "<label for='img_potere'>Immagine Potere</label></div>";
    echo "<div class='col-md-10' style='padding-top:10px'><input type='file' id='img_potere' name='img_potere' /></div>";

    echo "<input type='hidden' id='id_potere_mod' name='id_potere' value='0' />";

	echo "<div class='col-md-2' style='padding-top:10px'>";
    echo "<label for='mana_pot'>Mana consumato</label></div>";
    echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' min='1' max='4'  id='mana_pot' name='mana_pot' /></div>";

    echo "<div class='col-md-2' style='padding-top:10px'>";
    echo "<label for='livello'>Livello</label></div>";
    echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='livello' name='livello' /></div>";

    echo "</div>";
} else {
    // Logica per visualizzare/modificare i dettagli di un potere esistente
    $params = [
		["value"=>$id_potere]
	];
	$row=eseguiQueryPrepareOne("select * from ct_poteri where id_potere=?",$params);

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_potere'>Nome Potere</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_potere' name='nome_potere' value='" . htmlspecialchars_decode($row['nome_potere']) . "' /></div>";

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='descrizione_potere'>Descrizione Potere</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'>";
	echo "<textarea style='width:100%' id='descrizione_potere' name='descrizione_potere'>" . htmlspecialchars_decode(html_entity_decode($row['descrizione_potere'])) . "</textarea>";
	echo "<script>CKEDITOR.replace('descrizione_potere');</script>";
	echo "</div>";

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='img_potere'>Immagine Potere</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='file' id='img_potere' name='img_potere' /></div>";

	echo "<div class='col-md-2' style='padding-top:10px'>";
    echo "<label for='mana_pot'>Mana consumato</label></div>";
    echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' min='1' max='4' id='mana_pot' name='mana_pot' value='" . $row['mana_necessario'] . "' /></div>";

	echo "<input type='hidden' id='id_potere_mod' name='id_potere' value='" . $row['id_potere'] . "' />";

	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='livello'>Livello</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='livello' name='livello' value='" . $row['livello'] . "' /></div>";

	echo "</div>";
    
}
?>
