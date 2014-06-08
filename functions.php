<?php
/*
 * Fonction de formatage à utiliser dans le code PHP lorsqu'on génère des fichiers HTML ou bien lorsqu'on écrit des données dans la BDD
 */
function html($string){
	return utf8_encode(nl2br(htmlspecialchars($string, ENT_QUOTES)));
}

function url_format($string){
	$string = str_replace(' ', '-', strtolower($string));
	return html(preg_replace('#[^a-z0-9-]#', '', $string));
}


function generic_autoload($class){
	require_once str_replace('_', '/', $class).'.php';
}

function sgbd($str){
	return utf8_decode($str);
}

function validMdp($mdp) {
	$pattern = "#^[a-z0-9]+$#i";
	if (preg_match($pattern , $mdp) && (strlen($mdp)>5)) {
		return true;
	} else {
		return false;
	}
}

function validTel($numTel) {
	if (ctype_digit($valeur) && strlen($valeur)==10 && substr($valeur ,0, -9)==0) {
	//s'il a 10 chiffres et qu'il commence par zéro
		return true;
	} else {
		return false;
	}
}

function validEmail($email){
   $isValid = true;
   $atIndex = strrpos($email, "@");
   if (is_bool($atIndex) && !$atIndex)   {
      $isValid = false;
   }   else   {
      $domain = substr($email, $atIndex+1);
      $local = substr($email, 0, $atIndex);
      $localLen = strlen($local);
      $domainLen = strlen($domain);
      if ($localLen < 1 || $localLen > 64)      {
         // local part length exceeded
         $isValid = false;
      }
      else if ($domainLen < 1 || $domainLen > 255)
      {
         // domain part length exceeded
         $isValid = false;
      }
      else if ($local[0] == '.' || $local[$localLen-1] == '.')
      {
         // local part starts or ends with '.'
         $isValid = false;
      }
      else if (preg_match('/\\.\\./', $local))
      {
         // local part has two consecutive dots
         $isValid = false;
      }
      else if (!preg_match('/^[A-Za-z0-9\\-\\.]+$/', $domain))
      {
         // character not valid in domain part
         $isValid = false;
      }
      else if (preg_match('/\\.\\./', $domain))
      {
         // domain part has two consecutive dots
         $isValid = false;
      }
      else if (!preg_match('/^(\\\\.|[A-Za-z0-9!#%&`_=\\/$\'*+?^{}|~.-])+$/',  str_replace("\\\\","",$local)))
      {
         // character not valid in local part unless 
         // local part is quoted
         if (!preg_match('/^"(\\\\"|[^"])+"$/',
             str_replace("\\\\","",$local)))
         {
            $isValid = false;
         }
      }
      if ($isValid && !(checkdnsrr($domain,"MX") || checkdnsrr($domain,"A")))
      {
         // domain not found in DNS
         $isValid = false;
      }
   }
   return $isValid;
}