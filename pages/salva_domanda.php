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

	
	<h3 style="text-align:center;">Inserimento nuova domanda</h3>
	
	
		<?php
		$dataset=eseguiQuery("select * from ct_utenti where username='$user'");	
		$row=$dataset->fetch_assoc();
		$id_utente = $row["id_utente"];
		
		$domanda = htmlentities($_POST["domanda"],ENT_QUOTES);
		$punti = $_POST["punti"];
		$id_argomento =  $_POST["id_argomento"];
		$libro = $_POST["libro"];
		$tipo_domanda = $_POST["tipo_domanda"];
		$num_righe="0";
		$num_gruppo = $_POST["num_gruppo"];
		if(isset($_POST["num_righe"])) $num_righe = $_POST["num_righe"];
		if(isset($_POST["ese_num"])) $ese_num = htmlentities($_POST["ese_num"],ENT_QUOTES);
		else $ese_num="";
		
		$livello_diff = $_POST["livello_diff"];
		
		if($num_righe=="" || $num_righe==null) $num_righe="0";
		$risposta="";
		$corretta="";
		if(isset($_POST["risposta"])) $risposta = $_POST["risposta"];
		if(isset($_POST["corretta"])) $corretta = $_POST["corretta"];
		
		$query = "INSERT INTO ct_domande(domanda, punti, fk_argomento, fk_tipo_domanda, num_righe, num_gruppo, fk_libro, fk_utente, data_creazione,ese_num,livello_diff) VALUES('$domanda',";
		$query.= "$punti,$id_argomento,$tipo_domanda,$num_righe,$num_gruppo,$libro,$id_utente,'".Date("Y-m-d")."','$ese_num',$livello_diff)";
		
		//echo $query;
		
		$id_domanda = eseguiInsert($query);
		
		eseguiQuery("insert into ct_utente_domande(fk_utente,fk_domanda) values($id_utente,$id_domanda)");
		
		if($tipo_domanda==2 || $tipo_domanda==3) {
			for($i=0;$i<sizeof($risposta);$i++) {
				
				$corr=0;
				$risp = htmlentities($risposta[$i],ENT_QUOTES);
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
			DOMANDA SALVATA CORRETTAMENTE <br /><br /><a href="domande_all.php?id_argomento=<?php echo $id_argomento; ?>" style="">BACK</a>
			</div>
		
		</div>
		
		
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
