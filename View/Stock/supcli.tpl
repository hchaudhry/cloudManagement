<h4 class="pageTitle">Gestion des fournisseurs et clients pour un produit</h4>

<div class="addingBlock">

<input type="hidden" name="id" id="productId" value="<?php if(isset($product)){ echo $product['id']; } ?>">

<div class="span5">
	<h5>Fournisseurs</h5>
	<select id="suppliers">
		<?php
			if(!empty($suppliers)){
				foreach ($suppliers as $one){
					echo "<option value=".$one['id'].">".$one['name']."</option>";
				}
			}
		?>
	</select>
	<input type="button" id="addSupplier" class="btn btn-primary" value="Ajouter">
</div>

<div class="span5">
	<h5>Clients</h5>
	<select id="clients">
		<?php
			if(!empty($clients)){
				foreach ($clients as $one){
					echo "<option value=".$one['id'].">".$one['name']."</option>";
				}
			}
		?>
	</select>
	<input type="button" id="addClient" class="btn btn-primary" value="Ajouter">
</div>

<table id="suppliersTable" class="span5 table table-striped table-bordered">
	<tr>
		<td>Fournisseurs</td>
		<td>Action</td>
	</tr>
	<?php
		if(empty($tabSuppliers)){
			echo "<td>Aucune donnée</td>";
			echo "<td>Aucune donnée</td>";
		} else {
			foreach ($tabSuppliers as $one):
				echo "<tr>";	
					echo "<input type='hidden' class='num' name='num' value=".$one['id'].">";
					echo "<td>".$one['name']."</td>";
					echo "<td style='width: 264px;' class='header'><a class='btn btn-small delete-supplier header' title='Supprimer'><i class='icon-trash header'></i></a></td>";
				echo "</tr>";
			endforeach;
		} 
	?>
</table>

<table id="clientsTable" class="span5 table table-striped table-bordered">
	<tr>
		<td>Clients</td>
		<td>Action</td>
	</tr>
	<?php
		if(empty($tabClients)){
			echo "<td>Aucune donnée</td>";
			echo "<td>Aucune donnée</td>";
		}else {
			foreach ($tabClients as $one):
				echo "<tr>";
					echo "<input type='hidden' class='num' name='num' value=".$one['id'].">";
					echo "<td>".$one['name']."</td>";
					echo "<td style='width: 264px;' class='header'><a class='btn btn-small delete-client header' title='Supprimer'><i class='icon-trash header'></i></a></td>";
				echo "</tr>";
			endforeach;
		}  
	?>
</table>

</div>

<script type="text/javascript" src="js/suppliersClients.js"></script>
