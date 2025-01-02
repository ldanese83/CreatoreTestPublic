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

	<script src="../js/mod_argomenti.js" ></script>
	
	<h3 style="text-align:center;">Griglie di Valutazione</h3>
	
	<div style="text-align:center;width:100%">
	<form action="mod_griglia.php"><button class="btn btn-success" >Inserisci nuova griglia di valutazione</button>
	</form>
	</div>
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$dataset=eseguiQuery("select * from ct_griglie_valutazione where attiva=1 and fk_utente=$id_utente");
		$eo=0;		
		
		?>
		<div class="row" style="width:100%;margin:auto;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Griglie di Valutazione</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Ricerca</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Nome Griglia" disabled></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						while($row=$dataset->fetch_assoc()) {
						if($eo%2==0) $classe="even";
						else $classe="odd";
						echo "<tr class='$classe'>";
						echo "<td>$row[nome_griglia]</td>\n";
						echo "<td style='text-align:right;'><form action=\"mod_griglia.php\"><input type=\"hidden\" name=\"id_griglia\" value=\"$row[id_griglia]\" />";
						echo "<button class='btn btn-warning'>Modifica</button></form></td>\n";
						echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='elimina_griglia($row[id_griglia])'>Elimina</button></td>\n";						
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
