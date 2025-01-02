	<!DOCTYPE html>
	<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="Danese Luca">

		<title>System Rewarding</title>

		<!-- Custom fonts for this template-->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
		<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

		<!-- Custom styles for this template-->
		<link href="css/sb-admin-2.css" rel="stylesheet">
		
		<!-- Custom styles for heders-->
		<link href="css/headers.css" rel="stylesheet">

	</head>

	<body id="page-top">

		<!-- Page Wrapper -->
		<div id="wrapper">

			<!-- Sidebar -->
			<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

				<!-- Sidebar - Brand -->
				<a class="sidebar-brand d-flex align-items-center justify-content-center" href="homepage_docente.php">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-laugh-wink"></i>
					</div>
					<div class="sidebar-brand-text mx-3">System Rewarding</div>
				</a>

				<!-- Divider -->
				<hr class="sidebar-divider my-0">

				<!-- Nav Item - Dashboard -->
				<li class="nav-item active">
					<a class="nav-link" href="homepage_docente.php">
						<i class="fas fa-fw fa-tachometer-alt"></i>
						<span>Dashboard</span></a>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">
					Menu
				</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="true" aria-controls="collapseTwo">
						<i class="fas fa-fw fa-cog"></i>
						<span>Studenti</span>
					</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="lista_studenti.php">Lista studenti</a>
							<a class="collapse-item" href="import_studenti.php">Importa Studenti</a>
						</div>
					</div>
				</li>

				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseQuest"
						aria-expanded="true" aria-controls="collapseQuest">
						<i class="fas fa-fw fa-map"></i>
						<span>Quest</span>
					</a>
					<div id="collapseQuest" class="collapse" aria-labelledby="headingQuest"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="all_quest.php">Vedi Quest</a>
							<a class="collapse-item" href="quest_import.php">Importa Quest</a>
						</div>
					</div>
				</li>
				
				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBadges"
						aria-expanded="true" aria-controls="collapseBadges">
						<i class="fas fa-fw fa-trophy"></i>
						<span>Badge</span>
					</a>
					<div id="collapseBadges" class="collapse" aria-labelledby="headingBadges"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="utilities-color.html">Vedi Badge</a>
							<a class="collapse-item" href="utilities-color.html">Importa Badge</a>
						</div>
					</div>
				</li>
				
				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePowers"
						aria-expanded="true" aria-controls="collapsePowers">
						<i class="fas fa-fw fa-bolt"></i>
						<span>Poteri</span>
					</a>
					<div id="collapsePowers" class="collapse" aria-labelledby="headingPowers"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="utilities-color.html">Vedi Poteri</a>
							<a class="collapse-item" href="utilities-color.html">Importa Poteri</a>
						</div>
					</div>
				</li>
				
				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCharacters"
						aria-expanded="true" aria-controls="collapseCharacters">
						<i class="fas fa-fw fa-user"></i>
						<span>Personaggi</span>
					</a>
					<div id="collapseCharacters" class="collapse" aria-labelledby="headingCharacters"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="utilities-color.html">Vedi Personaggi</a>
							<a class="collapse-item" href="utilities-color.html">Importa Personaggi</a>
						</div>
					</div>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider d-none d-md-block">

				<!-- Sidebar Toggler (Sidebar) -->
				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>

			</ul>
			<!-- End of Sidebar -->
