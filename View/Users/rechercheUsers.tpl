<?php 
if ($requeteRechercher == null) {
echo "Aucun résultat ne correspond à votre demande";
echo "<br><br>";
echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=listUsers\'" />';

}else {
echo '<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
			<table id ="usersTable" class="table table-striped table-bordered">
			<tr class="header">
				<td>Nom</td>
				<td>Prénom</td>
				<td>E-mail</td>
			</tr>';
	//Liste toutes les valeurs trouvées
	foreach($requeteRechercher as $rq) {
		echo "<input type='hidden' class='num' name='num' value=".$rq['id'].">";
		echo "<tr><td>" .$rq['lastname'] . "</td><td>" . $rq['firstname'] . "</td><td>" . $rq['email'] . "</td></tr>";
	}
	echo '<input type="button" value="< Retour" onclick="self.location.href=\'index.php?module=listUsers\'" />';
	echo "</table>";
}

?>


