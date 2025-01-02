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
							<h1 class="h3 mb-0 text-gray-800">Studenti della classe: <strong><?php echo $row["nome_classe"]."</strong> <span style='font-size:12pt;font-style: italic;'>anno "
							.$row["anno_scolastico"]; ?></span></h1>
						</div>

						

						

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Studenti</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th style="width:15%">Cognome</th>
												<th style="width:15%">Nome</th>
												<th style="width:15%">Vite a disposizione</th>
												<th style="width:5%">Livello</th>
												<th style="width:15%">Al prossimo livello</th>
												<th style="width:10%">Personaggio</th>
												<th style="width:10%">Togli 1 cuore</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>Cognome</th>
												<th>Nome</th>
												<th>Vite a disposizione</th>
												<th>Livello</th>
												<th>Al prossimo livello</th>
												<th>Personaggio</th>
												<th>Togli 1 cuore</th>
											</tr>
										</tfoot>
										<tbody>
										<?php
											$params = [["value"=>$id_classe]];
											$resultset=eseguiQueryPrepareMany("select * from ((ct_studenti inner join ct_utenti on ct_utenti.id_utente=ct_studenti.fk_utente) inner join ct_studenti_classi on fk_studente=id_studente) left join ct_personaggi on fk_personaggio=id_personaggio where fk_classe=? order by cognome",$params);
											foreach($resultset as $row_s) {
												echo "<tr>";
												echo "<td>$row_s[cognome]</td>";
												echo "<td>$row_s[nome]</td>";
												if($row_s["fk_personaggio"]==0) {
													
													echo "<td><div class='alert alert-danger'>Da scegliere</div></td>";
													echo "<td><div class='alert alert-danger'>0</div></td>";
													echo "<td><div class='alert alert-danger'>//</div></td>";
													echo "<td><div class='alert alert-danger'>//</div></td>";
													echo "<td><div class='alert alert-danger'>//</div></td>";
												
												}
												else {
													echo "<td>";
													for($i=1;$i<=$row_s["vita_iniziale"];$i++) {
														if($row_s["vite"]>=$i) {
															echo "<i class='fas fa-heart fa-sm fa-fw mr-2 text-red-900'></i>";
														}
														else {
															echo "<i class='fas fa-heart fa-sm fa-fw mr-2 text-red-400'></i>";
														}
													}	
													echo "</td>";
													echo "<td>$row_s[livello]</td>";
													$punti_nuovo_lvl = pow(1.2,$row_s["livello"])*150;
													$da_togliere = 0;
													for($j=1;$j<$row_s["livello"];$j++) {
														$da_togliere+=pow(1.2,$j)*150;
													}
													$xp_livello=$row_s["xp"]-$da_togliere;
													$percent=floor($xp_livello/$punti_nuovo_lvl*100);
													echo "<td><div class=\"progress\" role=\"progressbar\" aria-label=\"Animated striped example\" aria-valuenow=\"$percent\" aria-valuemin=\"0\" aria-valuemax=\"100\"><div class=\"progress-bar progress-bar-striped bg-warning\" style=\"width: $percent%\"></div></div></td>";
													echo "<td style=\"text-align:center;\"><img style= \"border:1px solid $row_s[bordercolor];box-shadow: 2px 2px 4px 2px $row_s[color];\" src=\"$row_s[immagine]\" class=\"thumb_pers\"></td>";
													echo "<td style=\"text-align:center;\"><a href=\"#\" onclick='togli_cuore($row_s[id_studente],'$row_s[nome]','$row_s[cognome]')' class=\"btn btn-danger btn-circle btn-lg\"><i class=\"fas fa-skull\"></i></a></td>";
												}
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