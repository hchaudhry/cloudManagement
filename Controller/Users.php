<?php
class Controller_Users extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Users();
	}

	public function index(){
		$title = "Liste des Users";
		$users = $this->selfModel->getAll(); 
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Users/index.tpl';
		require 'View/footer.tpl';
	}
	
	public function display($id){
		$Users = $this->selfModel->getById($id);
		if(empty($Users)){
			Controller_Error::documentNotFound("Pas d'utilisateurs correspondants dans la base !");
		}
		else{
			$title = $Users['loginEtu'];
			header('Content-Type: text/html; charset=utf-8');
			require 'View/header.tpl';
			require 'View/book/display.tpl';
			require 'View/footer.tpl';
		}
	}
	
	public function connexion($login, $mdp){
		$title = utf8_decode("Cloud Management"); 
		// $title pourra être utilisé dans les scripts et les templates incorporé dans ce script PHP par les fonctions "include" ou "require"
		header('Content-Type: text/html; charset=utf-8');
		//Si un login et un mot de passe ont été saisi
		if (isset($login) && isset($mdp)) {
			//On exécute la requête
			$connexion = $this->selfModel->getByLoginEtMotDePass($login,$mdp);
			
			//Si la requête n'a pas échoué
			if(!empty($connexion)){
				
				//sauvegarde des identifiants
				$_SESSION['login']=$login;
				$_SESSION['mdp']= $mdp;
						
				//On affiche la page d'accueil
				// require 'View/header.tpl';
				// require 'View/index/index.tpl';
				// require 'View/footer.tpl';
				header('Location: index.php?module=indexStock');
			} else {
				//On réaffiche le formulaire de saisie
				require 'View/head_boots.tpl';
				require 'View/error/erreur.tpl';
				require 'View/foot_boots.tpl';
			}
		} else {
			require 'View/head_boots.tpl';
			require 'View/Users/connexion.tpl';
			require 'View/foot_boots.tpl';
		}
	}
}

