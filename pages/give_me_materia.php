<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];

if($id_materia==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_materia_mod'>Nome materia</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_materia_mod' />";
	echo "<input type='hidden' id='id_materia_mod' value='$id_materia' />";
	echo "</div>";
	echo "</div>";
}
else {

$dataset=eseguiQuery("select * from ct_materie where id_materia=$id_materia");

while($row=($dataset->fetch_assoc())) {

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_materia_mod'>Nome materia</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_materia_mod' value='$row[nome_materia]' />";
	echo "<input type='hidden' id='id_materia_mod' value='$id_materia' />";
	echo "</div>";
	echo "</div>";
	
}
}
?>
