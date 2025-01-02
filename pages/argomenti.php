<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	$amministratore=false;
	$dataset = eseguiQuery("select count(1) as tot from ct_utenti_tipi where fk_utente=$id_utente and fk_tipo_utente=3");
	$row=$dataset->fetch_assoc();
	if($row["tot"]==1) $amministratore=true;
	
?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	<script src="../js/mod_argomenti.js" ></script>
	
	<h3 style="text-align:center;">Argomenti</h3>
	
	<div style="text-align:center;width:100%"><button class="btn btn-success" data-toggle='modal' data-target='#modifica_argomento' onclick='modifica_argomento(0)'>Inserisci nuovo argomento</button></div>
	
	 <div id="modifica_argomento" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">Modifica argomento</h4>
				  </div>
				  <div class="modal-body">
					<div id="mod_argomenti">

					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="update_argomento();">Salva</button>
				  </div>
				</div>
			  </div>
		  </div>
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$dataset=eseguiQuery("select * from ct_utenti_materie,ct_materie where fk_materia=id_materia and fk_utente=$id_utente");	
		while($row=$dataset->fetch_assoc()) {
		?>
		<div class="row" style="width:100%;margin:auto;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Argomenti materia <?php echo $row["nome_materia"]; ?></h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Ricerca</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Argomento" disabled></th>
							<th></th>
							<?php if($amministratore) { ?>
							<th></th>
							<?php } ?>
						</tr>
					</thead>
					<tbody>
						<?php
						$eo=0;
						$dataset2=eseguiQuery("select * from ct_argomenti where fk_materia=$row[id_materia] order by nome_argomento");
						while($row2=($dataset2->fetch_assoc())) {
						
							if($eo%2==0) $classe="even";
							else $classe="odd";
							echo "<tr class='$classe'>";
							echo "<td>$row2[nome_argomento]</td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-warning'  data-toggle='modal' data-target='#modifica_argomento' onclick='modifica_argomento($row2[id_argomento])'>Modifica</button></td>\n";
							if($amministratore) {
								echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='elimina_argomento($row2[id_argomento])'>Elimina</button></td>\n";						
							}
							echo "</tr>";
							$eo++;
							
						}
						
						?>
					</tbody>
				</table>
			</div>
		</div>
		<?php } ?>
	
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
