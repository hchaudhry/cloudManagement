<?php
class Controller_Mail extends Controller_Template{
	
	protected function __construct(){
		parent::__construct();
		$this->selfModel = new Model_Product();
	}
	
	/**
	 * Envoie des mail avec les infos des produits
	 * dont le stock est égal au seuil limite
	 */
	public function sendMail(){
		
		$products = $this->selfModel->getQuantityEqualLimit();
		
		if (isset($_SESSION)) { 
			$login = $_SESSION['login'];
			$mdp = $_SESSION['mdp'];
		}
		$user = new Model_Users();
		$user = $user->getAllUserInfo($login, $mdp);
		
		$to = $user['email'];
		$subject = 'Cloud Management';
		$messages;
		$message = '';
		$headers = 'From: chaudhry.hussam@gmail.com' . "\r\n" .
				'Reply-To: chaudhry.hussam@gmail.com' . "\r\n" .
				'X-Mailer: PHP/' . phpversion();
		
		foreach ($products as $value) {
     		$message .= 'Name : '.$value['name'].' Reference : '.$value['reference']."\r\n";
		}
		$messages = $message;
		
		$sentmail = mail($to, $subject, $message, $headers);
		
		if($sentmail){
			echo "Email Has Been Sent .";
		}else {
			echo "Cannot Send Email ";
		}
	}
}
?>