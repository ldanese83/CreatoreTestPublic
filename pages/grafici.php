<?php
@include("header.php");
if (!isset($_SESSION['Username_Admin']))
{
 
}
else{
	$admin = $_SESSION['Username_Admin'];
	//include("../share/funzioni2_0.php");
	$dataset=eseguiQuery("SELECT * FROM azioni ORDER BY id_azione ASC");
	if(isset($_GET["id_azione"])) {
		$id_azione = $_GET["id_azione"];
		$data_da = $_GET["data_da"];
		$data_a = $_GET["data_a"];
	}
	else {
		$id_azione=1;
		$data_da='2014-07-01';
		$data_a='2015-12-31';
	}
?>
		
		<div id="page-wrapper">
			
			<div style="text-align:center;width:100%;padding:10px;margin-bottom:20px;">
				<form action="grafici.php" method="GET">
					<div class="row">
					
						<div class="col-md-2">
							<select name="id_azione" id="id_azione">
							
								<?php
								while($row=($dataset->fetch_assoc())) {
									?>
									<option value='<?php echo $row["id_azione"];?>'><?php echo $row["codice_azione"]."-".$row["nome_azione"]; ?></option>
									<?php	
								}
								?>
							
							</select>
						</div>
					
						<div class="col-md-2">
							<label>Data da</label>
						</div>
						<div class="col-md-2">
							<input type="date" name="data_da" id="data_da" value='2014-07-01' />
						</div>
				
						<div class="col-md-2">
							<label>Data a</label>
						</div>
						<div class="col-md-2">
							<input type="date" name="data_a" id="data_a" value='2015-12-31' />
						</div>
				
						<div class="col-md-2">
						
							<input type="submit" value="STORICO" class="btn btn-success" />
						
						</div>
						
					</div>
				</form>
			
			</div>
			
			<div class="row">
				<div class="col-md-12" style="text-align:center;">
					<iframe width="1400" height="1000" src="creaGrafico.php?id_azione=<?php echo $id_azione;?>&data_da=<?php echo $data_da;?>&data_a=<?php echo $data_a;?>"></iframe>
				</div>
			</div>
			
		</div>
        <!-- /#page-wrapper -->
	</div>
  

</body>

</html>
<?php
}
?>
