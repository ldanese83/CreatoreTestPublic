<?php
include("../share/funzioni2_1.php");

$id_argomento = $_GET["id_argomento"];
$id_utente = $_GET["id_utente"];

$dataset=eseguiQuery("select * from ct_domande,ct_tipi_domande,ct_argomenti where fk_argomento=id_argomento and fk_argomento=$id_argomento and fk_tipo_domanda=id_tipo_domanda AND id_domanda IN (select fk_domanda from ct_utente_domande where fk_utente = $id_utente) order by ct_domande.fk_tipo_domanda,ct_domande.id_domanda");	
$eo=0;
while($row2=($dataset->fetch_assoc())) {

	if($eo%2==0) $classe="even";
	else $classe="odd";
	
	$dataset3=eseguiQuery("select count(*) as tot from ct_temporary_dom where fk_utente=$id_utente and fk_domanda=$row2[id_domanda]");	
	$row3=$dataset3->fetch_assoc();
	if($row3["tot"]!=0) {
		$classe="green";
	}
	
	echo "<tr class='$classe'>";
	echo "<td>".htmlspecialchars_decode(html_entity_decode($row2["domanda"]))."</td>\n";
	echo "<td>$row2[tipo]</td>\n";
	echo "<td>$row2[nome_argomento]</td>\n";
	if($classe!="green")
		echo "<td style='text-align:right;'><button class='btn btn-success' onclick='aggiungi_domanda($row2[id_domanda],$id_utente)'>Aggiungi</button></td>\n";
	else
		echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='rimuovi_domanda($row2[id_domanda],$id_utente)'>Rimuovi</button></td>\n";		
	echo "</tr>";
	$eo++;
	
}

?>
