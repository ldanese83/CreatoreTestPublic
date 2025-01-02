<?php
session_start();
include("../share/funzioni2_1.php");

$id_argomento = $_GET["id_argomento"];
$id_utente = $_SESSION["id_utente"];

if($id_argomento==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_argomento_mod'>Nome argomento</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_argomento_mod' />";
	echo "<input type='hidden' id='id_argomento_mod' value='$id_argomento' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_materia_mod'>Materia</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='nome_materia_mod'>";
	$dataset=eseguiQuery("select ct_materie.* from ct_materie inner join ct_utenti_materie on id_materia=fk_materia where fk_utente = $id_utente");
	while($row=($dataset->fetch_assoc())) {
		echo "<option value='$row[id_materia]'>$row[nome_materia]</option>\n";
	}
	echo "</select></div>";
	echo "</div>";
}
else {

$dataset=eseguiQuery("select * from ct_argomenti where id_argomento=$id_argomento");

while($row=($dataset->fetch_assoc())) {

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_argomento_mod'>Nome argomento</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_argomento_mod' value='$row[nome_argomento]' />";
	echo "<input type='hidden' id='id_argomento_mod' value='$id_argomento' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_materia_mod'>Materia</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><select style='width:100%' id='nome_materia_mod'>";
	$dataset2=eseguiQuery("select ct_materie.* from ct_materie inner join ct_utenti_materie on id_materia=fk_materia where fk_utente = $id_utente");
	while($row2=($dataset2->fetch_assoc())) {
		echo "<option value='$row2[id_materia]' ";
		if($row2["id_materia"]==$row["fk_materia"]) echo "selected ";
		echo ">$row2[nome_materia]</option>\n";
	}
	echo "</select></div>";
	echo "</div>";
	
}
}
?>
