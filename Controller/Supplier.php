<?php
class Controller_Supplier extends Controller_Template{

	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Supplier();
	}

	public function ajouteFournisseur(){
		$title = "Cloud Management"; 
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		header('Content-Type: text/html; charset=utf-8');
		require 'View/header.tpl';
		require 'View/Supplier/addSupplier.tpl';
		require 'View/footer.tpl';
	}

	public function addSupplier($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';

		$supplier = $this->selfModel->addSupplier($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);
		
		header('Location: index.php?module=listeSupplier');
	}

	public function getAllSupplier(){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';

		$suppliers = $this->selfModel->getAllSupplier();
		
		if($suppliers == null){
			$this->ajouteFournisseur();
		}else {
			require 'View/header.tpl';
			require 'View/Supplier/listeSupplier.tpl';
			require 'View/footer.tpl';
		}	
	}

	public function updateSupplier($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$product = $this->selfModel->updateSupplier($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email);

		$supplier = $this->selfModel->getSupplier($id);

		require 'View/header.tpl';
		require 'View/Supplier/addSupplier.tpl';
		require 'View/footer.tpl';
	}

	public function getSupplier($id){		
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$supplier = $this->selfModel->getSupplier($id);
		
		if($supplier == null){
			$this->getAllSupplier();
		}else {
			require 'View/header.tpl';
			require 'View/Supplier/addSupplier.tpl';
			require 'View/footer.tpl';
		}
	}	

	public function deleteSupplier($id){
		$title = "Cloud Management";
		
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$supplierToDelete = $this->selfModel->deleteSupplier($id);
		
		header('Location: index.php?module=listeSupplier');
	}	
	
	public function rechercheSupplier($rechercher) {
		$title = "Cloud Management";
		if(Controller_Index::connected()) return require 'View/Users/connexion.tpl';
		
		$requeteRechercher = $this->selfModel->rechercheSupplier($rechercher);
		
		require 'View/header.tpl';
		require 'View/Supplier/rechercheSupplier.tpl';
		require 'View/footer.tpl';
	}
	
}

