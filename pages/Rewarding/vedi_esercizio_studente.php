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
				$id_studente=$row_stud["id_studente"];
?>
<script src="../../ckeditor/ckeditor.js" ></script>
<script src="./js/esercizio.js" ></script>
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
					<?php
					$id_quest=$_GET["id_quest"];
					$id_esercizio = $_GET["id_esercizio"];
					$params=[
						['value' => $id_esercizio]
						
					]; 
					$query="select * from (ct_esercizi inner join ct_argomenti on fk_argomento=id_argomento) inner join ct_tipi_esercizio on tipo_esercizio=id_tipo_esercizio where id_esercizio=?";
					$row=eseguiQueryPrepareOne($query,$params);
					
					$params=[
						['value' => $id_esercizio],
						['value' => $id_studente]
						
					]; 
					
					$query_cons="select * from ct_consegne_studenti where fk_esercizio=? and fk_studente=?";
					$row_cons=eseguiQueryPrepareOne($query_cons,$params);
					//var_dump($row_cons);
					if(!$row_cons) 
						$num_rows_cons=0;
					else
						$num_rows_cons=1;
					?>
					

						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800"><strong style="color:#194afc"><?php echo $row["nome_capitolo"]."</strong>";?></h1>
							<div>
							<a href="accedi_quest_studente.php?id_quest=<?php echo $id_quest; ?>" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm"><i
                                class="fas fa-arrow-left fa-sm text-white-50" style="margin-right:0.5vw;width:2vw"></i>Back</a>
							</div>
						</div>


						<div class="row" style="width:100%;margin:auto;">
							
								<form action="salva_consegna.php" method="POST" id="form_capitolo" style="width:100%;">
									<input type="hidden" name="id_quest" value="<?php echo $id_quest; ?>" />
									<input type="hidden" name="id_esercizio" value="<?php echo $id_esercizio; ?>" />
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="tipo_esercizio" class="form-label">Tipo di esercizio</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-list"></i></span>
										  <input type="text" class="form-control" id="tipo_ese" name="tipo_ese" value="<?php echo $row["tipo"]; ?>" readonly>
										</div>
									  </div>
									  
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="argomento" class="form-label">Argomento</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-list"></i></span>
										  <input type="text" class="form-control" id="nome_arg" name="nome_arg" value="<?php echo $row["nome_argomento"]; ?>" disabled>
										</div>
									  </div>
									  
									 <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="xp_points" class="form-label">Punti esperienza</label>
										<div class="input-group" >
										  <span class="input-group-text"><i class="fas fa-bolt"></i></span>
										  <input type="number" class="form-control" id="xp_points" name="xp_points" value="<?php echo $row["punti_esperienza"]; ?>" disabled>
										</div>
									  </div>
									  
									  
									   <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="nome_capitolo" class="form-label">Storia del capitolo</label>
										<div class="input-group" >
										  <div id="story" name="story" class="alert alert-success" style="font-size:2.5vh;">
										  <?php echo html_entity_decode($row["storia_esercizio"]); ?>
										  </div>
										</div>
									  </div>
									  
									  <?php
									  if($row["tipo"]=="Domanda aperta") { ?>
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="testo_esercizio" class="form-label">Testo della domanda</label>
										<div class="input-group" >
										  <div id="testo_esercizio" name="testo_esercizio" class="alert alert-warning" style="font-size:2.5vh">
												<?php echo html_entity_decode($row["testo_esercizio"]); ?>
											</div>
										</div>
									  </div>
									  <!-- Input con icona a sinistra -->
									  <?php
									  $risposta="";
									  if($num_rows_cons==1) { 
									  $params = [["value"=>$id_studente],["value"=>$id_esercizio],["value"=>$row_cons["id_consegna"]]];
									  $query_risp="select * from ct_esercizio_risposte where fk_studente=? and fk_esercizio=? and fk_consegna=?";
									  $row_risp=eseguiQueryPrepareOne($query_risp,$params);
									  $risposta=html_entity_decode($row_risp["testo_risposta"]);
									  }
									  ?>
									  <div class="mb-3" >
										<label for="testo_risposta" class="form-label">La tua risposta:</label>
										<div class="input-group" >
										  <textarea id="testo_risposta" name="testo_risposta" 
										  <?php if($num_rows_cons==1 and $row_cons["valutato"]==1)
											  echo "disabled"; ?>
										  rows="20" cols="80" >
											<?php
											if($num_rows_cons==1)
												echo $risposta;
											?>
											
											</textarea>
												<script>
												CKEDITOR.replace( 'testo_risposta', {
												width: '90%'  // Imposta la larghezza desiderata
											  }  );
												</script>
										</div>
									  </div>
									  <?php if($num_rows_cons==1 and $row_cons["valutato"]==1) { ?>
									  <div id="commento" name="commento" style="width:80%;text-align:justify;vertical-align:top;" class="alert alert-info" >
										  <strong>Commento del prof:</strong> <?php echo html_entity_decode($row_risp["commento_prof"]); ?>
										  </div>
									  </div>
									<?php
									  }
									  }
									  else if($row["tipo"]=="Quiz con risposte multiple e domande aperte") {
										//inizio
										
										
										
										if($num_rows_cons==0) { 
										
											$params=[
												['value' => $row["fk_argomento"]]
											]; 
											$query_domande="select * from ct_domande where fk_argomento=? and (fk_tipo_domanda=2 OR fk_tipo_domanda=1) order by RAND() LIMIT $row[num_domande]";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											eseguiQuery("delete from ct_esercizio_domande where fk_esercizio=$id_esercizio and fk_studente=$id_studente");
										
										
											foreach($dataset_domande as $row_domande) {
												
												$params=[$row_domande["id_domanda"],$id_esercizio,$id_studente];
												eseguiInsertPrepare("insert into ct_esercizio_domande(fk_domanda,fk_esercizio,fk_studente) values ",$params);
												
												if($row_domande["fk_tipo_domanda"]==2) {
												
												
												$icona = "fa-angle-double-right";
												$params=[
													['value' => $row_domande["id_domanda"]]
												]; 
												$query_risposte="select * from ct_risposte where fk_domanda=?";
												$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
												
												?>
												<div class='row_form'>
												<input type="hidden" value="" name="rispdom_<?php echo $row_domande["id_domanda"];?>" id="rispdom_<?php echo $row_domande["id_domanda"];?>" />
												<div class="alert alert-warning" style="width:100%">
													<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
												</div>
											</div><?php
												foreach($dataset_risposte as $row_risposta) {
													?>
												<div class='row_form'>
												
													<div onclick="seleziona_risp(<?php echo "$row_domande[id_domanda],$row_risposta[id_risposta]";?>)" class="input-group input-group-icon" style="width:100%">
														
														<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
														<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
													</div>
													
												</div>
											<?php }

												}
												else {?>
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="testo_esercizio" class="form-label">Testo della domanda</label>
										<div class="input-group" >
										  <div id="testo_esercizio" name="testo_esercizio" class="alert alert-warning" style="font-size:2.5vh">
												<?php echo html_entity_decode($row_domande["domanda"]); ?>
											</div>
										</div>
									  </div>
									 
									  <div class="mb-3" >
										<label for="testo_risposta" class="form-label">La tua risposta:</label>
										<div class="input-group" >
										
										  <textarea id="testo_risposta<?php echo $row_domande["id_domanda"];?>" name="testo_risposta<?php echo $row_domande["id_domanda"];?>" rows="20" cols="80" >
											</textarea>
												<script>
												CKEDITOR.replace( 'testo_risposta<?php echo $row_domande["id_domanda"];?>', {
												width: '90%'  // Imposta la larghezza desiderata
											  }  );
												</script>
										</div>
									  </div>
									 <?php
											}
										  }
										}
										else if($num_rows_cons==1 and $row_cons["valutato"]==0) { 
										
											
											$params=[
												['value' => $id_esercizio],
												['value' =>$id_studente]
											]; 
											$query_domande="select * from ct_esercizio_domande inner join ct_domande on fk_domanda=id_domanda where fk_esercizio=? and fk_studente=?";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											foreach($dataset_domande as $row_domande) {
												if($row_domande["fk_tipo_domanda"]==2) {
													$icona = "fa-angle-double-right";
													$params=[
														['value' => $row_domande["fk_domanda"]]
													]; 
													$query_risposte="select * from ct_risposte where fk_domanda=?";
													$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
													$params=[
														['value' => $id_esercizio],
														['value' => $id_studente],
														['value' => $row_domande["fk_domanda"]]
													]; 
													$query_rispostedate="select * from ct_esercizio_risposte where fk_esercizio=? and fk_studente=? and fk_domanda=?";
													$row_rispostedate=eseguiQueryPrepareOne($query_rispostedate,$params);
													?>
													<div class='row_form'>
													<input type="hidden" value="<?php echo $row_rispostedate["fk_risposta"]; ?>" name="rispdom_<?php echo $row_domande["fk_domanda"];?>" id="rispdom_<?php echo $row_domande["fk_domanda"];?>" />
													<div class="alert alert-warning" style="width:100%">
														<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
													</div>
													</div><?php
													foreach($dataset_risposte as $row_risposta) {
														
													
														
														?>
														<div class='row_form'>
														
															<div onclick="seleziona_risp(<?php echo "$row_domande[fk_domanda],$row_risposta[id_risposta]";?>)" class="input-group input-group-icon" style="width:100%">
																
																<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
																<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
															</div>
															
														</div>
														<?php 
														if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"]) {
															echo "<script>seleziona_risp($row_rispostedate[fk_domanda],$row_rispostedate[fk_risposta])</script>";
														}
													}

												}
												
												else {
													
												  $risposta="";
												  if($num_rows_cons==1) { 
													  $params = [["value"=>$id_studente],["value"=>$id_esercizio],["value"=>$row_cons["id_consegna"]],["value"=>$row_domande["id_domanda"]]];
													  $query_risp="select * from ct_esercizio_risposte where fk_studente=? and fk_esercizio=? and fk_consegna=? and fk_domanda=?";
													  //echo "select * from ct_esercizio_risposte where fk_studente=$id_studente and fk_esercizio=$id_esercizio and fk_consegna=$row_cons[id_consegna] and fk_domanda=$row_domande[id_domanda]";
													  $row_risp=eseguiQueryPrepareOne($query_risp,$params);
													  $risposta=html_entity_decode($row_risp["testo_risposta"]);
												  }
												  ?>
												  <!-- Input con icona a sinistra -->
												  <div class="mb-3" >
													<label for="testo_esercizio" class="form-label">Testo della domanda</label>
													<div class="input-group" >
													  <div id="testo_esercizio" name="testo_esercizio" class="alert alert-warning" style="font-size:2.5vh">
															<?php echo html_entity_decode($row_domande["domanda"]); ?>
														</div>
													</div>
												  </div>
												  <div class="mb-3" >
													<label for="testo_risposta" class="form-label">La tua risposta:</label>
													<div class="input-group" >
													  <textarea id="testo_risposta<?php echo $row_risp["fk_domanda"]; ?>" name="testo_risposta<?php echo $row_risp["fk_domanda"]; ?>" 
													  rows="20" cols="80" >
														<?php
															echo $risposta;
														?>
														
														</textarea>
															<script>
															CKEDITOR.replace( 'testo_risposta<?php echo $row_risp["fk_domanda"]; ?>', {
															width: '90%'  // Imposta la larghezza desiderata
														  }  );
															</script>
													</div>
												  </div>
												<?php
												}
										
											}
										}
										else if($num_rows_cons==1 and $row_cons["valutato"]==1) { 
										
											$params=[
												['value' => $id_esercizio],
												['value' =>$id_studente]
											]; 
											$query_domande="select * from ct_esercizio_domande inner join ct_domande on fk_domanda=id_domanda where fk_esercizio=? and fk_studente=?";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											foreach($dataset_domande as $row_domande) {
												if($row_domande["fk_tipo_domanda"]==2) {
												$icona = "fa-angle-double-right";
												$params=[
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_risposte="select * from ct_risposte where fk_domanda=?";
												$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
												$params=[
													['value' => $id_esercizio],
													['value' => $id_studente],
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_rispostedate="select * from ct_esercizio_risposte where fk_esercizio=? and fk_studente=? and fk_domanda=?";
												$row_rispostedate=eseguiQueryPrepareOne($query_rispostedate,$params);
												?>
												<div class='row_form'>
												<input type="hidden" value="<?php echo $row_rispostedate["fk_risposta"]; ?>" name="rispdom_<?php echo $row_domande["fk_domanda"];?>" id="rispdom_<?php echo $row_domande["fk_domanda"];?>" />
												<div class="alert alert-warning" style="width:100%">
													<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
												</div>
												</div><?php
												foreach($dataset_risposte as $row_risposta) {
													$back="";
													if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"] and $row_risposta["corretta"]==1) {
													$back="#5dfcb0";
													}
													else if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"] and $row_risposta["corretta"]==0) {
													$back="#f25b44";
													}
													
													?>
													<div class='row_form'>
													
														<div class="input-group input-group-icon" style="width:100%;">
															
															<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%;background-color:<?php echo $back; ?>" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
															<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
														</div>
														
													</div>
													<?php 
														if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"]) {
															echo "<script>seleziona_risp($row_rispostedate[fk_domanda],$row_rispostedate[fk_risposta])</script>";
														}

													}
												}
												else {
												?>
												  <!-- Input con icona a sinistra -->
												  <div class="mb-3" >
													<label for="testo_esercizio" class="form-label">Testo della domanda</label>
													<div class="input-group" >
													  <div id="testo_esercizio" name="testo_esercizio" class="alert alert-warning" style="font-size:2.5vh">
															<?php echo html_entity_decode($row_domande["domanda"]); ?>
														</div>
													</div>
												  </div>
												<!-- Input con icona a sinistra -->
												  <?php
												  $risposta="";
												  if($num_rows_cons==1) { 
												  $params = [["value"=>$id_studente],["value"=>$id_esercizio],["value"=>$row_cons["id_consegna"]],["value"=>$row_domande["id_domanda"]]];
												  $query_risp="select * from ct_esercizio_risposte where fk_studente=? and fk_esercizio=? and fk_consegna=? and fk_domanda=?";
												  $row_risp=eseguiQueryPrepareOne($query_risp,$params);
												  $risposta=html_entity_decode($row_risp["testo_risposta"]);
												  }
												  ?>
												  <div class="mb-3" >
													<label for="testo_risposta" class="form-label">La tua risposta:</label>
													<div class="input-group" >
													  <textarea id="testo_risposta<?php echo $row_risp["fk_domanda"]; ?>" name="testo_risposta<?php echo $row_risp["fk_domanda"]; ?>" 
													  <?php if($num_rows_cons==1 and $row_cons["valutato"]==1)
														  echo "disabled"; ?>
													  rows="20" cols="80" >
														<?php
														if($num_rows_cons==1)
															echo $risposta;
														?>
														
														</textarea>
															<script>
															CKEDITOR.replace( 'testo_risposta<?php echo $row_risp["fk_domanda"]; ?>', {
															width: '90%'  // Imposta la larghezza desiderata
														  }  );
															</script>
													</div>
												  </div>
												  <div id="commento" name="commento" style="width:80%;text-align:justify;vertical-align:top;" class="alert alert-info" >
													  <strong>Commento del prof:</strong> <?php echo html_entity_decode($row_risp["commento_prof"]); ?>
													  </div>	
											<?php	
													
													
												}
											}
											
										}
									  }
									  else if($row["tipo"]=="Quiz a risposta multipla") {
										//scancellare eventuali domande precedenti
										
										
										
										if($num_rows_cons==0) { 
										
											$params=[
												['value' => $row["fk_argomento"]]
											]; 
											$query_domande="select * from ct_domande where fk_argomento=? and fk_tipo_domanda=2 order by RAND() LIMIT $row[num_domande]";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											eseguiQuery("delete from ct_esercizio_domande where fk_esercizio=$id_esercizio and fk_studente=$id_studente");
										
										
											foreach($dataset_domande as $row_domande) {
												
												$params=[$row_domande["id_domanda"],$id_esercizio,$id_studente];
												eseguiInsertPrepare("insert into ct_esercizio_domande(fk_domanda,fk_esercizio,fk_studente) values ",$params);
												
												$icona = "fa-angle-double-right";
												$params=[
													['value' => $row_domande["id_domanda"]]
												]; 
												$query_risposte="select * from ct_risposte where fk_domanda=?";
												$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
												
												?>
												<div class='row_form'>
												<input type="hidden" value="" name="rispdom_<?php echo $row_domande["id_domanda"];?>" id="rispdom_<?php echo $row_domande["id_domanda"];?>" />
												<div class="alert alert-warning" style="width:100%">
													<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
												</div>
											</div><?php
												foreach($dataset_risposte as $row_risposta) {
													?>
												<div class='row_form'>
												
													<div onclick="seleziona_risp(<?php echo "$row_domande[id_domanda],$row_risposta[id_risposta]";?>)" class="input-group input-group-icon" style="width:100%">
														
														<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
														<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
													</div>
													
												</div>
											<?php }

											}
										}
										else if($num_rows_cons==1 and $row_cons["valutato"]==0) { 
										
											$params=[
												['value' => $id_esercizio],
												['value' =>$id_studente]
											]; 
											$query_domande="select * from ct_esercizio_domande inner join ct_domande on fk_domanda=id_domanda where fk_esercizio=? and fk_studente=?";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											foreach($dataset_domande as $row_domande) {
												
												$icona = "fa-angle-double-right";
												$params=[
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_risposte="select * from ct_risposte where fk_domanda=?";
												$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
												$params=[
													['value' => $id_esercizio],
													['value' => $id_studente],
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_rispostedate="select * from ct_esercizio_risposte where fk_esercizio=? and fk_studente=? and fk_domanda=?";
												$row_rispostedate=eseguiQueryPrepareOne($query_rispostedate,$params);
												?>
												<div class='row_form'>
												<input type="hidden" value="<?php echo $row_rispostedate["fk_risposta"]; ?>" name="rispdom_<?php echo $row_domande["fk_domanda"];?>" id="rispdom_<?php echo $row_domande["fk_domanda"];?>" />
												<div class="alert alert-warning" style="width:100%">
													<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
												</div>
											</div><?php
												foreach($dataset_risposte as $row_risposta) {
													
												
													
													?>
												<div class='row_form'>
												
													<div onclick="seleziona_risp(<?php echo "$row_domande[fk_domanda],$row_risposta[id_risposta]";?>)" class="input-group input-group-icon" style="width:100%">
														
														<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
														<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
													</div>
													
												</div>
											<?php 
											if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"]) {
														echo "<script>seleziona_risp($row_rispostedate[fk_domanda],$row_rispostedate[fk_risposta])</script>";
													}
											}

											}
										}
										else if($num_rows_cons==1 and $row_cons["valutato"]==1) { 
										
											$params=[
												['value' => $id_esercizio],
												['value' =>$id_studente]
											]; 
											$query_domande="select * from ct_esercizio_domande inner join ct_domande on fk_domanda=id_domanda where fk_esercizio=? and fk_studente=?";
											$dataset_domande=eseguiQueryPrepareMany($query_domande,$params);
											$i=0;
										
											foreach($dataset_domande as $row_domande) {
												
												$icona = "fa-angle-double-right";
												$params=[
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_risposte="select * from ct_risposte where fk_domanda=?";
												$dataset_risposte=eseguiQueryPrepareMany($query_risposte,$params);
												$params=[
													['value' => $id_esercizio],
													['value' => $id_studente],
													['value' => $row_domande["fk_domanda"]]
												]; 
												$query_rispostedate="select * from ct_esercizio_risposte where fk_esercizio=? and fk_studente=? and fk_domanda=?";
												$row_rispostedate=eseguiQueryPrepareOne($query_rispostedate,$params);
												?>
												<div class='row_form'>
												<input type="hidden" value="<?php echo $row_rispostedate["fk_risposta"]; ?>" name="rispdom_<?php echo $row_domande["fk_domanda"];?>" id="rispdom_<?php echo $row_domande["fk_domanda"];?>" />
												<div class="alert alert-warning" style="width:100%">
													<?php echo htmlspecialchars_decode(html_entity_decode($row_domande["domanda"])); ?>
												</div>
											</div><?php
												foreach($dataset_risposte as $row_risposta) {
													$back="";
												if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"] and $row_risposta["corretta"]==1) {
												$back="#5dfcb0";
												}
												else if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"] and $row_risposta["corretta"]==0) {
												$back="#f25b44";
												}
													
													?>
												<div class='row_form'>
												
													<div class="input-group input-group-icon" style="width:100%;">
														
														<input type="text" placeholder="risposta" id="risp" name="risp" style="width:100%;background-color:<?php echo $back; ?>" value="<?php echo $row_risposta["risposta"]; ?>" readonly />
														<div class="input-icon"><i id="icona_risp<?php echo $row_risposta["id_risposta"]; ?>" class="fa <?php echo $icona; ?>"></i></div>
													</div>
													
												</div>
											<?php 
											if($row_risposta["id_risposta"]==$row_rispostedate["fk_risposta"]) {
														echo "<script>seleziona_risp($row_rispostedate[fk_domanda],$row_rispostedate[fk_risposta])</script>";
													}
											}

											}
										}
										
										  
									  }else if($row["tipo"]=="Esercizio da consegnare") { ?>
									  <!-- Input con icona a sinistra -->
									  <div class="mb-3" >
										<label for="testo_esercizio" class="form-label">Testo dell'esercizio</label>
										<div class="input-group" >
										  <div id="testo_esercizio" name="testo_esercizio" class="alert alert-primary" style="font-size:2.5vh">
												<?php echo html_entity_decode($row["testo_esercizio"]); ?>
											</div>
										</div>
									  </div>
									  <?php if($num_rows_cons==0) { ?>
									  <div style="width:100%;">
									  <h2 style="text-align: center;">File Upload:</h2>
										<div id="dropzoneArea" class="dropzone"></div>
										<script>
										// Disattiva l'auto-discovery di Dropzone
										Dropzone.autoDiscover = false;

										// Inizializza Dropzone
										const dropzone = new Dropzone("#dropzoneArea", {
											url: "salva_consegna.php", // Endpoint server
											paramName: "file", // Nome del parametro del file
											autoProcessQueue: false, // Disabilita invio automatico
											maxFiles: 1, // Permette un solo file
											addRemoveLinks: true, // Aggiunge il pulsante per rimuovere i file
											dictDefaultMessage: "Trascina il file qui o clicca per aggiungerlo",
											dictMaxFilesExceeded: "Puoi caricare solo un file alla volta.",
											init: function () {
												const myDropzone = this;

												// Rimuovi il file precedente quando ne viene aggiunto uno nuovo
												this.on("addedfile", function (file) {
													if (myDropzone.files.length > 1) {
														myDropzone.removeFile(myDropzone.files[0]); // Rimuove il file precedente
													}
												});

												// Associa l'invio della form all'invio di Dropzone
												document.getElementById("form_capitolo").addEventListener("submit", function (event) {
													event.preventDefault();

													// Aggiunge i dati della form ai parametri di Dropzone
													myDropzone.on("sending", function (file, xhr, formData) {
														const formElements = document.getElementById("form_capitolo").elements;
														for (let i = 0; i < formElements.length; i++) {
															const element = formElements[i];
															if (element.name) {
																formData.append(element.name, element.value);
															}
														}
													});

													// Invia il file in coda (massimo 1 file)
													if (myDropzone.files.length > 0) {
														myDropzone.processQueue();
													} else {
														alert("Devi caricare un file prima di inviare la form!");
													}
												});

												// Mostra la risposta del server dopo il caricamento
												myDropzone.on("success", function (file, response) {
													// Mostra la risposta in un'area HTML
													//const responseContainer = document.getElementById("responseContainer");
													//responseContainer.textContent = response;

													// Puoi anche usare un alert, se preferisci
													alert("Risposta: " + response);
													document.getElementById("salva_risp").style.disabled=true;
												});

												// In caso di errore
												myDropzone.on("error", function (file, errorMessage) {
													console.error("Errore durante il caricamento:", errorMessage);
												});
											}
										});
									</script>
									</div>
									  <?php }
									else {	

									  ?>
									  <div class="mb-3" >
										<label for="file_consegnato" class="form-label">File consegnato</label>
										<div class="input-group" >
										  <div id="file_consegnato" class="alert alert-primary" style="font-size:2.5vh">
												<a href="<?php echo ($row_cons["file_consegnato"]); ?>" target="_blank"><?php echo ($row_cons["file_consegnato"]); ?></a>
											</div>
										</div>
									  </div>
									<?php } ?>
									  <!-- Input con icona a sinistra -->
									  <?php if($num_rows_cons==1 and $row_cons["valutato"]==1) { 
									  $params = [["value"=>$id_studente],["value"=>$id_esercizio],["value"=>$row_cons["id_consegna"]]];
									  $query_risp="select * from ct_esercizio_risposte where fk_studente=? and fk_esercizio=? and fk_consegna=?";
									  $row_risp=eseguiQueryPrepareOne($query_risp,$params);
									 ?>
									  <div id="commento" name="commento" style="width:80%;text-align:justify;vertical-align:top;" class="alert alert-info" >
										  <strong>Commento del prof:</strong> <?php echo html_entity_decode($row_risp["commento_prof"]); ?>
										  </div>
									  </div>
									<?php
									  }
									  }
								   if($num_rows_cons==0) { 
									?>
									<div class='row_form' style="margin-top:3vh;margin-bottom:3vh;text-align:center;">
										<div class="input-group input-group-icon" >
											<button id="salva_risp" class="btn btn-success btn-icon-split" style="width:40%;height:5vh;" >
												<span class="icon text-white-50">
													<i class="fas fa-save"></i>
												</span>
												<span class="text">Salva Risposta</span>
											</button>
										</div>
									</div>
									<?php }
									else if($num_rows_cons==1 and $row_cons["valutato"]==0) { 
									if($row["tipo"]!="Esercizio da consegnare") {
									?>
									<div class='row_form' style="margin-top:3vh;margin-bottom:3vh;text-align:center;">
										<div class="input-group input-group-icon" >
											<button id="salva_risp" class="btn btn-success btn-icon-split" style="width:40%;height:5vh;" >
												<span class="icon text-white-50">
													<i class="fas fa-save"></i>
												</span>
												<span class="text">Salva Risposta</span>
											</button>
										</div>
									</div>
									<?php
									}}
									else {
										?>
										<div class="mb-3" >
										<div class="input-group" >
										<?php
										$classe_voto="positivo";
										if($row_cons["valutazione"]<5)
											$classe_voto="negativo";
										else if($row_cons["valutazione"]>=5 and $row_cons["valutazione"]<=6)
											$classe_voto="medio";
										?>
										
										  <div id="valutazione" name="valutazione" style="padding-top:8vh;width:100%;text-align:center;" class="alert number-wordart-voto-<?php echo $classe_voto; ?>" >
										  La tua valutazione: <?php echo $row_cons["valutazione"]; ?>
										  </div>
										</div>
									  </div>
									  
										<?php
									}
									?>
								</form>
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