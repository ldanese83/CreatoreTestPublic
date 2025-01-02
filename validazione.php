 <?php
	include("./share/funzioni2_1.php");
	 
	$user = $_GET["user"];
	
	$valid1=0;
	
	$params=[
		['value' => $user]
	]; 
	$row = eseguiQueryPrepareOne("select count(1) as tot from ct_utenti where username =?",$params);
	
	if($row["tot"]==0) $valid1=1;
	
	echo $valid1;
	
	
?>  