<?php

class Model_Supplier extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'INSERT INTO supplier (name, society, adress, city, cp, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM supplier'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM supplier WHERE id = ?';
		$this->getSupplier = Controller_Template::$db->prepare($sql);

		$sql = 'UPDATE supplier SET name = :nom, society = :societe, adress = :adresse, city = :ville, cp = :codePostal, phone = :telephone, email = :email 
				WHERE id = :id';
		$this->updateSupplier = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM supplier WHERE id = ?';
		$this->deleteSupplier = Controller_Template::$db->prepare($sql);
		
		$sql = 'select * FROM supplier WHERE name = ? or society = ? or phone = ?';
		$this->rechercheSupplier = Controller_Template::$db->prepare($sql);
	}

	public function addSupplier($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$this->add->execute(array($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email));
	}

	public function getAllSupplier(){
		$this->selectAll->execute();
		$tab = $this->selectAll->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}

	public function getSupplier($id){
		$this->getSupplier->execute(array($id));
		$tab = $this->getSupplier->fetchAll();

		if(empty($tab)){
			return null;
		}
		else{
			return $tab[0];
		}
	}

	public function updateSupplier($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$this->updateSupplier->execute(array(
										'id' => $id,
										'nom' => $nom,
										'societe' => $societe,
										'adresse' => $adresse,
										'ville' => $ville,
										'codePostal' => $codePostal,
										'telephone' => $telephone,
										'email' => $email
									));
	}

	public function deleteSupplier($id){
		$this->deleteSupplier->execute(array($id));
	}
	
	public function rechercheSupplier($recherche) {	
		$this->rechercheSupplier->execute(array($recherche,$recherche,$recherche));
		$resultat = $this->rechercheSupplier->fetchAll();
		if (empty($resultat)) {	
			return null;	
		}
		else {	
			return $resultat;
		}
	}

}


?>