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

	<script src="../js/mod_classi.js" ></script>
	
	<h3 style="text-align:center;">Le mie classi</h3>
	
	<div style="text-align:center;width:100%"><button class="btn btn-success" data-toggle='modal' data-target='#modifica_classe' onclick='modifica_classe(0)'>Inserisci nuova classe</button></div>
	
	 <div id="modifica_classe" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">Modifica classe</h4>
				  </div>
				  <div class="modal-body">
					<div id="mod_classi">

					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="update_classe();">Salva</button>
				  </div>
				</div>
			  </div>
		  </div>
	
		<?php
		$params = [
			["value" => $user]
		];
		$row=eseguiQueryPrepareOne("select * from ct_utenti where username=?",$params);	
		
		$id_utente = $row["id_utente"];
		
		$params = [
			["value" => $id_utente]
		];
		$dataset=eseguiQueryPrepareMany("select ct_classi.*,ct_anni_scolastici.* from ct_utenti_classi,ct_classi,ct_anni_scolastici where id_anno=fk_anno_scolastico and fk_classe=id_classe and fk_utente=?",$params);	
		
		?>
		<div class="row" style="width:100%;margin:auto;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Classi create:</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Ricerca</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Nome classe" disabled></th>
							<th><input type="text" class="form-control" placeholder="Anno scolastico" disabled></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$eo=0;
						foreach($dataset as $row) {
						
							if($eo%2==0) $classe="even";
							else $classe="odd";
							echo "<tr class='$classe'>";
							echo "<td>$row[nome_classe]</td>\n";
							echo "<td>$row[anno_scolastico]</td>\n";
							echo "<td style='text-align:right;'><a class='btn btn-info' href='./Rewarding/accesso_docente.php?id_classe=$row[id_classe]'>Accedi</a></td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-warning'  data-toggle='modal' data-target='#modifica_classe' onclick='modifica_classe($row[id_classe])'>Modifica</button></td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='elimina_classe($row[id_classe],\"$row[nome_classe]\");'>Elimina</button></td>\n";		
							echo "</tr>";
							$eo++;
							
						}
						
						?>
					</tbody>
				</table>
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
