<?php echo '<?xml version="1.0" encoding="utf-8"?>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr-FR" lang="fr-FR">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link media="screen" href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/global.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/docs.css" type="text/css" rel="stylesheet" />

		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js "></script>
		<script type="text/javascript" src="js/product.js "></script>
		<script type="text/javascript" src="js/client.js "></script>		
		<title><?php echo $title; ?></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="navbar navbar-inverse navbar-fixed-top">
					<div class="navbar-inner">

						<a class="brand" href="index.php?module=indexStock">Accueil</a>
							<ul class="nav" role="navigation">
								<!--<li class="dropdown">
											<a class="dropdown-toggle" data-toggle="dropdown" href="#">Mon Compte<b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu" >
											  <li><a href="modifCompte.php">Modifier mes informations</a></li>
											  <li><a href="supprCompte.php">Supprimer mon compte</a></li>
											</ul>
										</li>-->
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">Stocks <b class="caret"></b></a>
									<ul class="dropdown-menu" role="menu" >
									  <li><a href="index.php?module=ajouteStock">Ajout de Stock</a></li>
									  <li><a href="index.php?module=indexStock">Liste des stocks</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">Fournisseurs <b class="caret"></b></a>
									<ul class="dropdown-menu" role="menu" >
									  <li><a href="ajoutFournisseurs.php">Ajout des fournisseurs</a></li>
									  <li><a href="<?php echo ROOT_URL; ?>?module=fournisseurs">Liste des Fournisseurs</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">Clients <b class="caret"></b></a>
									<ul class="dropdown-menu" role="menu" >
									  <li><a href="index.php?module=ajouteClient">Ajout de Client</a></li>
									  <li><a href="index.php?module=listeClient">Liste des clients</a></li>
									</ul>
								</li>
									<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">Utilisateurs <b class="caret"></b></a>
									<ul class="dropdown-menu" role="menu" >
									  <li><a href="ajoutUtilisateurs.php">Ajout des utilisateurs</a></li>
									  <li><a href="<?php echo ROOT_URL; ?>?module=users">Liste des utilisateurs</a></li>
									</ul>
								</li>
								
							</ul>
							<div class="navbar-form pull-right">
							<ul class="nav">	
							<li class="divider-vertical">
									<form class="form-inline"  method="post" action="index.php?module=deconnexion">
										<button id="deco-btn" class="btn" name="deco" value="deco" type="submit">Déconnexion</button>
									</form>
								</li>
							</ul>
							</div>
						</div>
					</div>

				<div class="hero-unit"><h1>Cloud-Management</h1></div>
			</div>	
		

