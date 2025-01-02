 <?php
	include("./share/funzioni2_1.php");
	 
	$username = $_POST["inputUser"];
	$password = $_POST["inputPassword"];
	 
	$params=[
		['value' => $username],
		['value' => md5($password)]
	]; 
	 
	$row = eseguiQueryPrepareOne("select count(1) as tot,id_utente from ct_utenti where username = ? and password=? and validato=1 group by id_utente",$params);
	
	if(!isset($row["tot"]) || $row["tot"]==0) {
	
	?>
	<html lang="it">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Creatore Test</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/signin.css" rel="stylesheet">

<body>

    <div class="container">
	
		<div class="alert alert-danger" role="alert">
			<p><strong>Errore</strong> Username o password errati, prego riprova ad effettuare il login</p>
			<p><a href="index.php">Indietro</a></p>
			</div>
		 </div> <!-- /container -->
	
  </body>
</html>					
<?php
	
}else {
	session_start();
	$_SESSION['Username']=$username;
	$_SESSION['id_utente']=$row["id_utente"];
	//echo $row["id_utente"];
	header('Location: home.php');
}
?>  