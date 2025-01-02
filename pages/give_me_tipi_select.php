<?php
session_start();
include("../share/funzioni2_1.php");

$dataset=eseguiQuery("select * from ct_tipi_domande");
while($row=($dataset->fetch_assoc())) {
	echo "<option value='$row[id_tipo_domanda]'>$row[tipo]</option>\n";
}
	
?>
