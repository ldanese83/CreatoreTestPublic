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
	<script src="../js/nuovo_quiz.js" ></script>
	
	<h3 style="text-align:center;">I tuoi quiz</h3>
	
	<div style="text-align:center;width:100%"><button class="btn btn-success" onclick='window.location.href = "nuovo_quiz.php";'>Crea nuovo quiz</button></div>
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$dataset=eseguiQuery("select * from ct_quiz,ct_materie where fk_materia=id_materia and fk_utente=$id_utente");	
		?>
		<div class="row" style="width:100%;margin:auto;">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Quiz creati</h3>
					<div class="pull-right">
						<button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Ricerca</button>
					</div>
				</div>
				<table class="table" >
					<thead>
						<tr class="filters">
						   <th><input type="text" class="form-control" placeholder="Nome Quiz" disabled></th>
							<th><input type="text" class="form-control" placeholder="Numero di domande" disabled></th>
							<th><input type="text" class="form-control" placeholder="Materia" disabled></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$eo=0;
						
						while($row=($dataset->fetch_assoc())) {
							if($row["casuale"]==1)
								$dataset2=eseguiQuery("select sum(num_domande) as tot from ct_quiz_tipo_domande where fk_quiz=$row[id_quiz]");
							else
								$dataset2=eseguiQuery("select count(fk_domanda) as tot from ct_quiz_domande where fk_quiz=$row[id_quiz]");
							$row2=($dataset2->fetch_assoc());
							$num_domande=$row2["tot"];
						
							if($eo%2==0) $classe="even";
							else $classe="odd";
							echo "<tr class='$classe'>";
							echo "<td>$row[nome_quiz]</td>\n";
							echo "<td>$num_domande</td>\n";
							echo "<td>$row[nome_materia]</td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-primary' onclick='window.location.href = \"genera_quiz.php?id_quiz=$row[id_quiz]\";'>Genera</button></td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-warning' onclick='window.location.href = \"view_quiz.php?id_quiz=$row[id_quiz]\";'>Modifica</button></td>\n";
							echo "<td style='text-align:right;'><button class='btn btn-danger' onclick='delete_quiz($row[id_quiz]);'>Elimina</button></td>\n";								
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
