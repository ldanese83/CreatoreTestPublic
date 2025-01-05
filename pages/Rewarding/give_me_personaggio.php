<?php
session_start();
include("../../share/funzioni2_1.php");

$id_personaggio = $_GET["id_personaggio"];
$id_utente = $_SESSION["id_utente"];

if($id_personaggio==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_personaggio_mod'>Nome personaggio</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_personaggio_mod' />";
	echo "<input type='hidden' id='id_personaggio_mod' value='$id_personaggio' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='vite_pers_mod'>Vite iniziali personaggio:</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='vite_pers_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='mana_pers_mod'>Mana iniziale personaggio:</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='mana_pers_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='img_pers_mod'>Immagine personaggio</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='file' id='img_pers_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='color_pers_mod'>Colore di default</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='color_pers_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='color_persb_mod'>Colore bordo di default</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='color_persb_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-12' style='padding-top:10px'>";
	echo "<label for='descr_pers_mod'>Descrizione personaggio</label></div>";
	echo "<div class='col-md-12' style='padding-top:10px'><textarea rows=20 style='width:100%' id='descr_pers_mod'></textarea>";
	echo "</div>";
	echo "</div>";
	
	echo "</div>";
	echo "<script>CKEDITOR.replace( 'descr_pers_mod', {
												width: '90%'  // Imposta la larghezza desiderata
											  } );
	</script>";
}
else {

	$params = [
		["value"=>$id_personaggio]
	];
	$row=eseguiQueryPrepareOne("select * from ct_personaggi where id_personaggio=?",$params);

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_personaggio_mod'>Nome personaggio</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_personaggio_mod' value='$row[nome_personaggio]' />";
	echo "<input type='hidden' id='id_personaggio_mod' value='$id_personaggio' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='vite_pers_mod'>Vite iniziali personaggio:</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='vite_pers_mod' value='$row[vita_iniziale]' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='mana_pers_mod'>Mana iniziale personaggio:</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='number' id='mana_pers_mod' value='$row[mana_iniziale]' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='img_pers_mod'>Immagine personaggio</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='file' id='img_pers_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='color_pers_mod'>Colore di default</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='color_pers_mod' value='$row[color]' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='color_persb_mod'>Colore bordo di default</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='color_persb_mod' value='$row[bordercolor]' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-12' style='padding-top:10px'>";
	echo "<label for='descr_pers_mod'>Descrizione personaggio</label></div>";
	echo "<div class='col-md-12' style='padding-top:10px'><textarea rows=20 style='width:100%' id='descr_pers_mod'>";
	echo htmlspecialchars_decode(html_entity_decode($row["descrizione"]));
	echo "</textarea>";
	echo "</div>";
	echo "</div>";
	
	echo "</div>";
	echo "<script>CKEDITOR.replace( 'descr_pers_mod', {
												width: '90%'  // Imposta la larghezza desiderata
											  } );
	</script>";
		
		
}
?>
