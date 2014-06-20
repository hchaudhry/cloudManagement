<?php 
if ($requeteRechercher == null) {
echo "Aucun résultat ne correspond à votre demande";
echo "<br><br>";
echo '<tr><input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=indexStock\'" /></tr>';

}else {
echo '<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
			<table class="table table-striped table-bordered">
			<tr class="header">
				<td>Référence</td>
				<td>Désignation</td>
				<td>Quantité en stock</td>
			</tr>';
	//Liste toutes les valeurs trouvées
	foreach($requeteRechercher as $rq) {
		echo "<input type='hidden' class='num' name='num' value=".$rq['id'].">";
		echo "<tr><td>" .$rq['reference'] . "</td><td>" . $rq['name'] . "</td><td>" . $rq['quantity'] . "</td></tr>";
	}
	echo '<tr><input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=indexStock\'" /></tr>';
	echo "</table></div>
		</td>
	</tr>
</table>";
}
?>


