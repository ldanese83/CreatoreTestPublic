<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	
?>
<script src="../js/domande.js" ></script>
<script src="../ckeditor/ckeditor.js" ></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		$id_argomento=$_GET["id_argomento"];
		
		?>
	<h3 style="text-align:center;">Inserimento nuova domanda</h3>
	<div style="text-align:center;width:100%">
	<button class="btn btn-primary" onclick='window.location.href="domande_all.php?id_argomento=<?php echo $id_argomento; ?>";'>Indietro</button>
	</div>
	
		
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="salva_domanda.php" method="POST" id="form_domanda" style="padding:1em;">
					<div class='row_form'>
					<h4 class="row_form_h4">Domanda</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="Domanda" id="domanda" name="domanda" style="width:100%" required />
							<div class="input-icon"><i class="fa fa-question"></i></div>
							<input type='hidden' id='id_argomento' name="id_argomento" value='<?php echo $id_argomento; ?>' />
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Punti standard</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="number" placeholder="Punti" id="punti" name="punti" style="width:100%" step="0.1" required />
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Livello difficoltà</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="livello_diff" name="livello_diff" class="select_form_domande">
								<option value="1">Molto facile</option>
								<option value="2">Facile</option>
								<option value="3" selected>Normale</option>
								<option value="4">Difficile</option>
								<option value="5">Molto difficile</option>
							</select>
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Numero di gruppo (per domande casuali, non obbligatorio)</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="number" placeholder="Gruppo" id="num_gruppo" name="num_gruppo" style="width:100%" step="1" value="0" />
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Libro di riferimento</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="libro" name="libro" class="select_form_domande">
								<?php
									$dataset = eseguiQuery("select * from ct_libri_testo");	
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_libro_testo]'>$row[titolo_libro] - $row[autori] - $row[casa_editrice]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Tipo Domanda</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="tipo_domanda" name="tipo_domanda" class="select_form_domande" onchange="cambia_tipo();">
								<?php
									$dataset = eseguiQuery("select * from ct_tipi_domande");	
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_tipo_domanda]'>$row[tipo]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-archive"></i>
						</div>
					</div>
					<div id="opzioni_aggiuntive">
						<div class='row_form'>
						<h4 class="row_form_h4">Numero righe della risposta</h4>
							<div class="input-group input-group-icon" style="width:100%">
								<input type="number" placeholder="Numero righe" id="num_righe" name="num_righe" style="width:100%" />
								<div class="input-icon"><i class="fa fa-bars"></i></div>
							</div>
						</div>
					</div>
					<div id="risposte">
						<h4 class="row_form_h4">Risposte possibili</h4>
						<div class='row_form'>
							<div class="input-group input-group-icon" style="width:100%">
								<input type="text" placeholder="Risposta 1" id="risposta1" name="risposta[]" style="width:85%" />
								<div class="input-icon"><i class="fa fa-reply"></i></div>
								<div class="correct_response" id="correct_response1" onclick="change_corretta(1)">
									<span class="tooltiptext tooltip-bottom" id="span_correct1">Non corretta</span><i class="fa fa-check-square"></i>
									<input type="hidden" id="corretta1" name="corretta[]" value="no" />
								</div>
								<div class="add_response" onclick="add_row()"><i class="fa fa-plus"></i></div>
							</div>
						</div>
					</div>
					<div id="esercizio_numeri" style="display:none">
						<div class='row_form'>
						<h4 class="row_form_h4">Testo dell'esercizio</h4>
							<div class="input-group input-group-icon" style="width:100%">
								<textarea id="ese_num" name="ese_num" rows="30" cols="80">Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)</textarea>
								<script>
								CKEDITOR.replace( 'ese_num' );
								</script>
							</div>
						</div>
					</div>
					<div class='row_form'>
						<div class="input-group input-group-icon" style="width:10%;">
							<input type="submit" value="Salva" class="submit_salva" /><div class="input-icon"><i class="fa fa-save" style="color:black;"></i>
						</div>
					</div>
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
?>
