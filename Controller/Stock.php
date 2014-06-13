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
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Stock/ajouteStock.tpl';
		require 'View/footer.tpl';
	}

	public function addProduct($reference, $nom, $commentaire, $quantite, $prix, $seuil, $seuilactif){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$stock = $this->selfModel->addProduct($reference, $nom, $commentaire, $quantite, $prix, $seuil, $seuilactif);
		
		$stockId = $this->selfModel->getLastId();
		
		$sale = $this->selfModel->getSale($stockId['id'], date('Y-m-d'));
		
		if ($sale == null) {
			$saleAdd = $this->selfModel->addInSale($stockId['id'], $quantite, date('Y-m-d'));
		}else{
			$saleUpdate = $this->selfModel->updateSale($stockId['id'], $quantite, $sale['saleDate']);
		}
		
		header('Location: index.php?module=indexStock');
	}

	public function getAllProduct(){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';

		$stock = $this->selfModel->getAllProduct();
		
		if ($stock == null) {
			$this->ajouteStock();
		}else {
			require 'View/header.tpl';
			require 'View/index/index.tpl';
			require 'View/footer.tpl';
		}
	}

	public function updateProduct($id, $reference, $nom, $commentaire, $quantite, $prix, $seuil, $seuilactif){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$product = $this->selfModel->updateProduct($id, $reference, $nom, $commentaire, $quantite, $prix, $seuil, $seuilactif);
		
		$stock = $this->selfModel->getProduct($id);
		
		$sale = $this->selfModel->getSale($id, date('Y-m-d'));
		
		$saleUpdate = $this->selfModel->updateSale($id, $quantite, $sale['saleDate']);

		require 'View/header.tpl';
		require 'View/Stock/ajouteStock.tpl';
		require 'View/footer.tpl';
	}

	public function getProduct($id){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$stock = $this->selfModel->getProduct($id);
		
		if ($stock == null) {
			$this->getAllProduct();
		}else {
			require 'View/header.tpl';
			require 'View/Stock/ajouteStock.tpl';
			require 'View/footer.tpl';
		}
	}	

	public function deleteProduct($id){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$productToDelete = $this->selfModel->deleteProduct($id);

		header('Location: index.php?module=indexStock');
	}

	public function getQuantityEqualLimit(){
		$title = "Cloud Management";
		$stock = $this->selfModel->getQuantityEqualLimit();
		
		return var_dump($stock);
	}
	
	public function rechercheStock($rechercher) {
		$title = "Cloud Management";
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$requeteRechercher = $this->selfModel->rechercheStock($rechercher);
	
		require 'View/header.tpl';
		require 'View/Stock/rechercheStock.tpl';
		require 'View/footer.tpl';
	}
	
	public function getProductForStats($id, $beginDate, $endDate){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$stock = $this->selfModel->getProductForStats($id, $beginDate, $endDate);
		$stockInfo = $this->selfModel->getProduct($id);
		
		require 'View/header.tpl';
		require 'View/Stock/productStats.tpl';
		require 'View/footer.tpl';
	}
	
	public function statsView(){
		$title = "Cloud Management";
	
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
	
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Stock/productStats.tpl';
		require 'View/footer.tpl';
	}
	
}

