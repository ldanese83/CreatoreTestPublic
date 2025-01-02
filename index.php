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

      <form class="form-signin" role="form" action="login.php" method="POST">
        <h2 class="form-signin-heading">Login</h2>
        <label for="inputUser" class="sr-only">Username</label>
        <input type="text" id="inputUser" name="inputUser" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entra</button>
      </form>

		<div class="row">
			<div style="text-align:center;margin-top:2em;">Non sei registrato? <a href="registrazione.php">Registrati!</a></div>
		</div>

    </div> <!-- /container -->
	
  </body>
</html>