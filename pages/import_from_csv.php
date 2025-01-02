<?php
@include("header.php");
if (!isset($user))
{
 
}
else{
?>
<script src="../js/domande.js" ></script>
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Benvenuto <?php echo $user; ?> </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<?php
			$id_argomento=$_GET["id_argomento"];

			?>
			<div class="row" style="width:100%;margin:auto;padding:3em;">
				<div class="panel panel-primary">
					<form action="importa_CSV.php" method="POST" enctype="multipart/form-data" id="form_domanda" style="padding:1em;">
						<div class='row_form'>
						<h4 class="row_form_h4">Selezione file CSV da importare</h4>
							<div class="input-group input-group-icon" style="width:100%">							
								<input type="file" name="fileUpload" id="fileUpload">
								<div class="input-icon"><i class="fa fa-file"></i></div>
								<input type='hidden' id='id_argomento' name="id_argomento" value='<?php echo $id_argomento; ?>' />
							</div>
						</div>
						<div class='row_form'>
							<div class="input-group input-group-icon" style="width:10%;">
								<input type="submit" value="Carica" class="submit_salva" /><div class="input-icon"><i class="fa fa-save" style="color:black;"></i></div>
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