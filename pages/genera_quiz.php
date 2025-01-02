<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
	$row=$dataset->fetch_assoc();
	$id_utente = $row["id_utente"];
	$id_quiz = $_GET["id_quiz"];
	$dataset_quiz=eseguiQuery("select * from ct_quiz where id_quiz='$id_quiz'");	
	$row_quiz=$dataset_quiz->fetch_assoc();
	$array_domande = array();
	$array_esercizi=array();
	$tot_domande=0;
	
	if($row_quiz["casuale"]==1) {
	
		$dataset2=eseguiQuery("select * from ct_quiz_tipo_domande where fk_quiz=$row_quiz[id_quiz]");
		$dataset3=eseguiQuery("select sum(num_domande) as tot from ct_quiz_tipo_domande where fk_quiz=$row_quiz[id_quiz]");
		$row3 = $dataset3->fetch_assoc();
		$tot_domande = $row3["tot"];
		
		while($row_tipi=$dataset2->fetch_assoc()) {
		
			//ci sono domande con gruppo?
			if($row_tipi["fk_tipo_domande"]==0) {
				$dataset_gruppi = eseguiQuery("select distinct num_gruppo from ct_domande where fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND num_gruppo<>0 AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente)");
			}
			else {
				$dataset_gruppi = eseguiQuery("select distinct num_gruppo from ct_domande where fk_tipo_domanda=$row_tipi[fk_tipo_domande] AND fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND num_gruppo<>0 AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente)");
			}
			$tot_gruppi = mysqli_num_rows($dataset_gruppi);
			if($tot_gruppi==0) {
		
				$limit=$row_tipi["num_domande"];
				
			}
			else {
				
				$limit=$row_tipi["num_domande"]-$tot_gruppi;
				
			}
			
			if($row_tipi["fk_tipo_domande"]==0) {
				$dataset_domande=eseguiQuery("select id_domanda from (select id_domanda,livello_diff from ct_domande where fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND num_gruppo=0 AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente) ORDER BY rand() LIMIT $limit) as doms order by livello_diff");
			}
			else {
				$dataset_domande=eseguiQuery("select id_domanda from (select id_domanda,livello_diff from ct_domande where fk_tipo_domanda=$row_tipi[fk_tipo_domande] AND num_gruppo=0 AND fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente) ORDER BY rand() LIMIT $limit) as doms order by livello_diff");
			}
			
			//echo "select id_domanda from ct_domande where fk_tipo_domanda=$row_tipi[fk_tipo_domande] AND fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') ORDER BY rand() LIMIT $row_tipi[num_domande]";
			
			while($row_domande=$dataset_domande->fetch_assoc()) {
				
				array_push($array_domande,$row_domande["id_domanda"]);

			}
			while($row_gruppi = $dataset_gruppi->fetch_assoc()) {
				if($row_tipi["fk_tipo_domande"]==0) {
					$dataset_domande=eseguiQuery("select id_domanda from ct_domande where fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND num_gruppo=$row_gruppi[num_gruppo] AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente) ORDER BY rand() LIMIT 1");
					$row_domande=$dataset_domande->fetch_assoc();
					array_push($array_domande,$row_domande["id_domanda"]);
				}
				else {
					$dataset_domande=eseguiQuery("select id_domanda from ct_domande where fk_tipo_domanda=$row_tipi[fk_tipo_domande] AND fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') AND num_gruppo=$row_gruppi[num_gruppo] AND id_domanda in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente) ORDER BY rand() LIMIT 1");
					$row_domande=$dataset_domande->fetch_assoc();
					array_push($array_domande,$row_domande["id_domanda"]);
				}
			
			}
			
		}
		
	}
	else {
		
		$dataset3=eseguiQuery("select count(fk_domanda) as tot from ct_quiz_domande where fk_quiz='$id_quiz'");
		$row3 = $dataset3->fetch_assoc();
		$tot_domande = $row3["tot"];
		
		$dataset_domande=eseguiQuery("select fk_domanda from ct_quiz_domande,ct_domande where id_domanda=fk_domanda and fk_quiz='$id_quiz' order by livello_diff");	
			
		//echo "select id_domanda from ct_domande where fk_tipo_domanda=$row_tipi[fk_tipo_domande] AND fk_argomento in (select fk_argomento from ct_quiz_argomenti where fk_quiz='$id_quiz') ORDER BY rand() LIMIT $row_tipi[num_domande]";
		
		while($row_domande=$dataset_domande->fetch_assoc()) {
			
			array_push($array_domande,$row_domande["fk_domanda"]);

		}
		
	}
	
	if($row_quiz["mix_questions"]==0) 
		shuffle($array_domande);

	$_SESSION["array_domande"]=$array_domande;
	error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE);
	try {
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

	
	<h3 style="text-align:center;">QUIZ <?php echo $row_quiz["nome_quiz"]; ?></h3>
	
	<div style="text-align:center;width:100%">
		<button class="btn btn-primary" onclick='window.location.href="quiz.php";'>Indietro</button>
		<button class="btn btn-black" onclick='location.reload();'>Rigenera</button>
		<a href="stampa.php?id_quiz=<?php echo $id_quiz; ?>" target="_blank"><button class="btn btn-success">STAMPA</button></a>
		<a href="stampa_DSA.php?id_quiz=<?php echo $id_quiz; ?>" target="_blank"><button class="btn btn-warning">STAMPA PER DSA (20% domande in meno)</button></a>
		<a href="esporta_CSV.php?id_quiz=<?php echo $id_quiz; ?>" target="_blank"><button class="btn btn-info">ESPORTA CSV</button></a>
	</div>
	
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="#" id="form_quiz" style="padding:1em;">
					
					<?php 
					for($i=0;$i<$tot_domande;$i++) {
						$dataset_domanda=eseguiQuery("select * from ct_domande where id_domanda=$array_domande[$i]");	
						$row_domanda=$dataset_domanda->fetch_assoc();?>
						<div class='row_form'>
							<h4 class="row_form_h4">Domanda <?php echo $i+1; ?></h4>
							<div class="input-group input-group-icon" style="width:100%">
								<input type="text" placeholder="Nome" id="nome_quiz" name="nome_quiz" style="width:100%" value="<?php echo htmlspecialchars_decode(html_entity_decode($row_domanda["domanda"])); ?>" />
								<div class="input-icon"><i class="fa fa-bars"></i></div>
							</div>
						</div>
					<?php 
						if($row_domanda["fk_tipo_domanda"]==2 || $row_domanda["fk_tipo_domanda"]==3) {
							if($row_domanda["fk_tipo_domanda"]==2) $icona = "fa-angle-double-right";
							else $icona = "fa-copy";
							$dataset_risposte=eseguiQuery("select * from ct_risposte where fk_domanda=$row_domanda[id_domanda]");	
							while($row_risposta=$dataset_risposte->fetch_assoc()) {?>
							<div class='row_form'>
								<div class="input-group input-group-icon" style="width:100%">
									<input type="text" placeholder="Nome" id="nome_quiz" name="nome_quiz" style="width:100%" value="<?php echo htmlspecialchars_decode(html_entity_decode($row_risposta["risposta"])); ?>" />
									<div class="input-icon"><i class="fa <?php echo $icona; ?>"></i></div>
								</div>
							</div>
							<?php }
						}
						$count=0;
						if($row_domanda["fk_tipo_domanda"]==4) {
							$testo_esercizio = $row_domanda["ese_num"];
							//echo "<br /><br />".$testo_esercizio;
							//echo "<br /><br />Posizione ora: ".strpos($testo_esercizio,"%%");
							while(strpos($testo_esercizio,"%%")!=0 && $count<10) {
								$count++;
								$sottostringa = substr($testo_esercizio,strpos($testo_esercizio,"%%"),strpos($testo_esercizio,"??")-strpos($testo_esercizio,"%%"));
								//echo "<br /><br />".$sottostringa;
								$primo_numero=intval(substr($sottostringa,2,strpos($sottostringa,",")));
								$secondo_numero=intval(substr($sottostringa,strpos($sottostringa,",")+1));
								//echo "<br /><br />".$primo_numero." ".$secondo_numero;
								$random = rand($primo_numero,$secondo_numero);
								$testo_esercizio=str_replace("$sottostringa??",number_format($random,0,",","."),$testo_esercizio);
								//echo "<br /><br />".$testo_esercizio;
								//echo "<br /><br />Posizione ora: ".strpos($testo_esercizio,"%%");
							}
							array_push($array_esercizi,$testo_esercizio);
							
							?>
							<div class='row_form'>
								<div class="input-group input-group-icon" style="width:100%">
									<textarea id="ese_num" name="ese_num" style="width:100%;height:150px" readonly><?php echo htmlspecialchars_decode(html_entity_decode($testo_esercizio)); ?></textarea>
								</div>
							</div>
							<?php 
						}
					} 
					$_SESSION["array_esercizi"]=$array_esercizi;
					?>
				</form>
			</div>
		</div>
 </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>
    <script src="../js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
<?php
	}
	catch(Exception $e) {
		echo "<div class=\"alert alert-danger\" role=\"alert\"><strong>Errore!</strong> Non sono state inserite abbastanza domande per uno dei tipi scelti all'interno del quiz!</div>";
	}
}
?>
