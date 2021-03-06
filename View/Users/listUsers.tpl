<table id="page-table">
	<tr>
		<td id="page-td">
			<h3 id="titre-user">Liste des utilisateurs</h3>	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouvelle utilisateur" onclick="self.location.href='index.php?module=ajoutUser'" />
					<form method="post" action="index.php?module=rechercheUser">    
						<input type="submit" value="OK" name="rechercheOK" style="height:35px; text-align:center; margin-right:10px; margin-top: -50px; float:right;" />
						<input type="search" placeholder="Rechercher" name="rechercher" style="height:25px; text-align:center; margin-right:50px; margin-top: -50px; float:right;" />
					</form>
				</div>
				
				<div>
					<table class="table table-bordered headerTable">
						<tr class="header">
							<td>Nom</td>
							<td style="width: 160px;">Prénom</td>
							<td style="width: 447px;">E-mail</td>
							<td style="width: 125px;">Action</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" id="usersTable">
						<?php foreach ($allUsers as $oneUser):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneUser['id']."></td>";
								echo "<td>".$oneUser['lastname']."</td>";
								echo "<td style='width: 160px;'>".$oneUser['firstname']."</td>";
								echo "<td style='width: 447px;'>".$oneUser['email']."</td>";
								echo "<td style='width: 125px;' class='header'><a class='btn btn-small delete-user header' title='Supprimer'><i class='icon-trash header'></i></a></td>";
							echo "</tr>";
						endforeach; ?>
					</table>
				</div>
			</div>
			<div id="tablePagination"></div>
		</td>
	</tr>
</table>
</div>

<script type="text/javascript" src="js/user.js"></script>
<script type="text/javascript">
	//mind the slight change below, personal idea of best practices
	jQuery(function($) {
	    // consider adding an id to your table,
	    // just incase a second table ever enters the picture..?
	    var items = $("#usersTable tbody tr");
	
	    var numItems = items.length;
	    var perPage = 10;
	
	    // only show the first 2 (or "first per_page") items initially
	    items.slice(perPage).hide();
	
	    // now setup your pagination
	    // you need that .pagination-page div before/after your table
	    $("#tablePagination").pagination({
	        items: numItems,
	        itemsOnPage: perPage,
	        cssStyle: "compact-theme",
	        onPageClick: function(pageNumber) { // this is where the magic happens
	            // someone changed page, lets hide/show trs appropriately
	            var showFrom = perPage * (pageNumber - 1);
	            var showTo = showFrom + perPage;
	
	            items.hide() // first hide everything, then show for the new page
	                 .slice(showFrom, showTo).show();
	        }
	    });
	});
</script>