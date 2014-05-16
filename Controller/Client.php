<?php
class Controller_Client extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Client();
	}
	
	// public function index() {
	// 	require 'view/header.tpl';
	// 	require 'view/index/index.tpl';
	// 	require 'view/footer.tpl';
	// }

	public function ajouteClient(){
		$title = "Cloud Management"; 
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/client/addClient.tpl';
		require 'View/footer.tpl';
	}

	public function addClient($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";

		$client = $this->selfModel->addClient($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);
		
		header('Location: index.php?module=listeClient');
	}

	public function getAllClient(){
		$title = "Cloud Management";

		$clients = $this->selfModel->getAllClient();

		require 'View/header.tpl';
		require 'View/client/listeClient.tpl';
		require 'View/footer.tpl';
	}

	public function updateClient($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		$product = $this->selfModel->updateClient($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);

		$client = $this->selfModel->getClient($id);

		require 'View/header.tpl';
		require 'View/client/addClient.tpl';
		require 'View/footer.tpl';
	}

	public function getClient($id){
		$title = "Cloud Management";
		$client = $this->selfModel->getClient($id);

		require 'View/header.tpl';
		require 'View/client/addClient.tpl';
		require 'View/footer.tpl';
	}	

	public function deleteClient($id){
		$title = "Cloud Management";
		$clientToDelete = $this->selfModel->deleteClient($id);

		header('Location: index.php?module=listeClient');
	}	
	
	
}

