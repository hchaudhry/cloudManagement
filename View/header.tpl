<?php echo '<?xml version="1.0" encoding="utf-8"?>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr-FR" lang="fr-FR">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link media="screen" href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/global.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/docs.css" type="text/css" rel="stylesheet" />
		<link type="text/css" rel="stylesheet" href="js/simplePagination/simplePagination.css"/>
		
		<style type="text/css">
			label.error {
				opacity:.7;
				filter:alpha(opacity=70);
				color:red;
			}
		</style>

		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/product.js"></script>
		<script type="text/javascript" src="js/client.js"></script>
		<script type="text/javascript" src="js/user.js"></script>	
		<script type="text/javascript" src="js/supplier.js"></script>
		<script type="text/javascript" src="js/simplePagination/jquery.simplePagination.js"></script>	
		<script type="text/javascript" src="js/jquery-validation.js"></script>
		<title><?php echo $title; ?></title>
		
	</head>
	<body>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="navbar navbar-inverse navbar-fixed-top">
					<div class="navbar-inner">

<!-- 						<a class="brand" href="index.php?module=indexStock">Accueil</a> -->
							<ul class="nav" role="navigation">
								<li class="dropdown">
									<a class="dropdown-toggle" href="index.php?module=home">Accueil</a>
								</li>
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
									  <li><a href="index.php?module=ajouteFournisseur">Ajout des fournisseurs</a></li>
									  <li><a href="index.php?module=listeSupplier">Liste des Fournisseurs</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">Clients <b class="caret"></b></a>
									<ul class="dropdown-menu" role="menu" >
									  <li><a href="index.php?module=ajouteClient">Ajout de Client</a></li>
									  <li><a href="index.php?module=listeClient">Liste des clients</a></li>
									</ul>
								</li>
								
								<?php if($_SESSION['isSupAdmin'] == 1){
									
										echo "<li class='dropdown'>";
										echo "<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Utilisateurs <b class='caret'></b></a>";
										echo "<ul class='dropdown-menu' role='menu'>";
									  	echo "<li><a href='index.php?module=ajoutUser'>Ajout des utilisateurs</a></li>";
									  	echo "<li><a href='index.php?module=listUsers'>Liste des utilisateurs</a></li>";
										echo "</ul>";
										echo "</li>";
									}
								?>
								
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
		

