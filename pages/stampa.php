<?php

session_start();

require_once '../vendor/autoload.php';

include("../share/funzioni2_1.php");

$array_domande=$_SESSION["array_domande"];
$array_esercizi=$_SESSION["array_esercizi"];
$id_quiz=$_GET["id_quiz"];
$dataset_quiz=eseguiQuery("select * from ct_argomenti, ct_quiz_argomenti, ct_materie where fk_materia=id_materia and fk_argomento=id_argomento and fk_quiz='$id_quiz'");	

$dataset_info_quiz = eseguiQuery("select * from ct_quiz where id_quiz=$id_quiz");
$row_info_quiz=$dataset_info_quiz->fetch_assoc();
$mostrapunti=$row_info_quiz["mostra_punti_dom"];

$argomenti = "";
$materia="";
while($row_quiz=$dataset_quiz->fetch_assoc()) {
	
	$materia=$row_quiz["nome_materia"];
	$argomenti.=$row_quiz["nome_argomento"]." - ";
	
}
$argomenti = substr($argomenti,0,strlen($argomenti)-3);

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

$header ="<div id=\"nome_cognome\">Nome e cognome:</div><div id=\"classe\">Classe:</div><div id=\"data\">Data:</div>";

$html="<html>";
$html.="<head>";
$html.="<link href=\"../css/stampa.css\" rel=\"stylesheet\">";
$html.="</head>";
$html.="<body>";
$html .= "<div class=\"logo_sx\"><img src=\"./images/logo_dalcero.png\" class=\"logo_dalcero\" /></div>";
$html .= "<div class=\"scritta_header\">Istituto Statale di Istruzione Secondaria Superiore<br />\"M.O. Luciano Dal Cero\"<br />San Bonifacio (Vr)</div>";
$html.="<div class=\"logo_dx\"><img src=\"./images/rep_italiana.jpg\" class=\"logo_rep\" /></div>";
$html.="<div id=\"titolo_quiz\">";
$html.="Compito di $materia - $row_info_quiz[nome_quiz]";
$html.="</div>";
$html.="<div id=\"domande\">";
$esercizi_counter=0;
for($i=0;$i<sizeof($array_domande);$i++) {
	$dataset_domanda=eseguiQuery("select * from ct_domande where id_domanda=$array_domande[$i]");	
	$row_domanda=$dataset_domanda->fetch_assoc();
	$html.="<div id=\"titolo_domanda$i\" class=\"titolo_domanda\">";
	$html.="Domanda ".($i+1);
	if($mostrapunti!=2)
		$html.=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;______/($row_domanda[punti] punti)";
	$html.="</div>";
	$html.="<div id=\"domanda$i\" class=\"domanda\">";
	$html.=htmlspecialchars_decode(html_entity_decode($row_domanda["domanda"]));
	$html.="</div>";
	switch($row_domanda["fk_tipo_domanda"]) {
		case 1: 
			$html.="<div id=\"spazio_risposta$i\" class=\"spazio_risposta\">";
			for($j=0;$j<$row_domanda["num_righe"];$j++)
				$html.="_______________________________________________________________________________________________________________<br />";
			$html.="</div>";
			break;
		case 2:
			$dataset_risposte=eseguiQuery("select * from ct_risposte where fk_domanda=$row_domanda[id_domanda]");	
			$array_risposte=array();
			while($row_risposta=$dataset_risposte->fetch_assoc()) {
				array_push($array_risposte,$row_risposta["risposta"]);
			}
			$dataset_quiz = eseguiQuery("select * from ct_quiz where id_quiz=$id_quiz");
			$row_quiz = $dataset_quiz->fetch_assoc();
			if($row_quiz["mix_answer"]==1) {
				shuffle($array_risposte);
			}
			for($j=0;$j<count($array_risposte);$j++) {
				$html.="<div style=\"display:block;margin-right:15px;float:left;width:5%;\"><img src=\"./images/circle.jpg\" style=\"width:15px;height:15px;margin-top:2px;\"></div>";
				$html.="<div id=\"spazio_risposta$j\" class=\"risp_multipla\">";
				$html.=htmlspecialchars_decode(html_entity_decode($array_risposte[$j]));
				$html.="</div>";
			}
			break;
		case 3:
			$dataset_risposte=eseguiQuery("select * from ct_risposte where fk_domanda=$row_domanda[id_domanda]");	
			$array_risposte=array();
			while($row_risposta=$dataset_risposte->fetch_assoc()) {
				array_push($array_risposte,$row_risposta["risposta"]);
			}
			$dataset_quiz = eseguiQuery("select * from ct_quiz where id_quiz=$id_quiz");
			$row_quiz = $dataset_quiz->fetch_assoc();
			if($row_quiz["mix_answer"]==1) {
				shuffle($array_risposte);
			}
			for($j=0;$j<count($array_risposte);$j++) {
				$html.="<div style=\"display:block;margin-right:15px;float:left;width:5%;\"><img src=\"./images/square.png\" style=\"width:15px;height:15px;margin-top:2px;\"></div>";
				$html.="<div id=\"spazio_risposta$j\" class=\"risp_multipla\">";
				$html.=htmlspecialchars_decode(html_entity_decode($array_risposte[$j]));
				$html.="</div>";
			}
			break;
		case 4:
			$html.="<div id=\"spazio_risposta$i\" class=\"risp_multipla\" style=\"text-align:justify;\">";
			$html.=htmlspecialchars_decode(html_entity_decode($array_esercizi[$esercizi_counter]));
			$html.="</div>";
			$esercizi_counter++;
			break;
	}
}
$html.="</div>";
if($row_info_quiz["fk_griglia"]!=0) {
	
	$dataset_griglia = eseguiQuery("select * from ct_griglie_valutazione where id_griglia=$row_info_quiz[fk_griglia]");
	$row_griglia = $dataset_griglia->fetch_assoc();
	$griglia = htmlspecialchars_decode(html_entity_decode($row_griglia["griglia"]));
	$html.="<div id='griglia'>".$griglia."</div>";
	
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