<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	$id_quiz=$_GET["id_quiz"];
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

	
	<h3 style="text-align:center;">Modifica quiz</h3>
	<div id="sel_domande" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">Selezione domande</h4>
				  </div>
				  <div class="modal-body">
					<div id="s_domande">
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
						</tbody>
						</table>
					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
				</div>
			  </div>
		  </div>
	<script src="../js/nuovo_quiz.js" ></script>
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		eseguiQuery("delete from ct_temporary_dom where fk_utente = $id_utente");
		$dataset_quiz=eseguiQuery("select * from ct_quiz where id_quiz=$id_quiz");
		$row_quiz = $dataset_quiz->fetch_assoc();
		?>
		<div style="text-align:center;width:100%">
			<button class="btn btn-primary" onclick='window.location.href="quiz.php";'>Indietro</button>
		</div>
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="update_quiz.php" method="POST" id="form_quiz" style="padding:1em;">
					<input type="hidden" value="<?php echo $id_quiz; ?>" id="id_quiz" name="id_quiz" />
					<div class='row_form'>
					<h4 class="row_form_h4">Nome quiz</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="" id="nome_quiz" name="nome_quiz" value="<?php echo $row_quiz["nome_quiz"];?>" style="width:100%" />
							<div class="input-icon"><i class="fa fa-bars"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Materia del quiz</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="materia" name="materia" class="select_form_domande" disabled >
								<?php
									$dataset = eseguiQuery("select * from ct_materie where id_materia=$row_quiz[fk_materia]");	
									$id_materia = $row_quiz["fk_materia"];
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_materia]' $selected >$row[nome_materia]</option>";
										
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<?php 
					$dataset_arg = eseguiQuery("select * from ct_quiz_argomenti where fk_quiz = $id_quiz");	
					$w=0;
					?>
					<div id="argomenti">
						<h4 class="row_form_h4">Argomenti</h4>
						<?php
						while($row_arg=$dataset_arg->fetch_assoc()) {
							if($w==0) {
								?>
								<div class='row_form'>
								<script type="text/javascript">add_argomenti_selezionati(<?php echo $row_arg["fk_argomento"]; ?>)</script>
									<div class="input-group input-group-icon" style="width:100%">
										<select id="argomento1" name="argomenti[]" class="select_form_domande" style="width:90%">
											<?php
												$dataset = eseguiQuery("select * from ct_argomenti where fk_materia=$id_materia");	
												while($row=$dataset->fetch_assoc()) {
													echo "<option value='$row[id_argomento]'";
													if($row_arg["fk_argomento"]==$row["id_argomento"]) echo " selected";
													echo ">$row[nome_argomento]</option>";											
												}
											?>
										</select><div class="input-icon"><i class="fa fa-book"></i></div>
										<div class="add_response" onclick="add_row_argomenti()"><i class="fa fa-plus"></i></div>
			
									</div>
								</div>
								<?php
								$w++;
							}
							else {?>
								<div class='row_form' id="row_argomento<?php echo $w; ?>">
								<script type="text/javascript">add_argomenti_selezionati(<?php echo $row_arg["fk_argomento"]; ?>)</script>
								<div class="input-group input-group-icon" style="width:100%">
								<select id="argomento<?php echo $w; ?>" name="argomenti[]" class="select_form_domande" style="width:90%">
								<?php
									$dataset = eseguiQuery("select * from ct_argomenti where fk_materia=$id_materia");	
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_argomento]'";
										if($row_arg["fk_argomento"]==$row["id_argomento"]) echo " selected";
										echo ">$row[nome_argomento]</option>";											
									}
								?>
								</select>
								<div class="input-icon"><i class="fa fa-book"></i></div>
								<div class="remove_response" id="remove_response<?php echo $w; ?>" onclick='remove_row_argomenti(<?php echo $w; ?>);'>
								<i class="fa fa-minus"></i></div></div></div>
								<?php
								$w++;
							}
						}
						?>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Mostra punti domande</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mostrapunti" name="mostrapunti" class="select_form_domande">
								<option value="1" <?php if($row_quiz["mostra_punti_dom"]==1) echo "selected"; ?>>SI</option>
								<option value="2" <?php if($row_quiz["mostra_punti_dom"]==2) echo "selected"; ?>>NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Domande mescolate</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mix_questions" name="mix_questions" class="select_form_domande">
								<option value="0" <?php if($row_quiz["mix_questions"]==0) echo "selected"; ?>>SI</option>
								<option value="1" <?php if($row_quiz["mix_questions"]==1) echo "selected"; ?>>NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Griglia valutazione</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="griglia" name="griglia" class="select_form_domande">
								<option value="0" <?php if($row_quiz["fk_griglia"]==0) echo "selected"; ?>>NESSUNA</option>
								<?php
									$dataset = eseguiQuery("select * from ct_griglie_valutazione");	
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_griglia]' ";
										if($row_quiz["fk_griglia"]==$row["id_griglia"]) echo "selected"; 
										echo ">$row[nome_griglia]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Domande casuali</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="hidden" name="acaso" value="<?php echo $row_quiz["casuale"]; ?>" />
							<select id="acaso" class="select_form_domande" onchange="change_casuale();" disabled>
								<?php
								if($row_quiz["casuale"]==1) {?>
								<option value="si" selected>SI</option>
								<option value="no">NO</option>
								<?php }
								else {?>
								<option value="si">SI</option>
								<option value="no" selected>NO</option>
								<?php } ?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Risposte mescolate</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mix_answer" name="mix_answer" class="select_form_domande" onchange="change_casuale();">
								<?php
								if($row_quiz["mix_answer"]==1) {?>
								<option value="si" selected>SI</option>
								<option value="no">NO</option>
								<?php }
								else {?>
								<option value="si">SI</option>
								<option value="no" selected>NO</option>
								<?php } ?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<?php 
					if($row_quiz["casuale"]==1) {
					$dataset_dom = eseguiQuery("select * from ct_quiz_tipo_domande where fk_quiz = $id_quiz order by fk_tipo_domande asc");	
					?>
					<div id="opzioni_aggiuntive">
						<?php 
						$k=0;
						while($row_dom=$dataset_dom->fetch_assoc()) {
							if($k==0) {
							?>
							<div class='row_form'>
							<h4 class="row_form_h4">Tipo Domande</h4>
								<div class="input-group input-group-icon" style="width:100%">
									<select onchange="mod_testo_num(0)" id="tipo_domande0" name="tipo_domande[]" class="select_form_domande" style="width:90%">
										<option value='0' <?php if($row_dom["fk_tipo_domande"]==0) echo "selected"; ?>>Qualsiasi</option>
										<?php
											$tipo="qualsiasi";
											$dataset = eseguiQuery("select * from ct_tipi_domande");	
											while($row=$dataset->fetch_assoc()) {
												echo "<option value='$row[id_tipo_domanda]' ";
												if($row_dom["fk_tipo_domande"]==$row["id_tipo_domanda"]) {
													echo "selected";
													$tipo = $row["tipo"];
												}
												echo ">$row[tipo]</option>";
											}
										?>
									</select><div class="input-icon"><i class="fa fa-book"></i></div>
									<div class="add_response" onclick="add_row_tipi()"><i class="fa fa-plus"></i></div>
								</div>
							</div>
							<div class='row_form'>
							<h4 class="row_form_h4">Numero domande <span id='testo_num_dom0'><?php echo $tipo;?></span></h4>
								<div class="input-group input-group-icon" style="width:100%">
									<input type="number" placeholder="Numero domande" id="num_domande0" name="num_domande[]" style="width:100%" value = "<?php echo $row_dom["num_domande"]; ?>" />
									<div class="input-icon"><i class="fa fa-bars"></i></div>
								</div>
							</div>
						<?php 
								$k++;
							}
							else {
								?>
								<div class='row_form' id="row_tipi<?php echo $k; ?>">
								<h4 class="row_form_h4">Tipo domande</h4>
									<div class="input-group input-group-icon" style="width:100%">
										<select onchange="mod_testo_num(<?php echo $k; ?>)" id="tipo_domande<?php echo $k; ?>" name="tipo_domande[]" class="select_form_domande" style="width:90%">
											<?php
												$tipo="risposta aperta";
												$dataset = eseguiQuery("select * from ct_tipi_domande");	
												while($row=$dataset->fetch_assoc()) {
													echo "<option value='$row[id_tipo_domanda]' ";
													if($row_dom["fk_tipo_domande"]==$row["id_tipo_domanda"]) {
														echo "selected";
														$tipo = $row["tipo"];
													}
													echo ">$row[tipo]</option>";
												}
											?>
										</select><div class="input-icon"><i class="fa fa-book"></i></div>
										<div class="remove_response" id="remove_tipo<?php echo $k; ?>" onclick='remove_row_tipi(<?php echo $k; ?>);'><i class="fa fa-minus"></i></div></div>
								</div>
								<div class='row_form' id="row_numero<?php echo $k; ?>">
								<h4 class="row_form_h4" >Numero domande <span id='testo_num_dom<?php echo $k; ?>'><?php echo $tipo;?></span></h4>
									<div class="input-group input-group-icon" style="width:100%">
										<input type="number" placeholder="Numero domande" id="num_domande<?php echo $k; ?>" name="num_domande[]" style="width:100%" value = "<?php echo $row_dom["num_domande"]; ?>" />
										<div class="input-icon"><i class="fa fa-bars"></i></div>
									</div>
								</div>
								<?php
								$k++;
							}
						} 
						?>
					</div>
					<?php } else { 
					$dataset12 = eseguiQuery("select * from ct_quiz_domande where fk_quiz=$id_quiz");
					while($row12 = $dataset12->fetch_assoc()) {
						eseguiQuery("insert into ct_temporary_dom(fk_utente,fk_domanda) values($id_utente,$row12[fk_domanda])");	
					}
							
					?>

					<div id="domande" style="">
						<h4 class="row_form_h4">Salva per passare alla selezione delle domande</h4>
					</div>
					<?php } ?>
					
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
