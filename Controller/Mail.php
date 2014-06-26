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
		
		$usersMails = new Model_Users();
		$usersMails = $usersMails->getMailOfAllUsersInfos();
	
		$subject = 'Cloud Management - Alerte';
		$messages;
		$message = '';
		$headers = 'From: chaudhry.hussam@gmail.com' . "\r\n" .
				'Reply-To: chaudhry.hussam@gmail.com' . "\r\n" .
				'X-Mailer: PHP/' . phpversion();
		
		foreach ($products as $value) {
     		$message .= 'Name : '.$value['name'].' Reference : '.$value['reference']."\r\n";
		}
		$messages = $message;
		
		foreach ($usersMails as $oneMail) {
// 			return var_dump($messages);
			$sentmail = mail($oneMail['email'], $subject, $message, $headers);
		}
	}
}
?>