<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	
?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	
	<h3 style="text-align:center;">Salvataggio quiz</h3>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$nome_quiz = htmlentities(htmlspecialchars($_POST["nome_quiz"],ENT_QUOTES));
		$id_materia = $_POST["materia"];
		
		$argomenti="";
		if(isset($_POST["argomenti"])) $argomenti = $_POST["argomenti"];
		
		$tipo_domande="";
		if(isset($_POST["tipo_domande"])) $tipo_domande = $_POST["tipo_domande"];
		
		$num_domande="";
		if(isset($_POST["num_domande"])) $num_domande = $_POST["num_domande"];
		
		$mostrapunti=1;
		if(isset($_POST["mostrapunti"])) $mostrapunti = $_POST["mostrapunti"];
		
		$griglia=0;
		if(isset($_POST["griglia"])) $griglia = $_POST["griglia"];
		
		$acaso = $_POST["acaso"];
		$mix_answer = $_POST["mix_answer"];
		$mix_questions = $_POST["mix_questions"];
		$mix=0;
		if($mix_answer=="si") $mix=1;
		$casuale=0;
		if($acaso=="si") $casuale=1;
		
		$domande="";
		if(isset($_POST["domande"])) $domande = $_POST["domande"];
		
		$query = "INSERT INTO ct_quiz(nome_quiz, fk_utente, data_creazione, casuale, mix_answer,fk_materia,mostra_punti_dom,fk_griglia,mix_questions) VALUES('$nome_quiz',";
		$query.= "$id_utente,'".Date("Y-m-d")."',$casuale,$mix,$id_materia,$mostrapunti,$griglia,$mix_questions)";
		
		//echo $query;
		
		$id_quiz = eseguiInsert($query);
				
		for($i=0;$i<sizeof($argomenti);$i++) {
			
			$query_risp = "INSERT INTO ct_quiz_argomenti(fk_quiz,fk_argomento) VALUES(";
			$query_risp.= "$id_quiz,$argomenti[$i])";
			
			eseguiQuery($query_risp);
			
			//echo "<br /><br />".$query_risp;
			
		}
		
		if($casuale==1) {
		
			for($i=0;$i<sizeof($tipo_domande);$i++) {
				
				$query_risp = "INSERT INTO ct_quiz_tipo_domande(fk_quiz,fk_tipo_domande,num_domande) VALUES(";
				$query_risp.= "$id_quiz,$tipo_domande[$i],$num_domande[$i])";
				
				eseguiQuery($query_risp);
				
				//echo "<br /><br />".$query_risp;
				
			}
			?>
				<div class="col-md-12" >
								
					<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					QUIZ SALVATO CORRETTAMENTE <br /><br /><a href="quiz.php" style="">BACK</a>
					</div>
				
				</div>
			<?php
		}
		
		
		else {
			
			?>
			
			<div id="domande">
				<div class='row_form'>
					<div style="text-align:center;width:100%;margin-top:1em;margin-bottom:1em;"><a class="btn btn-primary" href="selezione_domande.php?id_quiz=<?php echo $id_quiz; ?>" style="width:80%">Seleziona Domande</a></div>
				</div>
			</div>
			<div class="col-md-12" >
								
					<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					QUIZ SALVATO CORRETTAMENTE
					</div>
				
				</div>
			
			<?php
		
		}
			
		
		?>
		
		
		
        <!-- /#page-wrapper -->
		</div>
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
?>
