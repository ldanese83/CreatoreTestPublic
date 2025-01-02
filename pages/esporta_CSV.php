<?php
session_start();
include("../share/funzioni2_1.php");

header("Content-Type: text/csv; charset=ISO-8859-1");
header("Content-Disposition: attachment; filename=quiz.csv");
$output = fopen("php://output", "w");
$id_quiz = $_GET["id_quiz"];

$array_domande=$_SESSION["array_domande"];

for($j=0;$j<sizeof($array_domande);$j++) {
	$dataset_domanda=eseguiQuery("select * from ct_domande where id_domanda=$array_domande[$j]");	
	$row=$dataset_domanda->fetch_assoc();
	$stringa =html_entity_decode($row["domanda"],ENT_QUOTES);
	$stringa=str_replace('&#039;', "'", $stringa);
	$count="SELECT count(*) as tot FROM ct_risposte WHERE fk_domanda=$row[id_domanda]";
	$resultc=eseguiQuery($count);
	$rowc=$resultc->fetch_assoc();
	if($rowc["tot"]==4){
		$arr = array($stringa);
		//Aggiungo il tipo della domanda
		if($row["fk_tipo_domanda"]==1)
			array_push($arr,"TEXT");
		else 
			array_push($arr,"MULTIPLE_CHOICE");
		if($row["fk_tipo_domanda"]!=1) {
			
			$risposte="SELECT * FROM ct_risposte WHERE fk_domanda=$row[id_domanda]";
			$result2=eseguiQuery($risposte);
			$corretta=0;
			$findc=0;
			$i=0;
			while($row2=$result2->fetch_assoc()) {
				$i++;
				$stringa2=html_entity_decode($row2["risposta"],ENT_QUOTES);
				$stringa2=str_replace('&#039;', "'", $stringa2);
				if($row2["corretta"]==1) {
					$corretta=$stringa2;
					$findc=1;
				}
				array_push($arr,$stringa2);
			}
		}
		array_push($arr,$corretta);
		if($findc!=0)
			fputcsv($output, $arr, ";");
	}
}

?>
