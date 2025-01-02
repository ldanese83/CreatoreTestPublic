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

	
	<h3 style="text-align:center;">Creazione nuovo quiz</h3>
	
	<div style="text-align:center;width:100%">
	<button class="btn btn-primary" onclick='window.location.href="quiz.php";'>Indietro</button>
	</div>
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
		$id_materia_default=0;
		eseguiQuery("delete from ct_temporary_dom where fk_utente = $id_utente");
		
		?>
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="salva_quiz.php" method="POST" id="form_quiz" style="padding:1em;">
					<div class='row_form'>
					<h4 class="row_form_h4">Nome quiz</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="Nome" id="nome_quiz" name="nome_quiz" style="width:100%" />
							<div class="input-icon"><i class="fa fa-bars"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Materia del quiz</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="materia" name="materia" class="select_form_domande" onchange="change_argomenti();" >
								<?php
									$dataset = eseguiQuery("select * from ct_materie,ct_utenti_materie where id_materia=fk_materia and fk_utente=$id_utente");	
									$i=0;
									while($row=$dataset->fetch_assoc()) {
										if($i==0) $id_materia_default=$row["id_materia"];
										echo "<option value='$row[id_materia]'>".htmlspecialchars_decode(html_entity_decode($row["nome_materia"]))."</option>";
										$i++;
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div id="argomenti">
						<h4 class="row_form_h4">Argomenti</h4>
						<div class='row_form'>
							<div class="input-group input-group-icon" style="width:100%">
								<select id="argomento1" name="argomenti[]" class="select_form_domande" style="width:90%" onchange="argomento(1)">
									<?php
										$dataset = eseguiQuery("select * from ct_argomenti where fk_materia=$id_materia_default");	
										while($row=$dataset->fetch_assoc()) {
											echo "<option value='$row[id_argomento]'>$row[nome_argomento]</option>";											
										}
									?>
								</select><div class="input-icon"><i class="fa fa-book"></i></div>
								<div class="add_response" onclick="add_row_argomenti()"><i class="fa fa-plus"></i></div>
	
							</div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Mostra punti domande</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mostrapunti" name="mostrapunti" class="select_form_domande">
								<option value="1">SI</option>
								<option value="2">NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Domande mescolate</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mix_questions" name="mix_questions" class="select_form_domande">
								<option value="0">SI</option>
								<option value="1">NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Griglia valutazione</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="griglia" name="griglia" class="select_form_domande">
								<option value="0">NESSUNA</option>
								<?php
									$dataset = eseguiQuery("select * from ct_griglie_valutazione");	
									while($row=$dataset->fetch_assoc()) {
										echo "<option value='$row[id_griglia]'>$row[nome_griglia]</option>";
									}
								?>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Domande casuali</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="acaso" name="acaso" class="select_form_domande" onchange="change_casuale();">
								<option value="si">SI</option>
								<option value="no">NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<h4 class="row_form_h4">Risposte mescolate</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<select id="mix_answer" name="mix_answer" class="select_form_domande" onchange="change_casuale();">
								<option value="si">SI</option>
								<option value="no">NO</option>
							</select><div class="input-icon"><i class="fa fa-book"></i></div>
						</div>
					</div>
					<div id="opzioni_aggiuntive">
						<div class='row_form'>
						<h4 class="row_form_h4">Tipo Domande</h4>
							<div class="input-group input-group-icon" style="width:100%">
								<select onchange="mod_testo_num(0)" id="tipo_domande0" name="tipo_domande[]" class="select_form_domande" style="width:90%">
									<option value='0'>Qualsiasi</option>
									<?php
										$dataset = eseguiQuery("select * from ct_tipi_domande");	
										while($row=$dataset->fetch_assoc()) {
											echo "<option value='$row[id_tipo_domanda]'>$row[tipo]</option>";
										}
									?>
								</select><div class="input-icon"><i class="fa fa-book"></i></div>
								<div class="add_response" onclick="add_row_tipi()"><i class="fa fa-plus"></i></div>
							</div>
						</div>
						<div class='row_form'>
						<h4 class="row_form_h4">Numero domande <span id='testo_num_dom0'>Qualsiasi</span></h4>
							<div class="input-group input-group-icon" style="width:100%">
								<input type="number" placeholder="Numero domande" id="num_domande" name="num_domande[]" style="width:100%" />
								<div class="input-icon"><i class="fa fa-bars"></i></div>
							</div>
						</div>
					</div>
					<div id="domande" style="display:none">
						<h4 class="row_form_h4">Salva per passare alla selezione delle domande</h4>
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
}
?>
