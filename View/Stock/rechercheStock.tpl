<?php 
if ($requeteRechercher == null) {
echo "Aucun résultat ne correspond à votre demande";
}else {
	echo "<table class=\"table table-striped table-bordered\">
		<tr class=\"header\">
			<td>Référence</td>
			<td>Désignation</td>
			<td>Quantité en stock</td>
		</tr>";
	//Liste toutes les valeurs trouvées
	foreach($requeteRechercher as $rq) {
		echo "<tr><td>" .$rq['reference'] . "</td><td>" . $rq['name'] . "</td><td>" . $rq['quantity'] . "</td></tr>";
	}
	echo "</table>";
}
echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=indexStock\'" />';
?>


