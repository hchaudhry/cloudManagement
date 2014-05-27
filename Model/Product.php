<?php

class Model_Product extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'INSERT INTO product (reference, name, description, quantity, seuil_value, seuil_active) VALUES (?, ?, ?, ?, ?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM product'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM product WHERE id = ?';
		$this->getProduct = Controller_Template::$db->prepare($sql);

		$sql = 'UPDATE product SET reference = :reference, name = :nom, description = :commentaire, quantity = :quantite, seuil_value = :seuil, seuil_active = :seuil_active
				WHERE id = :id';
		$this->updateProduct = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM product WHERE id = ?';
		$this->deleteProduct = Controller_Template::$db->prepare($sql);
		
		$sql = 'SELECT id, reference, name FROM product WHERE quantity = seuil AND seuil_active = 1';
		$this->getQuantityEqualLimit = Controller_Template::$db->prepare($sql);
	}

	public function addProduct($reference, $nom, $commentaire, $quantite, $seuil, $seuilactif){
		$this->add->execute(array($reference, $nom, $commentaire, $quantite, $seuil, $seuilactif));
	}

	public function getAllProduct(){
		$this->selectAll->execute();
		$tab = $this->selectAll->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}

	public function getProduct($id){
		$this->getProduct->execute(array($id));
		$tab = $this->getProduct->fetchAll();

		if(empty($tab)){
			return null;
		}
		else{
			return $tab[0];
		}
	}

	public function updateProduct($id, $reference, $nom, $commentaire, $quantite, $seuil, $seuilactif){
		$this->updateProduct->execute(array(
										'id' => $id,
										'reference' => $reference,
										'nom' => $nom,
										'commentaire' => $commentaire,
										'quantite' => $quantite,
										'seuil' => $seuil,
										'seuil_active' => $seuilactif
									));
	}

	public function deleteProduct($id){
		$this->deleteProduct->execute(array($id));
	}
	
	public function getQuantityEqualLimit() {
		$this->getQuantityEqualLimit->execute();
		$tab = $this->getQuantityEqualLimit->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}

}
?>