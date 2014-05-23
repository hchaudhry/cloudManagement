<?php
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
	
	public function getAllUserInfo($login, $mpd){
		$this->selectByLoginEtMdp->execute(array($login, $mpd));
		$tab = $this->selectByLoginEtMdp->fetch();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
}
