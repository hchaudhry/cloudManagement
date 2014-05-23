<?php
/*
 * Ce fichier sert à lire la requête envoyée par un client (l'URL donc), et instancier les classes Contrôleur correspondantes
 * De ce fait, il faut vérifier les valeurs passées dans l'URL (variable $_GET en PHP) et s'assurer qu'elles sont bien écrites avant de réaliser les instanciations.
 * Plusieurs valeurs successives peuvent être utilisées, mais il faut bien faire attention à gérer tout les cas, notamment les cas par défaut lorsqu'on utilise l'instruction switch de PHP. 
 */
define("PROD_ROOT", "localhost:82/gestionstock/"); 
define("PROD_ROOT_LONG", "localhost:82/gestionstock/"); 


define("ROOT", PROD_ROOT); 
define("ROOT_URL", ROOT.'index.php');
define("ROOT_LONG", PROD_ROOT_LONG); 

set_include_path(get_include_path() . PATH_SEPARATOR . ROOT_LONG);

require 'functions.php';
spl_autoload_register('generic_autoload');


// Instanciation de la connexion à la BDD
Controller_Template::$db = new MyPDO('mysql:host=localhost;dbname=gestionstock', 'root', 'demo');


// GESTION UTILISATEUR


// Analyse de la requête
if(empty($_GET) OR empty($_GET['module'])){
	$controller = Controller_Index::getInstance('Index');
	$controller->index();
}
else{
	switch($_GET['module']){
		
		case 'home':
			$controller = Controller_Stock::getInstance('Stock');
			$controller->getAllProduct();
		break;
	
		case 'tableau':
		
		break;
	 	case 'users': //l'url
			$controller = Controller_Users::getInstance('Users'); //fichiers php
			$controller->index();
			break;
			
		case 'connexion':
			$controller = Controller_Users::getInstance('Users'); //fichiers php
			$login = $_POST['login'];
			$mdp = $_POST['mdp'];
			$controller->connexion($login, $mdp);
		break;
		
		case 'deconnexion':
			session_unset();
			$controller = Controller_Index::getInstance('Index'); //fichiers php
			$controller->index();
			exit();
			break;
		
		case 'indexStock':
			$controller = Controller_Stock::getInstance('Stock');
			$controller->getAllProduct();
		break;
		
		case 'ajouteStock':
			$controller = Controller_Stock::getInstance('Stock');
			$controller->ajouteStock();
		break;

		case 'addStock':
			$controller = Controller_Stock::getInstance('Stock');
			if(empty($_POST['id'])){
				$controller->addProduct($_POST['ref'], $_POST['nom'], $_POST['commentaires'], $_POST['qte'], $_POST['seuil']);
			}else{
				// modification d'un produit
				$controller = Controller_Stock::getInstance('Stock');
				$controller->updateProduct($_POST['id'], $_POST['ref'], $_POST['nom'], $_POST['commentaires'], $_POST['qte'], $_POST['seuil'] );
			}
			
		break;

		case 'getProduct':
			$controller = Controller_Stock::getInstance('Stock');
			$controller->getProduct($_GET['id']);
		break;

		case 'deleteProduct':
			$controller = Controller_Stock::getInstance('Stock');
			$controller->deleteProduct($_GET['id']);
		break;

		// Cleint
		case 'listeClient':
			$controller = Controller_Client::getInstance('Client');
			$controller->getAllClient();
		break;

		case 'ajouteClient':
			$controller = Controller_Client::getInstance('Client');
			$controller->ajouteClient();
		break;

		case 'addClient':
			$controller = Controller_Client::getInstance('Client');
			if(empty($_POST['id'])){
				$controller->addClient($_POST['nom'], $_POST['societe'], $_POST['adresse'], $_POST['ville'], $_POST['code-postal'], $_POST['telephone'], $_POST['email']);
			}else{
				// modification d'un client
				$controller = Controller_Client::getInstance('Client');
				$controller->updateClient($_POST['id'], $_POST['nom'], $_POST['societe'], $_POST['adresse'], $_POST['ville'], $_POST['code-postal'], $_POST['telephone'], $_POST['email']);
			}
			
		break;

		case 'getClient':
			$controller = Controller_Client::getInstance('Client');
			$controller->getClient($_GET['id']);
		break;

		case 'deleteClient':
			$controller = Controller_Client::getInstance('Client');
			$controller->deleteClient($_GET['id']);
		break;
		
		case 'station':
			if (!empty($_GET['action'])) {
				switch ($_GET['action']) {

					// Pour certaine action, on a besoin d'identifier un objet de la BDD par son identifiant
					case 'display':
						if(!empty($_GET['idSta']) && ctype_digit($_GET['idSta'])) {
							$controller = Controller_Station::getInstance('station');
							$controller->display($_GET['idSta']);
						}
						else{
							Controller_Error::documentNotFound("Problème d'écriture de la requête (ID non valide)");
						}
						break;

					default:
						Controller_Error::documentNotFound("Problème d'écriture de la requête (ACTION non valide)");
						break;
				}
			}
			else {
				Controller_Error::documentNotFound("Problème d'écriture de la requête (ACTION non spécifiée)");
			}
			break;

			

		default:
			$controller = Controller_Index::getInstance('Index');
			$controller->index();
	}
}
?>