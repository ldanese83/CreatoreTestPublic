<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];

$dataset=eseguiQuery("select id_utente,nome,cognome,username,tipo_utente from ct_professori");

while($row=($dataset->fetch_assoc())) {

	$dataset2 = eseguiQuery("select count(*) as tot from ct_utenti_materie where fk_utente=$row[id_utente] and fk_materia=$id_materia");
	$row2=($dataset2->fetch_assoc());
	$tot = $row2["tot"];
	$class = " ";
	if($tot==1) $class="background-color:#51e95e;";
	else $class="background-color:#efefef;";

	echo "<div class='row'>";
	echo "<div class='col-md-10' style='padding-top:8px;padding-bottom:8px;height:50px;vertical-align:middle; $class'>";
	echo "<input type='text' disabled='true' style='width:100%;font-family:\"Great Vibes\";font-size:16pt;' value='$row[nome] $row[cognome] - $row[username] - $row[tipo_utente]'></input></div>";
	echo "<div class='col-md-2' style='padding-top:10px;height:50px;vertical-align:middle; $class'><button class='btn btn-primary' onclick='assegna_materia_utente($row[id_utente],$id_materia)'>Assegna</button>";
	echo "</div>";
	echo "</div>";
	
}

?>
