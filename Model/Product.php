<?php

class Model_Product extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'INSERT INTO product (reference, name, description, quantity, seuil) VALUES (?, ?, ?, ?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM product'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM product WHERE id = ?';
		$this->getProduct = Controller_Template::$db->prepare($sql);

		$sql = 'UPDATE product SET reference = :reference, name = :nom, description = :commentaire, quantity = :quantite, seuil = :seuil
				WHERE id = :id';
		$this->updateProduct = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM product WHERE id = ?';
		$this->deleteProduct = Controller_Template::$db->prepare($sql);
	}

	public function addProduct($reference, $nom, $commentaire, $quantite, $seuil){
		$this->add->execute(array($reference, $nom, $commentaire, $quantite, $seuil));
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

	public function updateProduct($id, $reference, $nom, $commentaire, $quantite, $seuil){
		$this->updateProduct->execute(array(
										'id' => $id,
										'reference' => $reference,
										'nom' => $nom,
										'commentaire' => $commentaire,
										'quantite' => $quantite,
										'seuil' => $seuil
									));
	}

	public function deleteProduct($id){
		$this->deleteProduct->execute(array($id));
	}

}


?>