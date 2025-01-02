<?php
session_start();
include("../share/funzioni2_1.php");

$id_classe = $_GET["id_classe"];
$id_utente = $_SESSION["id_utente"];

if($id_classe==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_classe_mod'>Nome classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_classe_mod' />";
	echo "<input type='hidden' id='id_classe_mod' value='$id_classe' />";
	echo "</div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='colore_classe_mod'>Colore classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='colore_classe_mod' />";
	echo "</div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='icona_classe_mod'>Icona classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='icona_classe_mod'>";
	echo "<option value='fa-bomb'>Bomba</option>\n";
	echo "<option value='fa-landmark'>Tempio</option>\n";
	echo "<option value='fa-fish'>Pesce</option>\n";
	echo "<option value='fa-flag'>Bandiera</option>\n";
	echo "<option value='fa-shield'>Scudo</option>\n";
	echo "<option value='fa-rocket'>Razzo</option>\n";
	echo "<option value='fa-dragon'>Drago</option>\n";
	echo "<option value='fa-marker'>Penna</option>\n";
	echo "<option value='fa-ghost'>Fantasma</option>\n";
	echo "<option value='fa-plane'>Aereo</option>\n";
	echo "</select></div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='anno_scolastico_mod'>Anno scolastico</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='anno_scolastico_mod'>";
	$params=[];
	$dataset=eseguiQueryPrepareMany("select * from ct_anni_scolastici order by anno_scolastico desc",$params);
	foreach($dataset as $row) {
		echo "<option value='$row[id_anno]'>$row[anno_scolastico]</option>\n";
	}
	
	echo "</select></div>";
	echo "</div>";
}
else {

	$params = [
		["value"=>$id_classe]
	];
	$row=eseguiQueryPrepareOne("select * from ct_classi where id_classe=?",$params);

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_classe_mod'>Nome classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_classe_mod' value='$row[nome_classe]' />";
	echo "<input type='hidden' id='id_classe_mod' value='$id_classe' />";
	echo "</div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='colore_classe_mod'>Colore classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='color' id='colore_classe_mod' value='$row[colore]' />";
	echo "</div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='icona_classe_mod'>Icona classe</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='icona_classe_mod'>";
	echo "<option value='fa-bomb' ";
	if($row["icona"]=="fa-bomb") echo "selected ";
	echo ">Bomba</option>\n";
	echo "<option value='fa-landmark' ";
	if($row["icona"]=="fa-landmark") echo "selected ";
	echo ">Tempio</option>\n";
	echo "<option value='fa-fish' ";
	if($row["icona"]=="fa-fish") echo "selected ";
	echo ">Pesce</option>\n";
	echo "<option value='fa-flag' ";
	if($row["icona"]=="fa-flag") echo "selected ";
	echo ">Bandiera</option>\n";
	echo "<option value='fa-shield' ";
	if($row["icona"]=="fa-shield") echo "selected ";
	echo ">Scudo</option>\n";
	echo "<option value='fa-rocket' ";
	if($row["icona"]=="fa-rocket") echo "selected ";
	echo ">Razzo</option>\n";
	echo "<option value='fa-dragon' ";
	if($row["icona"]=="fa-dragon") echo "selected ";
	echo ">Drago</option>\n";
	echo "<option value='fa-marker' ";
	if($row["icona"]=="fa-marker") echo "selected ";
	echo ">Penna</option>\n";
	echo "<option value='fa-ghost' ";
	if($row["icona"]=="fa-ghost") echo "selected ";
	echo ">Fantasma</option>\n";
	echo "<option value='fa-plane' ";
	if($row["icona"]=="fa-plane") echo "selected ";
	echo ">Aereo</option>\n";
	echo "</select></div>";
	echo "</div>";
	
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='anno_scolastico_mod'>Anno scolastico</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='anno_scolastico_mod'>";
	$params=[];
	$dataset2=eseguiQueryPrepareMany("select * from ct_anni_scolastici order by anno_scolastico desc",$params);
	foreach($dataset2 as $row2) {
		echo "<option value='$row2[id_anno]' ";
		if($row2["id_anno"]==$row["fk_anno_scolastico"]) echo "selected ";
		echo ">$row2[anno_scolastico]</option>\n";
	}
	echo "</select></div>";
		
		
}
?>
