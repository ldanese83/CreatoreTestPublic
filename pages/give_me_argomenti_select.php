<?php
session_start();
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];

$dataset=eseguiQuery("select * from ct_argomenti where fk_materia=$id_materia");
while($row=($dataset->fetch_assoc())) {
	echo "<option value='$row[id_argomento]'>$row[nome_argomento]</option>\n";
}
	
?>
