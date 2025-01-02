<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	
?>
<script src="../js/gestione_domande.js" ></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">
		<?php
		$id_argomento=$_GET["id_argomento"];
		$dataset=eseguiQuery("select * from ct_materie, ct_argomenti where fk_materia=id_materia and id_argomento=$id_argomento");	
		$row=$dataset->fetch_assoc();
		$argomento = $row["nome_argomento"];
		$materia=$row["nome_materia"];
		
		?>
	
		<h3 style="text-align:center;margin-bottom:1.6em;"><strong style="display:block;width:100%;margin:auto;padding:10px 30px;background-color:#a8caff;border:solid 1px black;border-radius:10px;box-shadow: -5px 6px 10px #888888;">
		<?php echo $materia." - ".$argomento."</strong></h3>";	
	

		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		?>
		<div id="vedi_risp" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">Risposte: </h4>
				  </div>
				  <div class="modal-body">
					<table class="table" id="risp">

					</table>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
				</div>
			  </div>
		  </div>

		<div style="text-align:center;width:100%">
			<button class="btn btn-primary" onclick='window.location.href="import.php";'>Indietro</button>
		</div>
		
		<div class="row" style="width:100%;margin:auto;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Possibili import</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Ricerca</button>
					</div>
				</div>
				<table class="table" >
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Domanda" disabled></th>
						   <th><input type="text" class="form-control" placeholder="Tipo domanda" disabled></th>
						   <th><input type="text" class="form-control" placeholder="Riferimento libro" disabled></th>
						   <th></th>
						   <th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$eo=0;
						$dataset=eseguiQuery("select * from ct_domande,ct_tipi_domande,ct_libri_testo where fk_libro=id_libro_testo and fk_argomento=$id_argomento and fk_tipo_domanda=id_tipo_domanda and id_domanda not in (select fk_domanda from ct_utente_domande where fk_utente=$id_utente)");							
						while($row2=($dataset->fetch_assoc())) {
						
							if($eo%2==0) $classe="even";
							else $classe="odd";
							echo "<tr class='$classe'>";
							echo "<td>".htmlspecialchars_decode(html_entity_decode($row2["domanda"]))."</td>\n";
							echo "<td>$row2[tipo]</td>\n";
							echo "<td>$row2[titolo_libro] - $row2[autori] - $row2[casa_editrice]</td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-info' onclick='importa_domanda($row2[id_domanda]);'>Importa</button></td>\n";
							if($row2["fk_tipo_domanda"]==2 or $row2["fk_tipo_domanda"]==3)
								echo "<td style='text-align:right;'><button class='btn btn-primary'  data-toggle='modal' data-target='#vedi_risp' onclick='add_risposte($row2[id_domanda])'>Vedi risposte</button></td>\n";
							else echo "<td></td>";
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
