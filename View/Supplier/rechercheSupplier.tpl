<?php 
if ($requeteRechercher == null) {
echo "Aucun résultat ne correspond à votre demande";
echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=listeSupplier\'" />';

}else {
echo '<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
			<table id ="supplierTable" class="table table-striped table-bordered">
			<tr class="header">
				<td>Nom</td>
				<td>Société</td>
				<td>Téléphone</td>
			</tr>';
	//Liste toutes les valeurs trouvées
	foreach($requeteRechercher as $rq) {
		echo "<input type='hidden' class='num' name='num' value=".$rq['id'].">";
		echo "<tr><td>" .$rq['name'] . "</td><td>" . $rq['society'] . "</td><td>" . $rq['phone'] . "</td></tr>";
	}
	echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=listeSupplier\'" />';
	echo "</table></div>
		</td>
	</tr>
</table>";
}
  
?>


