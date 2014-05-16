<?php echo '<?xml version="1.0" encoding="utf-8"?>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr-FR" lang="fr-FR">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link media="screen" href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/docs.css" type="text/css" rel="stylesheet" />
		<link media="screen" href="css/global.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js "></script>
		<title><?php echo $title; ?></title>
	</head>
	<body>
			
			<?php session_start(); ?>
			<div class="span6 offset5">
				<img src="./img/logo.png"  height="352" width="470"/>
				<form class="form-horizontal" action="index.php?module=connexion" method="POST">
				  <div class="control-group">
					<label class="control-label" for="login">Login</label>
					<div class="controls">
					  <input type="text" name="login" required placeholder="Login">
					</div>
				  </div>
				  <div class="control-group">
					<label class="control-label" for="mdp">Password</label>
					<div class="controls">
					  <input type="password" name="mdp" required placeholder="Password">
					</div>
				  </div>
				  <div class="control-group">
					<div class="controls">
					  <button type="submit" class="btn">Connexion</button>
					</div>
				  </div>
				</form>
			</div>
	</body>
</html>