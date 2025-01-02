<?php
include("../share/funzioni2_1.php");

header("Content-Type: text/csv; charset=ISO-8859-1");
header("Content-Disposition: attachment; filename=dati_domande.csv");
$output = fopen("php://output", "w");
$id_utente = $_GET["id_utente"];

$query1="SELECT * FROM ct_argomenti_kahoot WHERE fk_utente=$id_utente";

$result1 = eseguiQuery($query1);
//echo "<html><head><meta charset='utf-8' /></head><body>";
while($argomenti=$result1->fetch_assoc()) {
	$query="SELECT * FROM ct_domande,ct_argomenti WHERE fk_argomento=id_argomento and fk_argomento=$argomenti[fk_argomento] and fk_tipo_domanda=2";

	$result = eseguiQuery($query);
	
	while($row=$result->fetch_assoc()) {
		$all_length_ok=1;
		$stringa =html_entity_decode($row["domanda"],ENT_QUOTES);
		$stringa=str_replace('&#039;', "'", $stringa);
		if(strlen($stringa)>121) $all_length_ok=0;
		$arr = array($stringa);
		$risposte="SELECT * FROM ct_risposte WHERE fk_domanda=$row[id_domanda]";
		$result2=eseguiQuery($risposte);
		$corretta=0;
		$findc=0;
		$i=0;
		while($row2=$result2->fetch_assoc()) {
			$i++;
			$stringa2=html_entity_decode($row2["risposta"],ENT_QUOTES);
			$stringa2=str_replace('&#039;', "'", $stringa2);
			if(strlen($stringa2)>75) $all_length_ok=0;
			if($row2["corretta"]==1) {
				$corretta=$i;
				$findc=1;
			}
			array_push($arr,$stringa2);
		}
		
		array_push($arr,"30");
		array_push($arr,$corretta);
		if($findc!=0 && $all_length_ok!=0)
			fputcsv($output, $arr, ";");
	}
	
}
//echo "</body></html>";
eseguiQuery("DELETE FROM ct_argomenti_kahoot WHERE fk_utente=$id_utente");
?>
