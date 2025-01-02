<?php
@include("header.php");

if(!isset($user)) {}
else {
	
$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
$row=$dataset->fetch_assoc();
$id_utente = $row["id_utente"];
	
?>
        <div id="page-wrapper">
            
			<br />
			
			<div class="jumbotron text-center" style="background-color:#fcba03;color:#ffffff;">
			
				<h3>Creatore Test</h3>
				
				
			</div>
			
			<div class="row">
				<div class="panel panel-primary">
					<div class="panel-heading" style="text-align:center;">
						<h3 class="panel-title">Buongiorno <?php echo $user; ?>, le tue materie</h3>
					</div>
					<table class="table">
						<thead>
							<tr class="filters">
								<th><input type="text" class="form-control" placeholder="Materia" disabled></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<?php
							$eo=0;
							$dataset=eseguiQuery("select * from ct_utenti_materie,ct_utenti,ct_materie where fk_utente=$id_utente and fk_materia=id_materia and fk_utente=id_utente");
							while($row=$dataset->fetch_assoc()) {
							
								if($eo%2==0) $classe="even";
								else $classe="odd";
								echo "<tr class='$classe' style='text-align:center;vertical-align:middle'>";
								echo "<td>$row[nome_materia]</td>\n";
								echo "<td><a class='btn btn-danger'  href='disassegna_materia.php?id_materia=$row[id_materia]&id_utente=$row[id_utente]'";
								echo " onclick='return confirm(\"Sei sicuro di voler disassegnare la materia $row[nome_materia]?\")'>Disassegna</a></td>\n"; 
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
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="./bower_components/raphael/raphael-min.js"></script>
    <script src="./bower_components/morrisjs/morris.min.js"></script>
    <script src="./js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./dist/js/sb-admin-2.js"></script>

</body>

</html>
<?php
	}
?>