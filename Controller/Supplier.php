<?php
class Controller_Supplier extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Supplier();
	}
	
	// public function index() {
	// 	require 'view/header.tpl';
	// 	require 'view/index/index.tpl';
	// 	require 'view/footer.tpl';
	// }

	public function ajouteFournisseur(){
		$title = "Cloud Management"; 
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Supplier/addSupplier.tpl';
		require 'View/footer.tpl';
	}

	public function addSupplier($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";

		$supplier = $this->selfModel->addSupplier($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);
		
		header('Location: index.php?module=listeSupplier');
	}

	public function getAllSupplier(){
		$title = "Cloud Management";

		$suppliers = $this->selfModel->getAllSupplier();

		require 'View/header.tpl';
		require 'View/Supplier/listeSupplier.tpl';
		require 'View/footer.tpl';
	}

	public function updateSupplier($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		$product = $this->selfModel->updateSupplier($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);

		$supplier = $this->selfModel->getSupplier($id);

		require 'View/header.tpl';
		require 'View/Supplier/addSupplier.tpl';
		require 'View/footer.tpl';
	}

	public function getSupplier($id){
		$title = "Cloud Management";
		$supplier = $this->selfModel->getSupplier($id);

		require 'View/header.tpl';
		require 'View/Supplier/addSupplier.tpl';
		require 'View/footer.tpl';
	}	

	public function deleteSupplier($id){
		$title = "Cloud Management - Fournisseurs";
		$supplierToDelete = $this->selfModel->deleteSupplier($id);

		header('Location: index.php?module=listeFournisseur');
	}	
	
	
}
