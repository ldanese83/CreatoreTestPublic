<?php
session_start();
include("../share/funzioni2_1.php");

$id_domanda = $_GET["id_domanda"];

$dataset=eseguiQuery("select * from ct_risposte where fk_domanda=$id_domanda");
$eo=0;
while($row=($dataset->fetch_assoc())) {
	if($eo%2==0) $classe="even";
	else $classe="odd";
	if($row["corretta"]==1) $classe="green";
	echo "<tr class='$classe'>";
	echo "<td>";
	echo htmlspecialchars_decode(html_entity_decode($row["risposta"]));
	echo "</td>";
	echo "</tr>";
	$eo++;
}
?>
