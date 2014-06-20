<?php

class Model_ProductClients extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'SELECT * FROM product_client WHERE id_product = ?';
		$this->getProductClients = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM product_client WHERE id_client = ? AND id_product = ?';
		$this->deleteProductClient = Controller_Template::$db->prepare($sql);
		
		$sql = 'INSERT INTO product_client (id_product, id_client) VALUES (?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);
	}

	public function getProductClients($idProduct){
		$this->getProductClients->execute(array($idProduct));
		$tab = $this->getProductClients->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
	
	public function deleteProductClient($idClient, $productId){
		$this->deleteProductClient->execute(array($idClient, $productId));
	}
	
	public function addProductClient($idProduct, $idClient){
		$this->add->execute(array($idProduct, $idClient));
	}

}
?>