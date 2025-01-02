<?php

session_start();

require_once '../vendor/autoload.php';

include("../share/funzioni2_1.php");

//ottengo dalla sessione gli array con domande ed esercizi
$array_domande=$_SESSION["array_domande"];
$array_esercizi=$_SESSION["array_esercizi"];
//ottengo l'id del quiz che vado a stampare
$id_quiz=$_GET["id_quiz"];

//ottengo le domande totali
$num_domande=count($array_domande);
//per i dsa tolgo il 20% delle domande, calcolando in parte dalle domande ed in parte dagli esercizi
//quante ne devo togliere
$da_togliere = ceil($num_domande*0.2);
$da_togliere_dom = ceil((count($array_domande)-count($array_esercizi))*0.2);
$da_togliere_ese = ceil(count($array_esercizi)*0.2);
if(($da_togliere_ese-count($array_esercizi))==0 and count($array_esercizi)>0) $da_togliere_ese--;
if($da_togliere_dom + $da_togliere_ese == $da_togliere) {}
else $da_togliere_dom--;

//ottengo gli argomenti del quiz
$params=[
	['value' => $id_quiz]
];
$qy="select * from ct_argomenti, ct_quiz_argomenti, ct_materie where fk_materia=id_materia and fk_argomento=id_argomento and fk_quiz=?";
$dataset_quiz=eseguiQueryPrepareMany($qy,$params);	

//ottengo i dati del quiz
$row_info_quiz = eseguiQueryPrepareOne("select * from ct_quiz where id_quiz=?",$params);

if($row_info_quiz) 
	//voglio mostrare o meno i punti delle domande?
	$mostrapunti=$row_info_quiz["mostra_punti_dom"];
else 
	die("Errore nella query di selezione del quiz");


$argomenti = "";
$materia="";
if($dataset_quiz) {
	//ottengo materie ed argomenti
	foreach($dataset_quiz as $row_quiz) {
		
		$materia=$row_quiz["nome_materia"];
		$argomenti.=$row_quiz["nome_argomento"]." - ";
		
	}
	$argomenti = substr($argomenti,0,strlen($argomenti)-3);
}
else
	die("Errore nella query di selezione di materia ed argomenti");

//configuro MPDF con il font Frutiger
$defaultConfig = (new Mpdf\Config\ConfigVariables())->getDefaults();
$fontDirs = $defaultConfig['fontDir'];

$defaultFontConfig = (new Mpdf\Config\FontVariables())->getDefaults();
$fontData = $defaultFontConfig['fontdata'];

$mpdf = new \Mpdf\Mpdf([
    'fontDir' => array_merge($fontDirs, [
        __DIR__ . '/custom/font/directory',
    ]),
    'fontdata' => $fontData + [
        'frutiger' => [
            'R' => 'Frutiger.ttf'
        ]
    ],
    'default_font' => 'frutiger'
]);

//header del documento, viene inserito sopra ad ogni pagina
$header ="<div id=\"nome_cognome\">Nome e cognome:</div><div id=\"classe\">Classe:</div><div id=\"data\">Data:</div>";

//HTML con il testo del documento da stampare
$html="<html>";
$html.="<head>";
$html.="<link href=\"../css/stampa.css\" rel=\"stylesheet\">";
$html.="</head>";
$html.="<body>";
$html .= "<div class=\"logo_sx\"><img src=\"./images/logo_dalcero.png\" class=\"logo_dalcero\" /></div>";
$html .= "<div class=\"scritta_header\">Istituto Statale di Istruzione Secondaria Superiore<br />\"M.O. Luciano Dal Cero\"<br />San Bonifacio (Vr)</div>";
$html.="<div class=\"logo_dx\"><img src=\"./images/rep_italiana.jpg\" class=\"logo_rep\" /></div>";
$html.="<div id=\"titolo_quiz\">";
$html.="Compito di $materia - $row_info_quiz[nome_quiz] .";
$html.="</div>";
$html.="<div id=\"domande\">";
$esercizi_counter=0;
$domande_counter=0;
for($i=0;$i<sizeof($array_domande);$i++) {
	//ottengo la domanda vera e propria, dato che l'array mi da solo il suo id
	$params=[
		['value' => $array_domande[$i]]
	];
	$row_domanda=eseguiQueryPrepareOne("select * from ct_domande where id_domanda=?",$params);	
	if($row_domanda) {
		//controllo se la devo inserire o meno (non inserisco se sono arrivato ad inserire l'80%
		if($domande_counter+$esercizi_counter<sizeof($array_domande)-$da_togliere) {
			//inserisco la domanda seguendo le regole del quiz
			$html.="<div id=\"titolo_domanda$i\" class=\"titolo_domanda\">";
			$html.="Domanda ".($i+1);
			if($mostrapunti!=2)
				$html.=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;______/($row_domanda[punti] punti)";
			$html.="</div>";
			$html.="<div id=\"domanda$i\" class=\"domanda_dsa\">";
			$html.=htmlspecialchars_decode(html_entity_decode($row_domanda["domanda"]));
			$html.="</div>";
			switch($row_domanda["fk_tipo_domanda"]) {
				case 1: 
					if($domande_counter<count($array_domande)-count($array_esercizi)-$da_togliere_dom) {
						$html.="<div id=\"spazio_risposta$i\" class=\"spazio_risposta_dsa\">";
						for($j=0;$j<$row_domanda["num_righe"];$j++)
							$html.="_______________________________________________________________________________________<br />";
						$html.="</div>";
					}
					$domande_counter++;
					break;
				case 2:
				case 3:
					if($domande_counter<count($array_domande)-count($array_esercizi)-$da_togliere_dom) {
						//Inserisco le risposte, usando la query apposita
						$params=[
							['value' => $row_domanda["id_domanda"]]
						];
						$dataset_risposte=eseguiQueryPrepareMany("select * from ct_risposte where fk_domanda=?",$params);	
						$array_risposte=array();
						foreach($dataset_risposte as $row_risposta) {
							array_push($array_risposte,$row_risposta["risposta"]);
						}
						if($row_info_quiz["mix_answer"]==1) {
							shuffle($array_risposte);
						}
						for($j=0;$j<count($array_risposte);$j++) {
							if($row_domanda["fk_tipo_domanda"]==2)
								$html.="<div style=\"display:block;float:left;width:30px;\"><img src=\"./images/circle.jpg\" style=\"width:15px;height:15px;margin-top:10px;\"></div>";
							else
								$html.="<div style=\"display:block;margin-right:15px;float:left;width:5%;\"><img src=\"./images/square.png\" style=\"width:15px;height:15px;margin-top:8px;\"></div>";
							$html.="<div id=\"spazio_risposta$j\" class=\"risp_multipla_dsa\">";
							$html.=htmlspecialchars_decode(html_entity_decode($array_risposte[$j]));
							$html.="</div>";
						}
					}
					$domande_counter++;
					break;
				case 4:
					if($esercizi_counter<count($array_esercizi)-$da_togliere_ese) {
						$html.="<div id=\"spazio_risposta$i\" class=\"risp_multipla_dsa\" style=\"text-align:justify;\">";
						$html.=htmlspecialchars_decode(html_entity_decode($array_esercizi[$esercizi_counter]));
						$html.="</div>";
					}
					$esercizi_counter++;
					break;
			}
		}
	}
	else die("Errore nella selezione di una domanda");
}
$html.="</div>";
if($row_info_quiz["fk_griglia"]!=0) {
	//ottengo l'eventuale griglia di valutazione da mettere in fondo alle domande
	$params=[
		['value' => $row_info_quiz["fk_griglia"]]
	];
	$row_griglia = eseguiQueryPrepareOne("select * from ct_griglie_valutazione where id_griglia=?",$params);
	if($row_griglia) {
		$griglia = htmlspecialchars_decode(html_entity_decode($row_griglia["griglia"]));
		$html.="<div id='griglia'>".$griglia."</div>";
	}
	else die("Errore nella selezione della griglia");
	
}
$lastPageFooter="<div id=\"footer\">";
$lastPageFooter.="<table id=\"table_footer\">";
$lastPageFooter.="<tr><th>Punteggio Ottenuto</th><th>Voto</th></tr>";
$lastPageFooter.="<tr><td></td><td></td></tr>";
$lastPageFooter.="</table></div>";
$html.="</body>";
$html.="</html>";

$mpdf->SetHTMLHeader($header);
$mpdf->WriteHTML($html);
$mpdf->SetHTMLFooter($lastPageFooter);
$mpdf->Output();
//echo $header.$html;
?>