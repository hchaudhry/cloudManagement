<?php

class Model_Client extends Model_Template{

	public function __construct(){
		parent::__construct();
		$sql = 'INSERT INTO client (name, society, adress, cp, city, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM client'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT * FROM client WHERE id = ?';
		$this->getClient = Controller_Template::$db->prepare($sql);

		$sql = 'UPDATE client SET name = :nom, society = :societe, adress = :adresse, city = :ville, cp = :codePostal, phone = :telephone, email = :email 
				WHERE id = :id';
		$this->updateClient = Controller_Template::$db->prepare($sql);

		$sql = 'DELETE FROM client WHERE id = ?';
		$this->deleteClient = Controller_Template::$db->prepare($sql);
		
		$sql = 'select * FROM client WHERE name = ? or society = ? or phone = ?';
		$this->rechercheClient = Controller_Template::$db->prepare($sql);
	}

	public function addClient($nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$this->add->execute(array($nom, $societe, $adresse, $codePostal, $ville, $telephone, $email));
	}

	public function getAllClient(){
		$this->selectAll->execute();
		$tab = $this->selectAll->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}

	public function getClient($id){
		$this->getClient->execute(array($id));
		$tab = $this->getClient->fetchAll();

		if(empty($tab)){
			return null;
		}
		else{
			return $tab[0];
		}
	}

	public function updateClient($id, $nom, $societe, $adresse, $ville, $codePostal, $telephone, $email){
		$this->updateClient->execute(array(
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

	public function deleteClient($id){
		$this->deleteClient->execute(array($id));
	}
	
	public function rechercheClient($recherche) {
		$this->rechercheClient->execute(array($recherche,$recherche,$recherche));
		$resultat = $this->rechercheClient->fetchAll();
		if (empty($resultat)) {
			return null;
		}
		else {
			return $resultat;
		}
	}

}


?>