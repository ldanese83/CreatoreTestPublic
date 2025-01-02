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

	
	<h3 style="text-align:center;">Salvataggio Griglia di Valutazione</h3>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$nome_griglia = htmlentities(htmlspecialchars($_POST["nome_griglia"],ENT_QUOTES));
		$id_griglia = $_POST["id_griglia"];
		$griglia = htmlentities(htmlspecialchars($_POST["griglia"],ENT_QUOTES));
		
		if($id_griglia==0) {
		
			$query = "INSERT INTO ct_griglie_valutazione(nome_griglia,griglia, fk_utente) VALUES('$nome_griglia','$griglia',";
			$query.= "$id_utente)";
			eseguiInsert($query);
			
			//echo $query;
		
		}
		else {
			$query = "UPDATE ct_griglie_valutazione SET nome_griglia='$nome_griglia',griglia='$griglia' WHERE id_griglia=$id_griglia";
			eseguiQuery($query);
		}
		
				
		//echo "<br /><br />".$query_risp;
		?>
		<div class="col-md-12" >
						
			<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
			GRIGLIA SALVATA CORRETTAMENTE <br /><br /><a href="griglie.php" style="">BACK</a>
			</div>
		
		</div>
		
		
		
        <!-- /#page-wrapper -->
		</div>
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
