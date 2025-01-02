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
			<div class="row">

	
	<h3 style="text-align:center;">Modifica domanda</h3>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		$ese_num="";
		$domanda = htmlentities($_POST["domanda"],ENT_QUOTES);
		if(isset($_POST["ese_num"])) $ese_num = htmlentities($_POST["ese_num"],ENT_QUOTES);
		$punti = $_POST["punti"];
		$id_domanda =  $_POST["id_domanda"];
		$libro = $_POST["libro"];
		$tipo_domanda = $_POST["tipo_domanda"];
		$num_gruppo = $_POST["num_gruppo"];
		$livello_diff = $_POST["livello_diff"];
		$num_righe="0";
		if(isset($_POST["num_righe"])) $num_righe = $_POST["num_righe"];
		if($num_righe=="" || $num_righe==null) $num_righe="0";
		$risposta="";
		$corretta="";
		if(isset($_POST["risposta"])) $risposta = $_POST["risposta"];
		if(isset($_POST["corretta"])) $corretta = $_POST["corretta"];
		
		$dataset5 = eseguiQuery("select * from ct_domande where id_domanda = $id_domanda");
		$row5=$dataset5->fetch_assoc();
		$id_argomento = $row5["fk_argomento"];
		if($row5["fk_utente"]==$id_utente) {
		
			$query = "UPDATE ct_domande SET livello_diff=$livello_diff,num_gruppo=$num_gruppo,domanda='$domanda', punti=$punti, num_righe=$num_righe, fk_libro=$libro, ese_num='$ese_num' WHERE id_domanda=$id_domanda";
			
			//echo $query;
			
			eseguiQuery($query);
			
			if($tipo_domanda!=1 && $tipo_domanda!=4) {
				
				eseguiQuery("DELETE FROM ct_risposte WHERE fk_domanda=$id_domanda");
				
				for($i=0;$i<sizeof($risposta);$i++) {
					
					$corr=0;
					$risp = htmlentities($risposta[$i],ENT_QUOTES);
					//$risp= htmlspecialchars($risp);
					if($corretta[$i]=="si") $corr=1;
					
					$query_risp = "INSERT INTO ct_risposte(risposta,corretta,fk_domanda) VALUES(";
					$query_risp.= "'$risp',$corr,$id_domanda)";
					
					eseguiQuery($query_risp);
					
					//echo "<br /><br />".$query_risp;
					
				}
			}
			
		
		?>
		<div class="col-md-12" >
						
			<div class="alert alert-info" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
			DOMANDA MODIFICATA CORRETTAMENTE <br /><br /><a href="domande_all.php<?php echo "?id_argomento=$id_argomento"; ?>" style="">BACK</a>
			</div>
		
		</div>
		
		<?php }
		else {
			
			eseguiQuery("DELETE FROM ct_utente_domande WHERE fk_domanda = $id_domanda and fk_utente = $id_utente");
			
			$query = "INSERT INTO ct_domande(domanda, punti, fk_argomento, fk_tipo_domanda, num_righe, num_gruppo, fk_libro, fk_utente, data_creazione,ese_num) VALUES('$domanda',";
			$query.= "$punti,$row5[fk_argomento],$row5[fk_tipo_domanda],$num_righe,$num_gruppo,$libro,$id_utente,'".Date("Y-m-d")."','$ese_num')";
			
			$id_nuova=eseguiInsert($query);
			
			eseguiQuery("INSERT INTO ct_utente_domande(fk_utente,fk_domanda) VALUES($id_utente,$id_nuova)");
			
			if($tipo_domanda!=1 && $tipo_domanda!=4) {
				
				for($i=0;$i<sizeof($risposta);$i++) {
					
					$corr=0;
					$risp = htmlentities($risposta[$i],ENT_QUOTES);
					//$risp= htmlspecialchars($risp);
					if($corretta[$i]=="si") $corr=1;
					
					$query_risp = "INSERT INTO ct_risposte(risposta,corretta,fk_domanda) VALUES(";
					$query_risp.= "'$risp',$corr,$id_nuova)";
					
					eseguiQuery($query_risp);
					
					//echo "<br /><br />".$query_risp;
					
				}
			}
			
			
			?>
			<div class="col-md-12" >
						
			<div class="alert alert-warning" role="alert" style="text-align:center;font-size:13pt;font-weight:bold;">
			DOMANDA MODIFICATA CORRETTAMENTE CREANDO UNA COPIA DELL'ORIGINALE (Originale di nuovo disponibile per l'import)<br /><br /><a href="domande_all.php<?php echo "?id_argomento=$id_argomento"; ?>" style="">BACK</a>
			</div>
		
			</div>
			<?php
		}
		?>
		
		
        <!-- /#page-wrapper -->
		</div>
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
