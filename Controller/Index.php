<?php
class Controller_Index extends Controller_Template{

	public function index(){
		$title = utf8_decode("Cloud_management"); 
		// $title pourra être utilisé dans les scripts et les templates incorporé dans ce script PHP par les fonctions "include" ou "require"
		header('Content-Type: text/html; charset=utf-8');
		if (isset($_SESSION['login']) && isset($_SESSION['mdp'])) {
			require 'View/header.tpl';
			require 'View/index/index.tpl';
			require 'View/footer.tpl';
		} else {
			require 'View/Users/connexion.tpl';
		}
	}
}
?>
