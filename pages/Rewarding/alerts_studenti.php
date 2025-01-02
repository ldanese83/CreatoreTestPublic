<!-- Nav Item - Alerts -->
<?php
$id_classe=$_SESSION["id_classe"];
$params=[
	['value' => $id_utente],
	['value' => $id_classe]
]; 
$query_stud="select * from ct_studenti inner join ct_studenti_classi on id_studente=fk_studente where fk_utente=? and fk_classe=?";
$row_stud=eseguiQueryPrepareOne($query_stud,$params);
$id_studs=$row_stud["id_studente"];
$params=[
	['value' => $id_classe],
	['value' => $id_studs]
]; 
$row_count=eseguiQueryPrepareOne("select count(*) as tot from ct_alerts where fk_classe=? and letto=0 and doc_stud=1 and fk_studente=?",$params);
?>
<script type="text/javascript" src="./js/alerts.js"></script>
<li class="nav-item dropdown no-arrow mx-1">
	<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<i class="fas fa-bell fa-fw"></i>
		<!-- Counter - Alerts -->
		<span class="badge badge-danger badge-counter"><?php 
			if($row_count["tot"]>0) {
				echo $row_count["tot"];
			}
		?>
		</span>
	</a>
	<!-- Dropdown - Alerts -->
	<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
		aria-labelledby="alertsDropdown">
		<h6 class="dropdown-header">
			Alerts Center
		</h6>
		<?php
		
		$params = [["value"=>$id_classe],
		["value"=>$id_studs]];
		$resulta=eseguiQueryPrepareMany("select * from ct_alerts where fk_classe=? and letto=0 and doc_stud=1 and fk_studente=? order by data_alert desc",$params);
		foreach($resulta as $rowa) {
			echo "<a class=\"dropdown-item d-flex align-items-center\" href='#' onclick=read_alert($rowa[id_alert],'$rowa[link]')>";
			echo "<div class=\"mr-3\">";
			switch($rowa["tipologia"]) {
			
				case "ValutazioneEsercizio":
					echo "<div class=\"icon-circle bg-warning\">";
					echo "<i class=\"fas fa-wrench text-white\"></i></div>";
					break;
				case "SaliLivello":
					echo "<div class=\"icon-circle bg-success\">";
					echo "<i class=\"fas fa-trophy text-white\"></i></div>";
					break;
					
			}
			echo "</div>";
			echo "<div>";
			$phpdate = strtotime( $rowa["data_alert"] ); 
			echo "<div class=\"small text-gray-500\">".ottieniData($phpdate)."</div>";
			echo "<span class=\"font-weight-bold\">".html_entity_decode($rowa["testo"])."</span>";
			echo "</div></a>";
			
		}
		?>
		<a class="dropdown-item text-center small text-gray-500" href="all_alerts.php">Show All Alerts</a>
	</div>
</li>