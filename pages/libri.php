<?php
@include("header.php");

if(!isset($user)) {}
else {
	
$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
$row=$dataset->fetch_assoc();
$id_utente = $row["id_utente"];
	
?>

<script src="../js/mod_libri.js" ></script>
        <div id="page-wrapper">
            
			<br />
			
			<div class="jumbotron text-center" style="background-color:#fcba03;color:#ffffff;">
			
				<h3>Creatore Test</h3>
				
				
			</div>
			
			<div id="modifica_libro" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">Modifica Libro</h4>
				  </div>
				  <div class="modal-body">
					<div id="mod_libro">

					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="update_libro();">Salva</button>
				  </div>
				</div>
			  </div>
		  </div>
			<div style="text-align:center;width:100%;margin-top:1em;margin-bottom:1em;"><button class="btn btn-success" data-toggle='modal' data-target='#modifica_libro' onclick='modifica_libro(0)'>Inserisci nuovo libro</button></div>
			<div class="row">
				<div class="panel panel-primary">
					<div class="panel-heading" style="text-align:center;">
						<h3 class="panel-title">Buongiorno <?php echo $user; ?>, libri disponibili</h3>
					</div>
					
					<table class="table">
						<thead>
							<tr class="filters">
								<th style="text-align:center">Libro</th>
								<th style="text-align:center">Casa editrice</th>
								<th style="text-align:center">Autori</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<?php
							$eo=0;
							$dataset = eseguiQuery("select * from ct_libri_testo order by disattivato,titolo_libro");	
							while($row=$dataset->fetch_assoc()) {
							
								if($eo%2==0) $classe="even";
								else $classe="odd";
								if($row["disattivato"]==1) $classe="red";
								echo "<tr class='$classe' style='text-align:center;vertical-align:middle'>";
								echo "<td>$row[titolo_libro]</td>\n";
								echo "<td>$row[casa_editrice]</td>\n";
								echo "<td>$row[autori]</td>\n";
								echo "<td style='text-align:right;'><button class='btn btn-primary'  data-toggle='modal' data-target='#modifica_libro' onclick='modifica_libro($row[id_libro_testo])'>Modifica</button></td>\n";
								echo "<td><a class='btn btn-warning'  href='disattiva_libro.php?id_libro=$row[id_libro_testo]'";
								echo " onclick='return confirm(\"Sei sicuro di voler disattivare il libro $row[titolo_libro]?\")'>Disattiva</a></td>\n"; 
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