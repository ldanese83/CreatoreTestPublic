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

	
	<h3 style="text-align:center;">Salvataggio quiz</h3>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		if(isset($_GET["id_quiz"])) {
			$id_quiz=$_GET["id_quiz"];
			if(isset($_GET["modifica"])) {
				if($_GET["modifica"]=="si") {
					eseguiQuery("delete from ct_quiz_domande where fk_quiz=$id_quiz");
				}
			}
			//salvataggio domande 
			$dataset = eseguiQuery("select * from ct_temporary_dom where fk_utente = $id_utente");
			while($row = $dataset->fetch_assoc()) {
				eseguiQuery("insert into ct_quiz_domande(fk_quiz,fk_domanda) values($id_quiz,$row[fk_domanda])");	
			}
			eseguiQuery("delete from ct_temporary_dom where fk_utente = $id_utente");
		
		?>
		<div class="col-md-12" >
						
			<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
			DOMANDE DEL QUIZ SALVATE CORRETTAMENTE <br /><br /><a href="quiz.php" style="">BACK</a>
			</div>
		
		</div>
		<?php
		
		}
		else {
			
			?>
			
			<div class="col-md-12" >
								
					<div class="alert alert-danger" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					ERRORE SELEZIONE QUIZ
					</div>
				
				</div>
			
			<?php
		
		}
			
		
		?>
		
		
		
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
