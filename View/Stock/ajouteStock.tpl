	<form action="index.php?module=addStock" method="POST">
		<table id="productAdd">
			<?php if(empty($stock['id'])){ 
				 		echo "<input type='hidden' name='id'>";
					}else{
						echo "<input type='hidden' name='id' value=".$stock['id'].">";
					}
			?>
			<tr>
				<td><label class="control-label" for="ref">Référence :</label></td>
				<?php if(empty($stock['reference'])){ 
				 		echo "<td><input type=text name='ref'></td>";
					}else{
						echo "<td><input type=text name='ref' value=".$stock['reference']."></td>";
					}
				?>
			</tr>
			<tr>
				<td><label class="control-label" for="nom">Nom :</label></td>
				<?php if(empty($stock['name'])){ 
				 		echo "<td><input type=text name='nom'></td>";
					}else{
						echo "<td><input type=text name='nom' value=".$stock['name']."></td>";
					}
				?>
			</tr>
			<tr>
				<td><label class="control-label" for="commentaires">Description :</label></td>
				<?php if(empty($stock['description'])){
				 		echo "<td><TEXTAREA rows='3' name='commentaires'>Tapez ici votre description</TEXTAREA></td>";
					}else{
						echo "<td><TEXTAREA rows='3' name='commentaires'>". $stock['description'] ."</TEXTAREA></td>";
					}
				?>
			</tr>
			<tr>
				<td><label class="control-label" for="fourni">Fournisseurs :</label></td>
				<td><SELECT name="fourni">
					<option value="fourni1"> Fourni 1 </option>
					<option value="fourni2"> Fourni 2 </option>
					<option value="fourni3"> Fourni 3 </option>
				</td>
			</tr>
			<tr>
				<td><label class="control-label" for="qte">Quantité disponible :</label></td>
				<?php if(empty($stock['quantity'])){ 
				 		echo "<td><input type=text name='qte'></td>";
					}else{
						echo "<td><input type=text name='qte' value=".$stock['quantity']."></td>";
					}
				?>
			</tr>
			<tr>
				<td><label class="control-label" for="seuil">Seuil d'alerte</label></td>
				<?php if(empty($stock['seuil'])){ 
				 		echo "<td><input type=text name='seuil'></td>";
					}else{
						echo "<td><input type=text name='seuil' value=".$stock['seuil']."></td>";
					}
				?>
			</tr>
			<tr>
				<td><label class="control-label" for="client">Client :</label></td>
				<td><SELECT name="client">
					<option value="fourni1"> client 1 </option>
					<option value="fourni2"> client 2 </option>
					<option value="fourni3"> client 3 </option>
				</td>
			</tr>
			<tr>
				<td><input type="button" class="btn btn-block btn-danger" value="Annuler" style="width:200px; height:30px; text-align:center; margin-left:10px;" onclick="self.location.href=''" /></td>
				<td><input type="submit" class="btn bnt-block btn-success" value="Valider" style="width:200px; height:30px; text-align:center; margin-left:10px;"/></td>
			</tr>
		</table>
	</form>
	<br><br><br><br><br><br><br><br><br>
<div id="footer">