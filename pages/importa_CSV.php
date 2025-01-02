<?php
include("header.php");

function carica_file($nome_file,$id_argomento,$id_utente) {
	
	$file = fopen($nome_file,"r");
	//tolgo la prima riga
	$riga = fgets($file);
	//salvo gli indicatori
	while(! feof($file)) {

		$riga = fgets($file);
		
		if($riga!="" && $riga!="\n") {
			$array = explode(";", $riga);
			$domanda = htmlentities($array[0],ENT_QUOTES);
			$tipo=strtolower($array[1]);
			
			$tipo_domanda=1;
			
			switch($tipo) {
				case "scelta multipla": $tipo_domanda=2;
				break;
				case "risposta multipla": $tipo_domanda=3;
				break;
				case "domanda aperta": $tipo_domanda=1;
				break;
				case "ese con numeri": $tipo_domanda=4;
				break;
			}
			
			$num_righe="0";
			$num_gruppo = 0;
			
			$livello_diff = 3;
			
			$query = "INSERT INTO ct_domande(domanda, punti, fk_argomento, fk_tipo_domanda, num_righe, num_gruppo, fk_libro, fk_utente, data_creazione,ese_num,livello_diff) VALUES('$domanda',";
			$query.= "$array[9],$id_argomento,$tipo_domanda,$array[8],$num_gruppo,1,$id_utente,'".Date("Y-m-d")."','',$livello_diff)";
			
			//echo $query."<br><br>";
			
			$id_domanda = eseguiInsert($query);
			
			eseguiQuery("insert into ct_utente_domande(fk_utente,fk_domanda) values($id_utente,$id_domanda)");
			
			echo "<div class='alert alert-success'><strong>Domanda importata:</strong> ".$domanda."</div>";
			
			if($tipo_domanda==2 || $tipo_domanda==3) {
				for($i=2;$i<8;$i++) {
					
					if($array[$i]!="") {
					
						$corr=0;
						$risp = htmlentities($array[$i],ENT_QUOTES);
						if(($i-1)==$array[8]) $corr=1;
						
						$query_risp = "INSERT INTO ct_risposte(risposta,corretta,fk_domanda) VALUES(";
						$query_risp.= "'$risp',$corr,$id_domanda)";
						
						eseguiQuery($query_risp);
						
						
						
						//echo "<br /><br />".$query_risp;
						
					}
					
				}
			}
		}
	}
	fclose($file);
}

if (!isset($user))
{
 
}
else{
?>
<script src="../js/domande.js" ></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">
			<div style="text-align:center;width:100%;margin-bottom:20px;">
			<button class="btn btn-primary" onclick='window.location.href="import.php";'>Indietro</button>
			</div>
<?php
$argomento=$_POST["id_argomento"];
//upload del file selezionato
if (isset($_FILES['fileUpload']) && $_FILES['fileUpload']['error'] == 0) {
	$targetDirectory = "file_csv/";
	$targetFile = $targetDirectory . basename($_FILES["fileUpload"]["name"]);
	$uploadOk = 1;
	$fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

	// Controlla se il file esiste già
	if (file_exists($targetFile)) {
		echo "<div class='alert alert-danger'>Il file esiste già. Modifica il nome..</div>";
		$uploadOk = 0;
	}

	// Controlla la dimensione del file
	if ($_FILES["fileUpload"]["size"] > 50000) {
		echo "<div class='alert alert-danger'>Il file è troppo grande.</div>";
		$uploadOk = 0;
	}

	// Controlla il tipo di file (puoi aggiungere altre estensioni se necessario)
	if ($fileType != "csv") {
		echo "<div class='alert alert-danger'>Sono ammessi solo file di tipo CSV nel formato specifico</div>";
		$uploadOk = 0;
	}

	// Controlla se $uploadOk è impostato su 0 da un errore
	if ($uploadOk == 0) {
		echo "<div class='alert alert-danger'>Il file non è stato caricato.</div>";
	} else {
		if (move_uploaded_file($_FILES["fileUpload"]["tmp_name"], $targetFile)) {
			carica_file($targetFile,$argomento,$id_utente);
		} else {
			echo "<div class='alert alert-danger'>C'è stato un errore durante il caricamento del file.</div>";
		}
	}
} else {
	echo "<div class='alert alert-danger'>Nessun file caricato o errore nel caricamento.</div>";
}



}
?>
