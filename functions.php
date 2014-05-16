<?php
/*
 * Fonction de formatage à utiliser dans le code PHP lorsqu'on génère des fichiers HTML ou bien lorsqu'on écrit des données dans la BDD
 */
function html($string){
	return utf8_encode(htmlspecialchars($string, ENT_QUOTES));
}

function url_format($string){
	$string = str_replace(' ', '-', strtolower($string));
	return html(preg_replace('#[^a-z0-9-]#', '', $string));
}


function generic_autoload($class){
	require_once str_replace('_', '/', $class).'.php';
}

