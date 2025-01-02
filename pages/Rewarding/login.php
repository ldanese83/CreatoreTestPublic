 <?php
	include("../../share/funzioni2_1.php");
	 
	$username = $_POST["username"];
	$password = $_POST["pass"];
	 
	$params=[
		['value' => $username],
		['value' => sha1($password)]
	]; 
	 
	$row = eseguiQueryPrepareOne("select count(1) as tot,id_utente from ct_utenti where username = ? and password=? and fk_tipo_utente=2",$params);
	
	if(!isset($row["tot"]) || $row["tot"]==0) {
	
	header('Location: index.php?error=si');
	
}else {
	session_start();
	$_SESSION['Username']=$username;
	$_SESSION['id_utente']=$row["id_utente"];
	//echo $row["id_utente"];
	header('Location: homepage_studente.php');
}
?>  