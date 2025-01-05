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
			if($row<1) {
				echo "<div class='alert alert-danger'>Errore: l'utente non può accedere a questa classe <strong><a href='../classi_all.php'>INDIETRO</a></strong></div>";
			}
			else {
				$params=[
					['value' => $id_classe]
				]; 
				$query="select * from ct_classi inner join ct_anni_scolastici on fk_anno_scolastico=id_anno where ct_classi.id_classe=?";
				$row=eseguiQueryPrepareOne($query,$params);

?>

			<script src="../../ckeditor/ckeditor.js" ></script>
			<script type="text/javascript" src="./js/mod_personaggi.js"></script>
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
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">Personaggi disponibili</span></h1>
							<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" data-toggle='modal' data-target='#addPersonaggioModal' onclick='modifica_personaggio(0)'><i
                                class="fas fa-plus fa-sm text-white-50"></i> Aggiungi personaggio</a>
						</div>
						

						

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Personaggi</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th style="width:20%">Nome personaggio</th>
												<th style="width:20%">Vite a disposizione</th>
												<th style="width:20%">Mana massimo</th>
												<th style="width:20%">Immagine</th>
												<th style="width:20%">Modifica personaggio</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th style="width:20%">Nome personaggio</th>
												<th style="width:20%">Vite a disposizione</th>
												<th style="width:20%">Mana massimo</th>
												<th style="width:20%">Immagine</th>
												<th style="width:20%">Modifica personaggio</th>
											</tr>
										</tfoot>
										<tbody>
										<?php
											$params = [];
											$resultset=eseguiQueryPrepareMany("select * from ct_personaggi order by nome_personaggio",$params);
											foreach($resultset as $row_s) {
												echo "<tr>";
												echo "<td>$row_s[nome_personaggio]</td>";
												echo "<td>";
												for($i=1;$i<=$row_s["vita_iniziale"];$i++) {
													
													echo "<i class='fas fa-heart fa-sm fa-fw mr-2 text-red-900'></i>";
													
												}	
												echo "</td>";
												echo "<td>";
												for($i=1;$i<=$row_s["mana_iniziale"];$i++) {
													
													echo "<i class='fas fa-yin-yang fa-sm fa-fw mr-2 text-blue-900'></i>";
													
												}	
												echo "</td>";
												echo "<td style=\"text-align:center;\"><img style= \"border:1px solid $row_s[bordercolor];box-shadow: 2px 2px 4px 2px $row_s[color];\" src=\"$row_s[immagine]\" class=\"thumb_pers\"></td>";
												echo "<td style=\"text-align:center;\"><a href=\"#\" class=\"d-none d-sm-inline-block btn btn-sm btn-warning shadow-sm\" data-toggle='modal' data-target='#addPersonaggioModal' onclick=\"modifica_personaggio($row_s[id_personaggio])\">Modifica</a></td>";
												
												echo "</tr>";
											}
											?>
											
											
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>

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

		<!-- Togli cuore Modal-->
		<div class="modal fade" id="addPersonaggioModal" tabindex="-1" role="dialog" aria-labelledby="addPersonaggioModall"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addPersonaggioModallab">Modifica personaggio</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
				  <div class="modal-body">
					<div id="mod_personaggio">

					</div>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="update_personaggio();">Salva</button>
				  </div>
				</div>
			</div>
		</div>

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

	</body>

	</html>
<?php }}}} ?>