<?php 
if ($requeteRechercher == null) {
echo "Aucun résultat ne correspond à votre demande";
}else {
	echo "<table class=\"table table-striped table-bordered\">
		<tr class=\"header\">
			<td>Nom</td>
			<td>Société</td>
			<td>E-mail</td>
		</tr>";
	foreach($requeteRechercher as $rq) {
		echo "<tr><td>" .$rq['name'] . "</td><td>" . $rq['society'] . "</td><td>" . $rq['email'] . "</td></tr>";
	}
	echo "</table>";
}
echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=listeClient\'" />';
?>
