<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouvelle utilisateur" onclick="self.location.href='index.php?module=ajoutUser'" />
					    <input type="search" placeholder="Rechercher" name="q" style="height:25px; text-align:center; margin-right:10px; float:right;" />
				</div>
				
				<div>
					<table class="table table-striped table-bordered" id="usersTable">
						<tr class="header">
							<td>Nom</td>
							<td>Prénom</td>
							<td>E-mail</td>
							<td>Action</td>
						</tr>
						<?php foreach ($allUsers as $oneUser):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneUser['id']."></td>";
								echo "<td>".$oneUser['lastname']."</td>";
								echo "<td>".$oneUser['firstname']."</td>";
								echo "<td>".$oneUser['email']."</td>";
								echo "<td class='header'><a class='btn btn-small delete-user header'><i class='icon-trash header'></i></a></td>";
							echo "</tr>";
						endforeach; ?>
					</table>
				</div>
			</div>
			<div id="footer"></div>
		</td>
	</tr>
</table>