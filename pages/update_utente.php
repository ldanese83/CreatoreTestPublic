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

	
	<h3 style="text-align:center;">Update dati utente</h3>
	
	
		<?php
		if(isset($_POST["id_utente"])) {
			$id_utente=$_POST["id_utente"];
			$password=$_POST["password"];
			$password2=$_POST["password2"];
			$email=$_POST["email"];
			$valid1=0;
			$dataset = eseguiQuery("select count(1) as tot from ct_utenti where email ='$email' and id_utente<>$id_utente");
			$row = $dataset->fetch_assoc();
			if($row["tot"]==0) $valid1=1;
			
			if($password!="" && $password==$password2) {
				$password=md5($password);
				if($valid1==1) {
					$query = "UPDATE ct_utenti SET password='$password' AND email='$email' where id_utente=$id_utente";
					eseguiQuery($query);
					?>
				<div class="col-md-12" >
								
					<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					DATI UTENTE MODIFICATI CORRETTAMENTE <br /><br />
					</div>
				
				</div>
				
				<?php }
				else {
					$query = "UPDATE ct_utenti SET password='$password' where id_utente=$id_utente";
					eseguiQuery($query);
					?>
				<div class="col-md-12" >
								
					<div class="alert alert-warning" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					MAIL IN USO DA ALTRO UTENTE, ESEGUITO IL SOLO UPDATE DELLA PASSWORD <br /><br />
					</div>
				
				</div>
				
				<?php }
			}
			else if($password!=$password2){
				?>
				<div class="col-md-12" >
							
				<div class="alert alert-danger" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
				ERRORE NELLA MODIFICA DELLA PASSWORD (password non uguali)<br /><br />
				</div>
			
				</div>
				<?php
			}
			else if($valid1==1){
				$query = "UPDATE ct_utenti SET email='$email' where id_utente=$id_utente";
				eseguiQuery($query);
				?>
				<div class="col-md-12" >
								
					<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
					DATI UTENTE MODIFICATI CORRETTAMENTE <br /><br />
					</div>
				
				</div>
				
				<?php 
			}
			else {
				?>
				<div class="col-md-12" >
							
				<div class="alert alert-danger" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
				ERRORE NELLA MODIFICA DELL'EMAIL: email già in uso da un altro utente!<br /><br />
				</div>
			
				</div>
				<?php
		}
		}
		else {
		?>
				<div class="col-md-12" >
							
				<div class="alert alert-danger" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
				ERRORE NELLA MODIFICA DELL'UTENTE<br /><br />
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
