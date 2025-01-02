<?php
session_start();
include("../share/funzioni2_1.php");

$id_domanda = $_GET["id_domanda"];
$dataset_dom=eseguiQuery("select * from ct_domande where id_domanda=$id_domanda");
$row_dom=$dataset_dom->fetch_assoc();
if($row_dom["fk_tipo_domanda"]!=4) {
	$dataset=eseguiQuery("select * from ct_risposte where fk_domanda=$id_domanda");
	$eo=0;
	while($row=($dataset->fetch_assoc())) {
		if($eo%2==0) $classe="even";
		else $classe="odd";
		if($row["corretta"]==1) $classe="azzurro";
		echo "<tr class='$classe'>";
		echo "<td>";
		echo htmlspecialchars_decode(html_entity_decode($row["risposta"]));
		echo "</td>";
		echo "</tr>";
		$eo++;
	}
}
else {
	echo "<tr>";
	echo "<td>";
	echo htmlspecialchars_decode(html_entity_decode($row_dom["ese_num"]));
	echo "</td>";
	echo "</tr>";
}
?>
