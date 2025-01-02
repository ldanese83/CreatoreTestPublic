 <?php
	include("./share/funzioni2_1.php");
	 
	$id_user = $_GET["id_user"];
	$codice = $_GET["codice"];
	
	$params=[$codice,$id_user];
	
	eseguiUpdatePrepare("update ct_utenti set validato=1 where codice_conf=:c0 and id_utente=:c1",$params);
	
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
	
		<div class="alert alert-success" role="alert">
			<p><strong>Validazione</strong> utente effettuata con successo, d'ora in poi è possibile utilizzare il sito</p>
			<p><a href="index.php">Login</a></p>
			</div>
		 </div> <!-- /container -->
	
  </body>
</html>				