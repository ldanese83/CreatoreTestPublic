<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	
?>
<script type="text/javascript">
var tipo=0;
function scelta(tipologia) {
	tipo=tipologia;
	if(tipologia==1) {
		document.getElementById("doc").className="btn btn-success";
		document.getElementById("csv").className="btn btn-info";
		document.getElementById("selezione").innerHTML="-> da altri docenti";
	}
	else {
		document.getElementById("csv").className="btn btn-success";
		document.getElementById("doc").className="btn btn-info";
		document.getElementById("selezione").innerHTML="-> da CSV";
	}
	
}
function redirect(id_argomento) {
	
	if(tipo==0) {
		
		alert("Non puoi procedere se non hai selezionato il tipo di importazione. Seleziona uno dei pulsanti ad inizio pagina!");
	
	}
	else if (tipo==1) {
		window.location.href = "import_domande_all.php?id_argomento="+id_argomento;
	}
	else {
		window.location.href = "import_from_csv.php?id_argomento="+id_argomento;
	}
	
}

</script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">
			<div class="jumbotron">
	<h3 style="text-align:center;">Seleziona se vuoi importare da altri docenti o da CSV</h3>
	<div style="text-align:center;width:100%">
	<button class="btn btn-info" id="doc" onclick='scelta(1)'>Da altri docenti</button>
	<button class="btn btn-info" id="csv" onclick='scelta(2)'>Da CSV</button>
	</div>
	</div>
	
	<h3 style="text-align:center;">Seleziona l'argomento <span id="selezione"></span></h3>
	
	
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
				<table class="table" >
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Argomento" disabled></th>
							<th></th>
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
							echo "<td style='text-align:right;'><button class='btn btn-primary' onclick='redirect($row2[id_argomento])'>Importa</button></td>\n";					
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
