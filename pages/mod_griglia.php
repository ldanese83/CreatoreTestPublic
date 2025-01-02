<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
	
	
?>
<script src="../js/domande.js" ></script>
<script src="../ckeditor/ckeditor.js" ></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">

	
	<h3 style="text-align:center;">Inserimento/modifica griglia di valutazione</h3>
	<div style="text-align:center;width:100%">
	<button class="btn btn-primary" onclick='window.location.href="griglie.php";'>Indietro</button>
	</div>
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		$id_griglia=0;
		$nome="";
		$griglia="Inserire qui la griglia di valutazione";
		if(isset($_GET["id_griglia"])) $id_griglia=$_GET["id_griglia"];
		if($id_griglia!=0) {
			$dataset2=eseguiQuery("select * from ct_griglie_valutazione where id_griglia=$id_griglia");	
			$row2=$dataset2->fetch_assoc();
			$nome=$row2["nome_griglia"];
			$griglia=htmlspecialchars_decode(html_entity_decode($row2["griglia"]));
		}
		?>
		<div class="row" style="width:100%;margin:auto;padding:3em;">
		
			<div class="panel panel-primary">
				<form action="salva_griglia.php" method="POST" id="form_domanda" style="padding:1em;">
					<div class='row_form'>
					<h4 class="row_form_h4">Nome griglia</h4>
						<div class="input-group input-group-icon" style="width:100%">
							<input type="text" placeholder="Nome Griglia" id="nome_griglia" name="nome_griglia" style="width:100%" value="<?php echo $nome; ?>" required />
							<div class="input-icon"><i class="fa fa-question"></i></div>
							<input type='hidden' id='id_griglia' name="id_griglia" value='<?php echo $id_griglia; ?>' />
						</div>
					</div>
					<div id="esercizio_numeri">
						<div class='row_form'>
						<h4 class="row_form_h4">Griglia di Valutazione</h4>
							<div class="input-group input-group-icon" style="width:100%">
								<textarea id="griglia" name="griglia" rows="30" cols="80"><?php echo $griglia; ?></textarea>
								<script>
								CKEDITOR.replace( 'griglia' );
								</script>
							</div>
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
