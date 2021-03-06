<?php
class Model_Users extends Model_Template{

	protected $selectByLoginEtMdp;
	public function __construct(){
		parent::__construct();
		$sql = 'SELECT *
				FROM user
				WHERE id = ?';
		$this->selectById = Controller_Template::$db->prepare($sql);

		
		$sql = 'SELECT *
				FROM user
				WHERE login = ?
				AND motDepasse = ?';
		$this->selectByLoginEtMdp = Controller_Template::$db->prepare($sql);

		$sql = 'SELECT *
				FROM user'; 
		$this->selectAll = Controller_Template::$db->prepare($sql);
		
		$sql = 'SELECT email
				FROM user';
		$this->selectAllMail = Controller_Template::$db->prepare($sql);
		
		$sql = 'INSERT INTO user (lastname, firstname, login, email, motDepasse, isSupAdmin) VALUES (?, ?, ?, ?, ?, ?)';
		$this->add = Controller_Template::$db->prepare($sql);
		
		$sql = 'UPDATE user SET lastname= :lastname, firstname = :firstname, login = :login, email = :email, motDepasse = :password, isSupAdmin = :isSupAdmin
				WHERE id = :id';
		$this->updateUser = Controller_Template::$db->prepare($sql);
		
		$sql = 'DELETE FROM user WHERE id = ?';
		$this->deleteUser = Controller_Template::$db->prepare($sql);
		
		$sql = 'select * FROM user WHERE lastname = ? or firstname = ? or email = ?';
		$this->rechercheUser = Controller_Template::$db->prepare($sql);
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
	
	public function getMailOfAllUsersInfos(){
		$this->selectAllMail->execute();
		$tab = $this->selectAllMail->fetchAll();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
	
	public function getAllUsersInfos(){
		$this->selectAll->execute();
		$tab = $this->selectAll->fetchAll();
	
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
	
	public function getUserById($id){
		$this->selectById->execute(array($id));
		$tab = $this->selectById->fetch();
		
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
	
	public function addUser($lastname, $firstname, $login, $email, $motDePasse, $isSupAdmin){
		$this->add->execute(array($lastname, $firstname, $login, $email, $motDePasse, $isSupAdmin));
	}
	
	public function updateUser($id, $lastname, $firstname, $login, $email, $password, $isSupAdmin){
		$this->updateUser->execute(array(
				'id' => $id,
				'lastname' => $lastname,
				'firstname' => $firstname,
				'login' => $login,
				'email' => $email,
				'password' => $password,
				'isSupAdmin' => $isSupAdmin
		));
	}
	
	public function deleteUser($id){
		$this->deleteUser->execute(array($id));
	}
	
	public function rechercheUsers($recherche){
		$this->rechercheUser->execute(array($recherche,$recherche,$recherche));
	
		$tab = $this->rechercheUser->fetchAll();
	
		if(empty($tab)){
			return null;
		}
		else{
			return $tab;
		}
	}
}
