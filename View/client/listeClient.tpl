<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouveau client" onclick="self.location.href='index.php?module=ajouteClient'" />
					    <input type="search" placeholder="Rechercher" name="q" style="height:25px; text-align:center; margin-right:10px; float:right;" />
				</div>
				
				<div>
					<table class="table table-striped table-bordered" id="clientTable">
						<tr class="header">
							<td>Nom</td>
							<td>Société</td>
							<td>Téléphone</td>
							<td>Action</td>
						</tr>
						<?php foreach ($clients as $oneClient):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneClient['id']."></td>";
								echo "<td>".$oneClient['name']."</td>";
								echo "<td>".$oneClient['society']."</td>";
								echo "<td>".$oneClient['phone']."</td>";
								echo "<td class='header'><a class='btn btn-small delete-client header'><i class='icon-trash header'></i></a></td>";
							echo "</tr>";
						endforeach; ?>
					</table>
				</div>
			</div>
			<div id="footer"></div>
		</td>
	</tr>
</table>