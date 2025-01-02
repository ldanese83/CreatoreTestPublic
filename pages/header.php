<?php
session_start();
if (!isset($_SESSION['Username']))
{
  echo "Non hai l'autorizzazione per entrare in questa pagina. Sessione scaduta.";
  echo "<br /><br /><a href='../index.php'>Back to login</a>";
}
else{
	$user = $_SESSION['Username'];
	$id_utente = $_SESSION['id_utente'];
	include("../share/funzioni2_1.php");
?>
<!DOCTYPE html>
<html lang="it">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Danese Luca">

    <title>Creatore Test</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">
	
	<!-- CSS -->
    <link href="../css/admin.css" rel="stylesheet">
	<link href="../css/form.css" rel="stylesheet">
	
	<link href="../../css/main.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<style>
	.filterable {
		margin-top: 15px;
	}
	.filterable .panel-heading .pull-right {
		margin-top: -20px;
	}
	.filterable .filters input[disabled] {
		background-color: transparent;
		border: none;
		cursor: auto;
		box-shadow: none;
		padding: 0;
		height: auto;
	}
	.filterable .filters input[disabled]::-webkit-input-placeholder {
		color: #333;
	}
	.filterable .filters input[disabled]::-moz-placeholder {
		color: #333;
	}
	.filterable .filters input[disabled]:-ms-input-placeholder {
		color: #333;
	}
	</style>

</head>

<body>

    <div id="wrapper">
	
		<script src="../js/filtri.js" ></script>

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Creatore Test</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="dati_amministratore.php"><i class="fa fa-user fa-fw"></i> Profilo utente</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                         <li>
                            <a href="index.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Home Page</a>
                        </li>
						<li>
                            <a href="materie.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Materie</a>
                        </li>
						<li>
                            <a href="argomenti.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Argomenti</a>
                        </li>
						<li>
                            <a href="domande.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Domande</a>
                        </li>
						<li>
                            <a href="quiz.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Quiz</a>
                        </li>
						<li>
                            <a href="libri.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Libri</a>
                        </li>
						<li>
                            <a href="griglie.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Griglie di Valutazione</a>
                        </li>
						<li>
                            <a href="import.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Import domande</a>
                        </li>
						<li>
                            <a href="export_kahoot.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Esporta per Kahoot</a>
                        </li>
						<li>
                            <a href="classi_all.php" style="font-weight:bold;"><i class="fa fa-image fa-fw" style="margin-right:5px;"></i>Le mie classi</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
<?php } ?>