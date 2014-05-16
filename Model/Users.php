<?php
/*
	La classe modèle pour les livres. 
	Le constructeur permet de préparer trois requêtes de sélection de livres. Deux nouvelles propriétés sont définies par rapport à la classe Model/Template ; "selectByAuthor" et "selectByCategory". De la même manière, on retrouve plus loin les méthodes pour exécuter et récupérer les résultats de ces requêtes.
*/
class Model_Users extends Model_Template{

	protected $selectByLoginEtMdp;
	public function __construct(){
		parent::__construct();
		$sql = 'SELECT *
				FROM user
				WHERE id = ?
				ORDER BY id';
		$this->selectById = Controller_Template::$db->prepare($sql);

		
		$sql = 'SELECT *
				FROM user
				WHERE login = ?
				AND motDepasse = ?';
		$this->selectByLoginEtMdp = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT *
				FROM user'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);
	}

	public function getByLoginEtMotDePass($login,$mdp){
		$this->selectByLoginEtMdp->execute(array($login,$mdp));
		$tab = $this->selectByLoginEtMdp->fetchAll();
		
		if(empty($tab[0])){
			return array();
		}
		else{
			return $tab[0];
		}
	}
}
