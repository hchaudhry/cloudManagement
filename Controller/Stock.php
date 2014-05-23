<?php
class Controller_Stock extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Product();
	}
	
	public function index() {
		//On affiche la page d'accueil
		require 'view/header.tpl';
		require 'view/index/index.tpl';
		require 'view/footer.tpl';
	}

	public function ajouteStock(){
		$title = "Ajout de Stock";
		//$users = $this->selfModel->getAll(); 
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Stock/ajouteStock.tpl';
		require 'View/footer.tpl';
	}

	public function addProduct($reference, $nom, $commentaire, $quantite, $seuil){
		$title = "Ajout de Stock";

		$stock = $this->selfModel->addProduct($reference, $nom, $commentaire, $quantite, $seuil);
		
		// require 'View/header.tpl';
		// require 'View/index/index.tpl';
		// require 'View/footer.tpl';
		header('Location: index.php?module=indexStock');
	}

	public function getAllProduct(){
		$title = "Cloud Management";

		$stock = $this->selfModel->getAllProduct();

		require 'View/header.tpl';
		require 'View/index/index.tpl';
		require 'View/footer.tpl';
	}

	public function updateProduct($id, $reference, $nom, $commentaire, $quantite, $seuil){
		$title = "Cloud Management";
		$product = $this->selfModel->updateProduct($id, $reference, $nom, $commentaire, $quantite, $seuil);

		$stock = $this->selfModel->getProduct($id);

		require 'View/header.tpl';
		require 'View/Stock/ajouteStock.tpl';
		require 'View/footer.tpl';
	}

	public function getProduct($id){
		$title = "Cloud Management";
		$stock = $this->selfModel->getProduct($id);

		require 'View/header.tpl';
		require 'View/Stock/ajouteStock.tpl';
		require 'View/footer.tpl';
	}	

	public function deleteProduct($id){
		$title = "Cloud Management";
		$productToDelete = $this->selfModel->deleteProduct($id);

		header('Location: index.php?module=indexStock');
	}

	public function getQuantityEqualLimit(){
		$title = "Cloud Management";
		$stock = $this->selfModel->getQuantityEqualLimit();
		
		return var_dump($stock);
	}
	
	
}

