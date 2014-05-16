<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouvelle Entrée" onclick="self.location.href='index.php?module=ajouteStock'" />
					    <input type="search" placeholder="Rechercher" name="q" style="height:25px; text-align:center; margin-right:10px; float:right;" />
				</div>
				
				<div>
					<table class="table table-striped table-bordered" id="productTable">
						<tr class="header">
							<td>Référence</td>
							<td>Désignation</td>
							<td>Quantité en stock</td>
							<td>Action</td>
						</tr>
						<?php foreach ($stock as $product):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$product['id']."></td>";
								echo "<td>".$product['reference']."</td>";
								echo "<td>".$product['name']."</td>";
								echo "<td>".$product['quantity']."</td>";
								echo "<td class='header'><a class='btn btn-small delete-line header'><i class='icon-trash header'></i></a></td>";
							echo "</tr>";
						endforeach; ?>
					</table>
				</div>
			</div>
			<div id="footer"></div>
		</td>
	</tr>
</table>