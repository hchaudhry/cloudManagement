<?php
class Controller_Client extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Client();
	}

	public function ajouteClient(){
		$title = "Cloud Management"; 
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/client/addClient.tpl';
		require 'View/footer.tpl';
	}

	public function addClient($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';

		$client = $this->selfModel->addClient($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);
		
		header('Location: index.php?module=listeClient');
	}

	public function getAllClient(){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';

		$clients = $this->selfModel->getAllClient();
		
		if ($clients == null) {
			$this->ajouteClient();
		}else {
			require 'View/header.tpl';
			require 'View/client/listeClient.tpl';
			require 'View/footer.tpl';
		}
	}

	public function updateClient($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$product = $this->selfModel->updateClient($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);

		$client = $this->selfModel->getClient($id);

		require 'View/header.tpl';
		require 'View/client/addClient.tpl';
		require 'View/footer.tpl';
	}

	public function getClient($id){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$client = $this->selfModel->getClient($id);
		
		if ($client == null) {
			$this->getAllClient();
		}else {
			require 'View/header.tpl';
			require 'View/client/addClient.tpl';
			require 'View/footer.tpl';
		}
	}	

	public function deleteClient($id){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$clientToDelete = $this->selfModel->deleteClient($id);

		header('Location: index.php?module=listeClient');
	}	
	
	
}

