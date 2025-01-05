<?php 
session_start();
include("header_classe_studente.php");

include("../../share/funzioni2_1.php");
//CD7F32
function crea_tabella_poteri($query,$scritta,$classe,$id_stud,$liv_stud) {
	?>
	<!-- DataTales Example -->
	<div class="card shadow mb-4" style="width:100%;">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"><?php echo $scritta; ?></h6>
		</div>
		<div class="card-body" style="width:100%;">
			<div class="table-responsive" style="width:100%;">
				<table class="table table-bordered" style="width:100%;" cellspacing="0">
					<thead>
						<tr class="<?php echo $classe; ?>">
							<th style="width:20%;vertical-align:top;" >Immagine</th>
							<th style="width:20%;vertical-align:top;" >Nome</th>
							<th style="width:40%;vertical-align:top;" >Descrizione</th>
							<th style="width:10%;vertical-align:top;" >Mana consumato</th>
							<th style="width:10%;vertical-align:top;" >Scegli</th>
						</tr>
					</thead>
					<tbody>
					<?php
					$query_pot=$query;
					$params=[];
					$dataset_pot=eseguiQueryPrepareMany($query_pot,$params);
					foreach($dataset_pot as $row_s) {
						echo "<tr>";
						echo "<td style=\"text-align:center;\"><img style= \"border:1px solid #efefef;box-shadow: 2px 2px 4px 2px gray;\" src=\"$row_s[img_potere]\" class=\"thumb_pers\"></td>";
						echo "<td>$row_s[nome_potere]</td>";
						echo "<td>".htmlspecialchars_decode(html_entity_decode($row_s["descrizione_potere"]))."</td>";
						echo "<td>$row_s[mana_necessario]</td>";
						if($row_s["livello"]<=$liv_stud) {
							echo "<td style=\"text-align:center;\"><a href=\"#\" class=\"d-none d-sm-inline-block btn btn-sm btn-success shadow-sm\"  onclick=\"scegli_potere($row_s[id_potere],$id_stud)\">Scegli!</a></td>";
						}
						else {
							echo "<td></td>";
						}
						
						echo "</tr>";
					}
					?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<?php
	
}

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
		

?>
			<script src="./js/scegli_powers.js" type="text/javascript"></script>
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
						//controllo se lo studente deve scegliere un potere
						$params=[
							['value' => $id_utente],
							['value' => $id_classe]
						]; 
						$query_stud="select * from ct_studenti inner join ct_studenti_classi on id_studente=fk_studente where fk_utente=? and fk_classe=?";
						$row_stud=eseguiQueryPrepareOne($query_stud,$params);
						$id_studs=$row_stud["id_studente"];
						
						if($row_stud["pot_da_scegliere"]>0) {
							
							?>
					
					
							<div class="d-sm-flex align-items-center justify-content-between mb-4">
								<h2 class="alert alert-success" style="font-size:1.4em;">Hai nuovi poteri (<?php echo $row_stud["pot_da_scegliere"];?>) da scegliere. <strong>Fa la tua scelta!</strong></h2>
							</div>
							<div class="d-sm-flex align-items-top justify-content-between mb-4 flex-wrap">

							<?php
							$colore="bronze-box";
							$scritta="Poteri di base";
							$qpow="select * from ct_poteri where livello<=5 order by mana_necessario";
							crea_tabella_poteri($qpow,$scritta,$colore,$id_studs,$row_stud["livello"]);
							$colore="silver-box";
							$scritta="Poteri intermedi";
							$qpow="select * from ct_poteri where livello>5 and livello <=10 order by mana_necessario";
							crea_tabella_poteri($qpow,$scritta,$colore,$id_studs,$row_stud["livello"]);
							$colore="gold-box";
							$scritta="Poteri avanzati";
							$qpow="select * from ct_poteri where livello>10 and livello<=15 order by mana_necessario";
							crea_tabella_poteri($qpow,$scritta,$colore,$id_studs,$row_stud["livello"]);
							$colore="ruby-shimmer";
							$scritta="Poteri leggendari";
							$qpow="select * from ct_poteri where livello>15 and livello<=20 order by mana_necessario";
							crea_tabella_poteri($qpow,$scritta,$colore,$id_studs,$row_stud["livello"]);
							$colore="emerald-shimmer";
							$scritta="Poteri epici";
							$qpow="select * from ct_poteri where livello>20 order by mana_necessario";
							crea_tabella_poteri($qpow,$scritta,$colore,$id_studs,$row_stud["livello"]);
						
							echo "</div>";
						}
						else {
							
							?>
							<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="internal_card alert alert-secondary">
								<i class='fas fa-flask fa-sm fa-fw mr-2 text-yellow-900 big_heart'></i>
								<?php 
								for($i=1;$i<=$row_stud["mana"];$i++) {
									
									echo "<i class='fas fa-yin-yang fa-sm fa-fw mr-2 text-blue-900 big_heart'></i>";
									
								}	
								?>
							</div>
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Poteri</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th style="width:15%">Nome potere</th>
												<th style="width:35%">Descrizione</th>
												<th style="width:20%">Immagine</th>
												<th style="width:10%">Mana</th>
												<th style="width:20%">Utilizza</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th style="width:15%">Nome potere</th>
												<th style="width:35%">Descrizione</th>
												<th style="width:20%">Immagine</th>
												<th style="width:10%">Mana</th>
												<th style="width:20%">Utilizza</th>
											</tr>
										</tfoot>
										<tbody>
										<?php
											$params = [["value"=>$id_studs]];
											$resultset2=eseguiQueryPrepareMany("select * from ct_poteri inner join ct_studenti_poteri on fk_potere=id_potere where fk_studente=? order by mana_necessario",$params);
											foreach($resultset2 as $row_s2) {
												echo "<tr>";
												echo "<td>$row_s2[nome_potere]</td>";
												echo "<td>".htmlspecialchars_decode(html_entity_decode($row_s2["descrizione_potere"]))."</td>";
												echo "<td style=\"text-align:center;\"><img style= \"border:1px solid #efefef;box-shadow: 2px 2px 4px 2px gray;\" src=\"$row_s2[img_potere]\" class=\"medium_size\"></td>";
												echo "<td>$row_s2[mana_necessario]</td>";
												if($row_stud["mana"]>=$row_s2["mana_necessario"]) {
												echo "<td style=\"text-align:center;\"><a href=\"#\" class=\"d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm\" onclick=\"usa_potere($row_s2[id_potere],$id_studs,'$row_s2[nome_potere]');\") >Utilizza</a></td>";
												}else{
												echo "<td><div class='alert alert-danger'>Non hai mana sufficiente per usare questo potere!</div></td>";
												}
												echo "</tr>";
											}
											?>
											
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
	
							
							<?php
							
						}
						?>
                          
						
						
							
						

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