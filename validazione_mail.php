 <?php
	include("./share/funzioni2_1.php");
	 
	$mail = $_GET["mail"];
	
	$valid1=0;
	
	$params=[
		['value' => $mail]
	]; 
	$row = eseguiQueryPrepareOne("select count(1) as tot from ct_utenti where email = ?",$params);
	  
	if($row["tot"]==0) $valid1=1;
	
	echo $valid1;
	
	
?>  