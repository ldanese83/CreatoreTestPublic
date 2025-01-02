<?php
include("../share/funzioni2_1.php");

header("content-type: csv;");

$id_utente = $_GET["id_utente"];

$query1="SELECT * FROM ct_argomenti_kahoot WHERE fk_utente=$id_utente";

$result1 = eseguiQuery($query1);
//echo "<html><head><meta charset='utf-8' /></head><body>";
while($argomenti=$result1->fetch_assoc()) {
	$query="SELECT * FROM ct_domande,ct_argomenti WHERE fk_argomento=id_argomento and fk_argomento=$argomenti[fk_argomento] and fk_tipo_domanda=2";

	$result = eseguiQuery($query);
	
	while($row=$result->fetch_assoc()) {
		$all_length_ok=1;
		$stringa =htmlspecialchars_decode(html_entity_decode($row["domanda"])).";";
		if(strlen($stringa)>121) $all_length_ok=0;
		$risposte="SELECT * FROM ct_risposte WHERE fk_domanda=$row[id_domanda]";
		$result2=eseguiQuery($risposte);
		$corretta=0;
		$findc=0;
		$i=0;
		while($row2=$result2->fetch_assoc()) {
			$i++;
			$stringa.=htmlspecialchars_decode(html_entity_decode($row2["risposta"])).";";
			if(strlen(htmlspecialchars_decode(html_entity_decode($row2["risposta"])))>75) $all_length_ok=0;
			if($row2["corretta"]==1) {
				$corretta=$i;
				$findc=1;
			}
		
		}
		$stringa.="30;".$corretta."\n";
		if($findc!=0 && $all_length_ok!=0)
			echo $stringa;
	}
	
}
//echo "</body></html>";
//eseguiQuery("DELETE FROM ct_argomenti_kahoot WHERE fk_utente=$id_utente");
?>
