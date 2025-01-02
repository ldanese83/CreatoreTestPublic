<?php
session_start();
if (!isset($_SESSION['Username']))
{
  echo "Non hai l'autorizzazione per entrare in questa pagina. Sessione scaduta.";
  echo "<br /><br /><a href='index.php'>Back to login</a>";
}
  
else{
?>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it" >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>Creatore Test</title>
		<script language="javascript">
			window.location.href = "pages/index.php"
		</script>
	</head>
	<body>
		Go to <a href="pages/index.php">/pages/index.php</a>
	</body>
	</html>
<?php
}
?>