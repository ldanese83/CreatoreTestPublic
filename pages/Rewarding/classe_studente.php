<?php 
session_start();
include("header_classe_studente.php");

include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_utente = $_SESSION['id_utente'];
	$params=[
		['value' => $id_utente]
	]; 
	$query="select count(*) as tot from ct_utenti where id_utente=? and (fk_tipo_utente=2 or fk_tipo_utente=3)";
	$row=eseguiQueryPrepareOne($query,$params);
	
	if($row["tot"]==0) {
		echo "<div class='alert alert-danger'>Non hai i permessi per accedere alla pagina: non sei uno studente</div>";
	}
	else {
		if(!isset($_SESSION["id_classe"])) {
			echo "<div class='alert alert-danger'>Errore: nessuna classe selezionata! <strong><a href='./homepage_studente.php'>INDIETRO</a></strong></div>";
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
				echo "<div class='alert alert-danger'>Errore: l'utente non può accedere a questa classe <strong><a href='./homepage_studente.php'>INDIETRO</a></strong></div>";
			}
			else {
				$params=[
					['value' => $id_classe]
				]; 
				$query="select * from ct_classi inner join ct_anni_scolastici on fk_anno_scolastico=id_anno where ct_classi.id_classe=?";
				$row=eseguiQueryPrepareOne($query,$params);
				
				$params=[
					['value' => $id_utente],
					['value' => $id_classe]
				]; 
				$query_stud="select * from ct_studenti inner join ct_studenti_classi on id_studente=fk_studente where fk_utente=? and fk_classe=?";
				$row_stud=eseguiQueryPrepareOne($query_stud,$params);
				$id_studs=$row_stud["id_studente"];
		

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
							include("alerts_studenti.php");
							?>

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
									<a class="dropdown-item" href="../dati_studente.php">
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
							<h1 class="h3 mb-0 text-gray-800">Classe <?php echo $row["nome_classe"]." ".$row["anno_scolastico"];?></h1>
						</div>
						<?php
						
						if($row_stud["fk_personaggio"]==0) {
						?>
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h2 class="alert alert-success" style="font-size:1.4em;">Non hai ancora selezionato il tuo personaggio per questa classe. <strong>Scegline uno cliccando sul nome!</strong></h2>
						</div>
						<div class="d-sm-flex align-items-top justify-content-between mb-4 flex-wrap">
						
							<?php
							$query_pers="select * from ct_personaggi";
							$params=[];
							$row_pers=eseguiQueryPrepareMany($query_pers,$params);
							foreach($row_pers as $pers) {?>
							<div class="col-xl-6 col-md-6 mb-4" style="margin-top:2vh;">
							<div class="card shadow mb-4 ">
                                <a class="scelta_personaggio" href="#" onclick="scegli_pers(<?php echo $pers["id_personaggio"]; ?>,'<?php echo $pers["nome_personaggio"];?>');">
								<div class="card-header py-3 card_descr">
                                    <h6 class="m-0 font-weight-bold text-primary"><?php echo $pers["nome_personaggio"];?></h6>
                                </div>
								</a>
                                <div class="card-body">
                                    <img style="border:1px solid <?php echo $pers["bordercolor"];?>;box-shadow: 2px 2px 4px 2px <?php echo $pers["color"];?>;" class="medium_size" src='<?php echo $pers["immagine"];?>' />
									<p class="descrizione_cards"><?php echo htmlspecialchars_decode(html_entity_decode($pers["descrizione"]));?></p>
									<p class="descrizione_cards alert alert-primary">Vite a disposizione: <strong><?php echo $pers["vita_iniziale"];?></strong><i class='fas fa-heart fa-sm fa-fw mr-2 text-red-900'></i></p>
									<p class="descrizione_cards alert alert-primary"><strong>Poteri:</strong>
									<table class="poteri_cards">
										<?php
										$query_poteri="select * from ct_poteri,ct_personaggi_poteri where id_potere=fk_potere and fk_personaggio=?";
										$params=[['value' => $pers["id_personaggio"]]];
										$row_poteri=eseguiQueryPrepareMany($query_poteri,$params);
										$cont_pot=0;
										foreach($row_poteri as $potere) {
											$cont_pot++;
											$stile="primary";
											if($cont_pot==1) $stile="success";
											if($cont_pot==2) $stile="warning";
											if($cont_pot==3) $stile="danger";
										?>
										
										<tr class="border-left-<?php echo $stile; ?> shadow h-100 py-2" style="font-size:1.2vw"><td style='vertical-align:center;padding-right:1vw;padding-left:1.3vw'><img class='img_card_potere' src='<?php echo $potere["img_potere"]; ?>' /></td><td style="padding-bottom:2vh">
										<strong><?php echo $potere["nome_potere"]; ?></strong>: <?php echo $potere["descrizione_potere"]; ?> <strong>Livello: <?php echo $potere["livello"]; ?></strong></td></tr>
										<?php }?>
									</table>
                                </div>
                            </div>
							</div>
						<?php }?>
						
                          
						
						</div>
					<?php
					}
					else {
						$query_pers="select * from ct_personaggi where id_personaggio=?";
						$params=[['value' => $row_stud["fk_personaggio"]]];
						$pers=eseguiQueryPrepareOne($query_pers,$params);
						
						?>
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h2 class="alert alert-success" style="font-size:1.4em; width:100%;font-size:3vw;text-align:center;font-weight:bold;">
							<?php echo strtoupper($pers["nome_personaggio"]); ?>
							</strong></h2>
						</div>
						<div class="d-sm-flex align-items-top justify-content-between mb-8">
						
							<div class="col-xl-12 col-md-12 mb-8" >
							<div class="card shadow mb-8 ">
                                <div class="card-body">
								<table style="width:100%;">
								<tr><td>
                                    <img style="border:1px solid <?php echo $pers["bordercolor"];?>;box-shadow: 2px 2px 4px 2px <?php echo $pers["color"];?>;" class="large_size" src='<?php echo $pers["immagine"];?>' /></td>
									<td style="vertical-align:top;width:60%">
									
									<div class="internal_card alert alert-primary">
									<i class='fas fa-cross fa-sm fa-fw mr-2 text-yellow-900 big_heart'></i>
									<?php 
									for($i=1;$i<=$pers["vita_iniziale"];$i++) {
										if($row_stud["vite"]>=$i) {
											echo "<i class='fas fa-heart fa-sm fa-fw mr-2 text-red-900 big_heart'></i>";
										}
										else {
											echo "<i class='fas fa-heart fa-sm fa-fw mr-2 text-red-400 big_heart'></i>";
										}
									}	
									
									?>
									</div>
									<div class="internal_card alert alert-info">
									<i class='fas fa-award fa-sm fa-fw mr-2 text-yellow-900 big_heart'></i>
									<strong>IL TUO LIVELLO:</strong> 
									<div class="number-wordart">
									<?php 
									echo $row_stud["livello"];
									
									?>
									</div>
									<strong>PROGRESSO XP:</strong> 
									<?php 	
									$punti_nuovo_lvl = pow(1.2,$row_stud["livello"])*150;
									$da_togliere = 0;
									for($j=1;$j<$row_stud["livello"];$j++) {
										$da_togliere+=pow(1.2,$j)*150;
									}
									$xp_livello=$row_stud["xp"]-$da_togliere;
									$percent=floor($xp_livello/$punti_nuovo_lvl*100);
									echo "<div style=\"height:5vh;\"class=\"progress\" role=\"progressbar\" aria-label=\"Animated striped example\" aria-valuenow=\"$percent\" aria-valuemin=\"0\" aria-valuemax=\"100\"><div class=\"progress-bar progress-bar-striped bg-warning\" style=\"width: $percent%\"></div></div>";
									?>
									</div>
									<div class="internal_card alert alert-danger">
									<i class='fas fa-skull fa-sm fa-fw mr-2 text-yellow-900 big_heart'></i>
									<strong>COMPITI AGGIUNTIVI:</strong> 
									</div>
									</td>
									</tr></table>
									
									<p class="descrizione_cards alert alert-primary" style="margin-top:3vh;"><strong>Poteri del personaggio:</strong>
									<table class="poteri_cards">
										<?php
										$query_poteri="select * from ct_poteri,ct_personaggi_poteri where id_potere=fk_potere and fk_personaggio=?";
										$params=[['value' => $pers["id_personaggio"]]];
										$row_poteri=eseguiQueryPrepareMany($query_poteri,$params);
										$cont_pot=0;
										foreach($row_poteri as $potere) {
											$cont_pot++;
											$stile="primary";
											if($cont_pot==1) $stile="success";
											if($cont_pot==2) $stile="warning";
											if($cont_pot==3) $stile="danger";
										?>
										
										<tr class="border-left-<?php echo $stile; ?> shadow h-100 py-2" style="font-size:1.2vw"><td style='vertical-align:center;padding-right:1vw;padding-left:1.3vw'><img class='img_card_potere' src='<?php echo $potere["img_potere"]; ?>' /></td><td style="padding-bottom:2vh">
										<strong><?php echo $potere["nome_potere"]; ?></strong>: <?php echo $potere["descrizione_potere"]; ?> <strong>Livello: <?php echo $potere["livello"]; ?></strong></td></tr>
										<?php }?>
									</table>
									<p class="descrizione_cards alert alert-warning" style="margin-top:3vh;"><?php echo htmlspecialchars_decode(html_entity_decode($pers["descrizione"]));?></p>
									
                                </div>
                            </div>
							</div>
							</div>
						<?php }?>
						
                          
						
						
							
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
						<a class="btn btn-primary" href="./logout_studente.php">Logout</a>
					</div>
				</div>
			</div>
		</div>

		<script src="./js/scegli_pers.js"></script>

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