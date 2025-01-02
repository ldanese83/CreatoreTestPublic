 <?php
	include("./share/funzioni2_1.php");
	 
	$comb = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	$shfl = str_shuffle($comb);
	$codice = substr($shfl,0,8);
 
	//prendere i dati e salvarli su db 
	$ok1=0;
	$ok2=0;
	$ok3=0;
	 
	$nome = $_POST["validationCustom01"];
	$cognome = $_POST["validationCustom02"];
	$username = $_POST["validationCustomUsername"];
	$email = $_POST["validationCustom03"];
	$pass1 = $_POST["validationCustom04"];
	$pass2 = $_POST["validationCustom05"];
	
	$params=[
		['value' => $email]
	]; 
	$row = eseguiQueryPrepareOne("select count(1) as tot from ct_utenti where email =?",$params);
	
	if($row["tot"]==0) $ok1=1;
	
	$params=[
		['value' => $username]
	]; 
	$row = eseguiQueryPrepareOne("select count(1) as tot from ct_utenti where username =?",$params);
	
	if($row["tot"]==0) $ok2=1;
	
	if($pass1==$pass2) $ok3=1;
	
	$message="";
	
	if($ok1==1 and $ok2==1 and $ok3==1) {
		
		$params=[
			$nome, $cognome, $username, md5($pass1),$email,$codice,0
		]; 
		
		$id_utente = eseguiInsertPrepare("insert into ct_utenti(nome,cognome,username,password,email,codice_conf,validato) values ",$params);
		$params=[
			$id_utente,1
		]; 
		eseguiInsertPrepare("insert into ct_utenti_tipi(fk_utente, fk_tipo_utente) values ",$params);
		$message ="Utente <strong>$username</strong> salvato correttamente. E' stata inviata una mail di convalida all'indirizzo indicato. <br />";
		$message.="Cliccare il link all'interno della mail per <strong>validare l'accesso</strong>. <br />";
		$message.="Una volta validato sarà possibile eseguire il login al sito.";
		$testo="<h1>Mail da Creatore Test</h1><p>E' appena stato creato l'utente: <br/>$username su Creatore Test.</p><p>Clicca sul link seguente per la validazione dell'utente:</p>";
		$testo.="<br/><p><a href='http://lnx.incognitaelephantes.it/CreatoreTest/valida_utente.php?id_user=$id_utente&codice=$codice'>VALIDAZIONE UTENTE</a></p>";
		$testo.="<br/><br /><p>Grazie per aver effettuato la registrazione</p>";
		$oggetto = "Validazione utente Creatore Test";
		$from = "noreply@CreatoreTest.it";
		inviaMail($testo,$oggetto,$from,$email);
	}
	if($ok1==0) $message = "Email già in uso, torna alla registrazione";
	if($ok2==0) $message = "Username già in uso, torna alla registrazione";
	if($ok3==0) $message = "Le password immesse non coincidono, torna alla registrazione";
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
	
		<div class="alert alert-info" role="alert">
			<p><?php echo $message; ?></p>
			<p><a href="index.php">Login</a></p>
			</div>
		 </div> <!-- /container -->
	
  </body>
</html>				