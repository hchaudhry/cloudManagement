<?php

class Model_ProductSuppliers extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'SELECT * FROM product_supplier WHERE id_product = ?';
		$this->getProductSuppliers = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM product_supplier WHERE id_supplier = ? AND id_product = ?';
		$this->deleteProductSupplier = Controller_Template::$db->prepare($sql);
		
		$sql = 'INSERT INTO product_supplier (id_product, id_supplier) VALUES (?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);
	}

	public function getProductSuppliers($idProduct){
		$this->getProductSuppliers->execute(array($idProduct));
		$tab = $this->getProductSuppliers->fetchAll();

		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
	
	public function deleteProductSupplier($idSupplier, $productId){
		$this->deleteProductSupplier->execute(array($idSupplier, $productId));
	}
	
	public function addProductSupplier($idProduct, $idSupplier){
		$this->add->execute(array($idProduct, $idSupplier));
	}

}
?>