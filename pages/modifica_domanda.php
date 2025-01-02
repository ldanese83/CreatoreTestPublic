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

	
	<h3 style="text-align:center;">Modifica domanda</h3>
	<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		$id_domanda=$_GET["id_domanda"];
		$dataset=eseguiQuery("select * from ct_domande where id_domanda='$id_domanda'");
		$row=$dataset->fetch_assoc();		
		
		?>
	<div style="text-align:center;width:100%">
		<button class="btn btn-primary" onclick='window.location.href="domande_all.php?id_argomento=<?php echo $row["fk_argomento"]; ?>";'>Indietro</button>
		
	</div>
	
	
		
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="update_domanda.php" method="POST" id="form_domanda" style="padding:1em;">
					<div class='row_form'>
					<h4 class="row_form_h4">Domanda</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="Domanda" id="domanda" name="domanda" style="width:100%" required value="<?php echo htmlspecialchars_decode(html_entity_decode($row["domanda"])); ?>" />
							<div class="input-icon"><i class="fa fa-question"></i></div>
							<input type='hidden' id='id_domanda' name="id_domanda" value='<?php echo $id_domanda; ?>' />
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Punti standard</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="number" placeholder="Punti" id="punti" name="punti" style="width:100%" step="0.1" required value="<?php echo $row["punti"]; ?>" />
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Livello difficoltà</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="livello_diff" name="livello_diff" class="select_form_domande">
								<option value="1" <?php if($row["livello_diff"]==1) echo "selected";?>>Molto facile</option>
								<option value="2" <?php if($row["livello_diff"]==2) echo "selected";?>>Facile</option>
								<option value="3" <?php if($row["livello_diff"]==3) echo "selected";?>>Normale</option>
								<option value="4" <?php if($row["livello_diff"]==4) echo "selected";?>>Difficile</option>
								<option value="5" <?php if($row["livello_diff"]==5) echo "selected";?>>Molto difficile</option>
							</select>
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Numero di gruppo (per domande casuali, non obbligatorio)</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="number" placeholder="Gruppo" id="num_gruppo" name="num_gruppo" style="width:100%" step="1" value="<?php echo $row["num_gruppo"]; ?>" />
							<div class="input-icon"><i class="fa fa-trophy"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Libro di riferimento</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="libro" name="libro" class="select_form_domande">
								<?php
									$dataset2 = eseguiQuery("select * from ct_libri_testo");	
									$selected ="";
									while($row2=$dataset2->fetch_assoc()) {
										if($row2["id_libro_testo"]==$row["fk_libro"]) $selected=" selected";
										else $selected="";
										echo "<option value='$row2[id_libro_testo]' $selected>$row2[titolo_libro] - $row2[autori] - $row2[casa_editrice]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Tipo Domanda</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="hidden" id="tipo_domanda" name="tipo_domanda" value="<?php echo $row["fk_tipo_domanda"]; ?>" />
							<select class="select_form_domande" disabled>
								<?php
									$dataset2 = eseguiQuery("select * from ct_tipi_domande");	
									$selected ="";
									while($row2=$dataset2->fetch_assoc()) {
										if($row2["id_tipo_domanda"]==$row["fk_tipo_domanda"]) $selected=" selected";
										else $selected="";
										echo "<option value='$row2[id_tipo_domanda]' $selected >$row2[tipo]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-archive"></i>
						</div>
					</div>
					<div id="opzioni_aggiuntive" 
						<?php if($row["fk_tipo_domanda"]==1) echo "style='display:block'"; 
						else echo "style='display:none'"; ?>>
						<div class='row_form'>
						<h4 class="row_form_h4">Numero righe della risposta</h4>
							<div class="input-group input-group-icon" style="width:100%">
								<input type="number" placeholder="Numero righe" id="num_righe" name="num_righe" style="width:100%" value="<?php echo $row["num_righe"]; ?>"/>
								<div class="input-icon"><i class="fa fa-bars"></i></div>
							</div>
						</div>
					</div>
					<div id="risposte" <?php if($row["fk_tipo_domanda"]==1 || $row["fk_tipo_domanda"]==4) echo "style='display:none'"; 
						else echo "style='display:block'"; ?>>
						<h4 class="row_form_h4">Risposte possibili</h4>
						<?php
						if($row["fk_tipo_domanda"]<>1) {
							$dataset_risp = eseguiQuery("select * from ct_risposte where fk_domanda = $row[id_domanda]");
							$i=0;
							while($row_risp = $dataset_risp->fetch_assoc()) { 
								$i++; ?>
								<div class='row_form' id="riga_risposta<?php echo $i; ?>">
									<div class="input-group input-group-icon" style="width:100%">
										<input type="text" id="risposta<?php echo $i; ?>" placeholder="Risposta <?php echo $i; ?>"  name="risposta[]" 
										value="<?php echo htmlspecialchars_decode(html_entity_decode($row_risp["risposta"])); ?>" style="width:85%" />
										<div class="input-icon"><i class="fa fa-reply"></i></div>
										<div class="<?php if($row_risp["corretta"]==0) echo "correct_response"; else echo "correct_response_checked"; ?>" id="correct_response<?php echo $i; ?>" onclick="change_corretta(<?php echo $i; ?>)">
											<?php if($row_risp["corretta"]==0) { ?>
											<span class="tooltiptext tooltip-bottom" id="span_correct<?php echo $i; ?>">Non corretta</span><i class="fa fa-check-square"></i>
											<input type="hidden" id="corretta<?php echo $i; ?>" name="corretta[]" value="no" />
											<?php } else {?>
											<span class="tooltiptext tooltip-bottom" id="span_correct<?php echo $i; ?>">Corretta</span><i class="fa fa-check-square"></i>
											<input type="hidden" id="corretta<?php echo $i; ?>" name="corretta[]" value="si" />
											<?php } ?>	
										</div>
										<?php if($i==1) { ?>
										<div class="add_response" onclick="add_row()"><i class="fa fa-plus"></i></div>
										<?php } else {?>
										<div class="remove_response" id="remove_response<?php echo $i; ?>" onclick="remove_row(<?php echo $i; ?>);"><i class="fa fa-minus"></i></div>
										<?php } ?>	
									</div>
								</div>
							<?php } 
						}?>
						</div>
					<div id="esercizio_numeri" <?php if($row["fk_tipo_domanda"]!=4) echo "style='display:none'"; 
						else echo "style='display:block'"; ?>>
					<div class='row_form'>
					<h4 class="row_form_h4">Testo dell'esercizio</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<textarea id="ese_num" name="ese_num" rows="30" cols="80"><?php echo htmlspecialchars_decode(html_entity_decode($row["ese_num"])); ?></textarea>
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
