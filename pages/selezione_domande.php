<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	if(isset($_GET["id_quiz"])) {
		$id_quiz = $_GET["id_quiz"]; 
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

	
	<h3 style="text-align:center;">Selezione domande quiz: </h3>

	<script src="../js/nuovo_quiz.js" ></script>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		$id_materia_default=0;
		
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
			
				<form action="salva_domande_quiz.php?id_quiz=<?php echo $id_quiz; ?>" method="POST" id="form_quiz" style="padding:1em;">
					
					<div class='row_form'>
						
							<input type="submit" value="Salva" class="submit_salva" />
				
					</div>
				</form>
		
		</div>
 </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	<script type="text/javascript">argomento(1);</script>
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
}else{
?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	
	<h3 style="text-align:center;">Selezione domande</h3>
	
				<div class="col-md-12" >
								
					<div class="alert alert-danger" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					ERRORE NELLA SELEZIONE DEL QUIZ<br /><br /><a href="quiz.php" style="">BACK</a>
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
}
?>
