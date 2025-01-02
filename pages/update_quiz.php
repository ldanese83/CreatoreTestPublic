<?php
@include("header.php");
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

	
	<h3 style="text-align:center;">Salvataggio modifiche quiz</h3>
	<script src="../js/nuovo_quiz.js" ></script>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$id_quiz=$_POST["id_quiz"];
		
		$nome_quiz = htmlentities(htmlspecialchars($_POST["nome_quiz"],ENT_QUOTES));
		
		$argomenti="";
		if(isset($_POST["argomenti"])) $argomenti = $_POST["argomenti"];
		
		$mostrapunti=1;
		if(isset($_POST["mostrapunti"])) $mostrapunti = $_POST["mostrapunti"];
		
		$casuale = $_POST["acaso"];
		$mix_answer = $_POST["mix_answer"];
		$mix_questions = $_POST["mix_questions"];
		$mix=0;
		if($mix_answer=="si") $mix=1;
		//$casuale=0;
		//if($acaso=="si") $casuale=1;
		
		if(isset($_POST["num_domande"])) $num_domande = $_POST["num_domande"];
		
		if(isset($_POST["tipo_domande"])) $tipo_domande = $_POST["tipo_domande"];
		
		$domande="";
		if(isset($_POST["domande"])) $domande = $_POST["domande"];
		
		$griglia=0;
		if(isset($_POST["griglia"])) $griglia = $_POST["griglia"];
		
		$query = "update ct_quiz set nome_quiz='$nome_quiz',mostra_punti_dom=$mostrapunti,casuale=$casuale,fk_griglia=$griglia,mix_answer=$mix, mix_questions=$mix_questions";
		$query.= " where id_quiz=$id_quiz";
		
		eseguiQuery($query);
		
		//echo $query;
		eseguiQuery("delete from ct_quiz_argomenti where fk_quiz=$id_quiz");
		for($i=0;$i<sizeof($argomenti);$i++) {
			
			$query_risp = "INSERT INTO ct_quiz_argomenti(fk_quiz,fk_argomento) VALUES(";
			$query_risp.= "$id_quiz,$argomenti[$i])";
			
			eseguiQuery($query_risp);
			
			//echo "<br /><br />".$query_risp;
			
		}
		
		if($casuale==1) {
			//echo $query;
			eseguiQuery("delete from ct_quiz_tipo_domande where fk_quiz=$id_quiz");
			for($i=0;$i<sizeof($tipo_domande);$i++) {
				
				$query_risp = "INSERT INTO ct_quiz_tipo_domande(fk_quiz,fk_tipo_domande,num_domande) VALUES(";
				$query_risp.= "$id_quiz,$tipo_domande[$i],$num_domande[$i])";
				
				eseguiQuery($query_risp);
				
				//echo "<br /><br />".$query_risp;
				
			}
		}
		else {
			
			$dataset_arg = eseguiQuery("select fk_argomento from ct_quiz_argomenti where fk_quiz=$id_quiz");
			
			
		
		?>
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<table class="table" >
			<thead>
				<tr class="filters">
				   <th><input type="text" class="form-control" placeholder="Domanda" disabled></th>
				   <th><input type="text" class="form-control" placeholder="Tipo domanda" disabled></th>
					<th><input type="text" class="form-control" placeholder="Argomento" disabled></th>
				   <th></th>
				</tr>
			</thead>
			<tbody id="body_dom">
			
			
			<?php
			$counter=0;

			while($row_arg=$dataset_arg->fetch_assoc()) {
				$id_argomento = $row_arg["fk_argomento"];

				$dataset=eseguiQuery("select * from ct_domande,ct_tipi_domande,ct_argomenti where fk_argomento=id_argomento and fk_argomento=$id_argomento and fk_tipo_domanda=id_tipo_domanda order by ct_domande.fk_tipo_domanda,ct_domande.id_domanda");	
				
				$eo=0;
				while($row2=($dataset->fetch_assoc())) {

					if($eo%2==0) $classe="even";
					else $classe="odd";
					
					$dataset3=eseguiQuery("select count(*) as tot from ct_temporary_dom where fk_utente=$id_utente and fk_domanda=$row2[id_domanda]");	
					$row3=$dataset3->fetch_assoc();
					if($row3["tot"]!=0) {
						$classe="green";
					}
					$aggiunta="";
					if($row2["id_tipo_domanda"]!=1) {
						$aggiunta="style='cursor:help;' onclick='show_responses($row2[id_domanda],$counter)'";
					}
					echo "<tr class='$classe'>";
					echo "<td $aggiunta>".htmlspecialchars_decode(html_entity_decode($row2["domanda"]))."</td>\n";
					echo "<td>$row2[tipo]</td>\n";
					echo "<td>$row2[nome_argomento]</td>\n";
					if($classe!="green")
						echo "<td style='text-align:right;'><button class='btn btn-success' onclick='aggiungi_domanda($row2[id_domanda],$id_utente)'>Aggiungi</button></td>\n";
					else
						echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='rimuovi_domanda($row2[id_domanda],$id_utente)'>Rimuovi</button></td>\n";		
					echo "</tr>";
					echo "<tr style='width:100%'><td id='response$counter' colspan='4' style='display:none;'></td></tr>";
					$counter++;
					$eo++;
					
				}
			}
			
			?>
			
			</tbody>
			</table>
		<?php }
		if($casuale!=1) {
		?>
				<form action="salva_domande_quiz.php?id_quiz=<?php echo $id_quiz; ?>&modifica=si" method="POST" id="form_quiz" style="padding:1em;">
					
					<div class='row_form'>
						
							<input type="submit" value="Salva domande" class="submit_salva" />
				
					</div>
				</form>
		<?php } ?>
		<div class="col-md-12" >
						
			<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
			DETTAGLI QUIZ MODIFICATI CORRETTAMENTE <br /><br /><a href="quiz.php" style="">BACK TO QUIZ</a>
			</div>
		
		</div>
		
		
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
