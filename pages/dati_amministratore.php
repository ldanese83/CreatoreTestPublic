<?php
@include("header.php");
if (!isset($user))
{
	die("Non hai l'utorizzazione per entrare nella pagina");
}
else {


?>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		?>
	<h3 style="text-align:center;">Modifica dati utente: <?php echo $row["nome"]."  ".$row["cognome"]; ?></h3>
	
	
		<div class="row" style="width:100%;margin:auto;padding:3em;">
			<div class="panel panel-primary">
				<form action="update_utente.php" method="POST" id="form_domanda" style="padding:1em;">
					<div class='row_form'>
					<h4 class="row_form_h4">Password (lascia in bianco per non cambiare)</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="password" id="password" name="password" style="width:100%" />
							<div class="input-icon"><i class="fa fa-question"></i></div>
							<input type='hidden' id='id_utente' name="id_utente" value='<?php echo $id_utente; ?>' />
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Conferma nuova password</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="password" id="password2" name="password2" style="width:100%" />
							<div class="input-icon"><i class="fa fa-question"></i></div>
						</div>
					</div>
					<div class='row_form'>
					<h4 class="row_form_h4">Email</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="Email" id="email" name="email" value="<?php echo $row["email"] ?>" style="width:100%" />
							<div class="input-icon"><i class="fa fa-question"></i></div>
						</div>
					</div>
					<div class='row_form'>
						<div class="input-group input-group-icon" style="width:10%;">
							<input type="submit" value="Salva" class="submit_salva" /><div class="input-icon"><i class="fa fa-save" style="color:black;"></i>
						</div>
					</div>
				</form>
			</div>
		</div>
            
        </div>
        <!-- /#page-wrapper -->

    </div></div>
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
<?php
}
?>