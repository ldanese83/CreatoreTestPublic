<?php 
session_start();
include("header_docente.php");

include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION['id_utente'];
	$params=[
		['value' => $id_utente]
	]; 
	$query="select count(*) as tot from ct_utenti_tipi where fk_utente=? and (fk_tipo_utente=1 or fk_tipo_utente=3)";
	$row=eseguiQueryPrepareOne($query,$params);
	
	if($row["tot"]==0) {
		echo "<div class='alert alert-danger'>Non hai i permessi per accedere alla pagina: non sei docente nè amministratore</div>";
	}
	else {
		if(!isset($_SESSION["id_classe"])) {
			echo "<div class='alert alert-danger'>Errore: nessuna classe selezionata! <strong><a href='../classi_all.php'>INDIETRO</a></strong></div>";
		}
		else {
			$id_classe=$_SESSION["id_classe"];
			$params=[
				['value' => $id_classe],
				['value' => $id_utente]
			]; 
			$query="select count(*) as tot from ct_utenti_classi where fk_classe=? and fk_utente=?";
			$row=eseguiQueryPrepareOne($query,$params);
			if($row["tot"]<1) {
				echo "<div class='alert alert-danger'>Errore: l'utente non può accedere a questa classe <strong><a href='../classi_all.php'>INDIETRO</a></strong></div>";
			}
			else {
				
				if(!isset($_GET["id_quest"])) {
					
					echo "<div class='alert alert-danger'>Errore: Nessuna quest selezionata <strong><a href='../quest_all.php'>INDIETRO</a></strong></div>";
				}
				else {
					$id_quest=$_GET["id_quest"];
					$params=[
						['value' => $id_quest]
					]; 
					$query="select * from ct_quest where id_quest=?";
					$row=eseguiQueryPrepareOne($query,$params);

?>

			<!-- Bootstrap core JavaScript-->
			<script src="vendor/jquery/jquery.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script src="vendor/chart.js/Chart.min.js"></script>
			
			<!-- Page level plugins -->
			<script src="vendor/datatables/jquery.dataTables.min.js"></script>
			<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="js/demo/datatables-demo.js"></script>

			<!-- Page level custom scripts -->
			<script src="js/demo/chart-area-demo.js"></script>
			<script src="js/demo/chart-pie-demo.js"></script>
			
			<script src="../../ckeditor/ckeditor.js" ></script>

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">

				<!-- Main Content -->
				<div id="content">

					<!-- Topbar -->
					<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

						<!-- Sidebar Toggle (Topbar) -->
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>

						<!-- Topbar Search -->
						

						<!-- Topbar Navbar -->
						<ul class="navbar-nav ml-auto">

							<!-- Nav Item - Search Dropdown (Visible Only XS) -->
							<li class="nav-item dropdown no-arrow d-sm-none">
								<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-search fa-fw"></i>
								</a>
								<!-- Dropdown - Messages -->
								<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
									aria-labelledby="searchDropdown">
									<form class="form-inline mr-auto w-100 navbar-search">
										<div class="input-group">
											<input type="text" class="form-control bg-light border-0 small"
												placeholder="Search for..." aria-label="Search"
												aria-describedby="basic-addon2">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button">
													<i class="fas fa-search fa-sm"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</li>

							
							<?php
							include("alerts_docenti.php");
							?>
							

							<!-- Nav Item - Messages 
							<li class="nav-item dropdown no-arrow mx-1">
								<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-envelope fa-fw"></i>
									<!-- Counter - Messages 
									<span class="badge badge-danger badge-counter">7</span>
								</a>
								<!-- Dropdown - Messages 
								<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="messagesDropdown">
									<h6 class="dropdown-header">
										Message Center
									</h6>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_1.svg"
												alt="...">
											<div class="status-indicator bg-success"></div>
										</div>
										<div class="font-weight-bold">
											<div class="text-truncate">Hi there! I am wondering if you can help me with a
												problem I've been having.</div>
											<div class="small text-gray-500">Emily Fowler · 58m</div>
										</div>
									</a>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_2.svg"
												alt="...">
											<div class="status-indicator"></div>
										</div>
										<div>
											<div class="text-truncate">I have the photos that you ordered last month, how
												would you like them sent to you?</div>
											<div class="small text-gray-500">Jae Chun · 1d</div>
										</div>
									</a>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="img/undraw_profile_3.svg"
												alt="...">
											<div class="status-indicator bg-warning"></div>
										</div>
										<div>
											<div class="text-truncate">Last month's report looks great, I am very happy with
												the progress so far, keep up the good work!</div>
											<div class="small text-gray-500">Morgan Alvarez · 2d</div>
										</div>
									</a>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="dropdown-list-image mr-3">
											<img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
												alt="...">
											<div class="status-indicator bg-success"></div>
										</div>
										<div>
											<div class="text-truncate">Am I a good boy? The reason I ask is because someone
												told me that people say this to all dogs, even if they aren't good...</div>
											<div class="small text-gray-500">Chicken the Dog · 2w</div>
										</div>
									</a>
									<a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
								</div>
							</li>-->

							<div class="topbar-divider d-none d-sm-block"></div>

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<span class="mr-2 d-none d-lg-inline text-gray-600 small">
									
									</span>
									<img class="img-profile rounded-circle"
										src="./img/undraw_profile_2.svg">
								</a>
								<!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="../index.php">
										<i class="fas fa-book fa-sm fa-fw mr-2 text-gray-400"></i>
										Creatore Test
									</a>
									<a class="dropdown-item" href="../dati_amministratore.php">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
										Profilo
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div>
							</li>

						</ul>

					</nav>
					<!-- End of Topbar -->

					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						
						
						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-4 text-gray-800">Aggiungi capitolo alla quest <strong><?php echo $row["nome_quest"]; ?></strong></h1>
						<a href="modifica_quest.php?id_quest=<?php echo $id_quest; ?>" style="margin-bottom:3vh;" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm"><i
                                class="fas fa-arrow-left fa-sm text-white-50" style="margin-left:0.5vw;width:2vw;"></i>Back</a>
						</div>
						<div class="row" style="width:100%;margin:auto;">
							
								<form action="save_capitolo.php" method="POST" id="form_capitolo" style="width:90%;">
									
									<!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="nome_capitolo" class="form-label">Nome capitolo</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-map"></i></span>
										  <input type="text" class="form-control" name="nome_capitolo" id="nome_capitolo" placeholder="Nome del capitolo">
										  <input type="hidden" name="id_quest" value="<?php echo $id_quest; ?>" />
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="tipo_esercizio" class="form-label">Tipo di esercizio</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-list"></i></span>
										  <select id="tipo_esercizio" name="tipo_esercizio" class="form-select" style="width:90%;" >
												<?php
												$params = [];
												$query="select * from ct_tipi_esercizio ";
												$resultset=eseguiQueryPrepareMany($query,$params);
												foreach($resultset as $rowm) {
													echo "<option value='$rowm[id_tipo_esercizio]'>$rowm[tipo]</option>";
												}
												?>
											</select>
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="materia" class="form-label">Seleziona materia</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-book"></i></span>
										  <select id="materia" name="materia" class="form-select" style="width:90%;" onchange="cambia_materia();">
												<?php
												$params = [];
												$query="select * from ct_materie inner join ct_utenti_materie on fk_materia=id_materia where fk_utente=$id_utente";
												$resultset=eseguiQueryPrepareMany($query,$params);
												$c=0;
												$id_prima=0;
												foreach($resultset as $rowm) {
													if($c==0) {
														echo "<option value='$rowm[id_materia]' selected>$rowm[nome_materia]</option>";
														$id_prima=$rowm["id_materia"];
													}
													else
														echo "<option value='$rowm[id_materia]'>$rowm[nome_materia]</option>";
													$c++;
												}
												?>
										  </select>
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="argomento" class="form-label">Seleziona argomento</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-list"></i></span>
										  <select id="argomento" name="argomento" class="form-select" style="width:90%;">
												<?php
												$params=[["value"=>$id_prima]];
												$dataset=eseguiQueryPrepareMany("select * from ct_argomenti where fk_materia=?",$params);
												foreach($dataset as $row) {
													echo "<option value='$row[id_argomento]'>$row[nome_argomento]</option>";
												}
												?>
										  </select>
										</div>
									  </div>
									  
									 <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="xp_points" class="form-label">Punti esperienza</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-bolt"></i></span>
										  <input type="number" class="form-control" id="xp_points" name="xp_points" placeholder="Punti esperienza">
										</div>
									  </div>
									  
									  
									   <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="nome_capitolo" class="form-label">Storia del capitolo</label>
										<div class="input-group" >
										  <textarea id="story" name="story" rows="30" cols="80" ></textarea>
												
												<script>
												CKEDITOR.replace( 'story', {
												width: '90%'  // Imposta la larghezza desiderata
											  } );
												</script>
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="num_domande" class="form-label">Numero domande quiz (se è quiz)</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-bolt"></i></span>
										  <input type="number" class="form-control" id="num_domande" name="num_domande" placeholder="Numeo domande quiz">
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="testo_esercizio" class="form-label">Testo dell'esercizio (se non è quiz)</label>
										<div class="input-group" >
										  <textarea id="testo_esercizio" name="testo_esercizio" rows="30" cols="80" ></textarea>
												<script>
												CKEDITOR.replace( 'testo_esercizio', {
												width: '90%'  // Imposta la larghezza desiderata
											  }  );
												</script>
										</div>
									  </div>
									<div class='row_form' style="margin-top:3vh">
										<div class="input-group input-group-icon" >
											<button  class="btn btn-success btn-icon-split" >
												<span class="icon text-white-50">
													<i class="fas fa-save"></i>
												</span>
												<span class="text">Salva capitolo</span>
											</button>
										</div>
									</div>
									
								</form>
							</div>

					</div>
                <!-- /.container-fluid -->
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Developed by prof. Danese</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="../../logout.php">Logout</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Add Studente Modal-->
		<div class="modal fade" id="addQuestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Inserisci nuova quest</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
				  <div class="modal-body">
					<div id="mod_quest">
						<div class='row'>
						<div class='col-md-2' style='padding-top:10px'>
						<label for='nome_quest_mod'>Nome Quest</label></div>
						<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_quest_mod' />
						</div>
						</div>
					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="update_quest();">Salva</button>
				  </div>
				</div>
			</div>
		</div>

		<!--Script per aggiunta/modifica quest-->
		<script src="./js/mod_quest.js" ></script>

		

	</body>

	</html>
<?php }}}}} ?>