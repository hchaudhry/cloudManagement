<table id="page-table">
	<tr>
		<td id="page-td">
			<h3 id="titre-produit">Liste des produits</h3>	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouvelle Entrée" onclick="self.location.href='index.php?module=ajouteStock'" />
					<form method="post" action="index.php?module=rechercheStock">    
						<input type="submit" value="OK" name="rechercheOK" style="height:35px; text-align:center; margin-right:10px; margin-top: -50px; float:right;" />
						<input type="search" placeholder="Rechercher" name="rechercher" style="height:25px; text-align:center; margin-right:50px; margin-top: -50px; float:right;" />
					</form>
				</div>
				
				<div>
					<table class="table table-bordered headerTable">
						<tr class="header">
							<td>Référence</td>
							<td style="width: 248px;">Désignation</td>
							<td style="width: 236px;">Quantité en stock</td>
							<td style="width: 202px;">Action</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" id="productTable">
						<?php foreach ($stock as $product):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$product['id']."></td>";
								echo "<td>".$product['reference']."</td>";
								echo "<td style='width: 248px;'>".$product['name']."</td>";
								echo "<td style='width: 236px;'>".$product['quantity']."</td>";
								echo "<td style='width: 202px;' class='header'><a class='btn btn-small delete-line header' title='Supprimer'><i class='icon-trash header'></i></a> <a class='btn btn-small stats-line header' title='Statistique'><i class='icon-signal header'></i></a> <a class='btn btn-small supcli-btn header' title='Fournisseurs/Clients'><i class='icon-th-list header'></i></a></td>";
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

<script type="text/javascript" src="js/product.js"></script>

<script type="text/javascript">
	//mind the slight change below, personal idea of best practices
	jQuery(function($) {
	    // consider adding an id to your table,
	    // just incase a second table ever enters the picture..?
	    var items = $("#productTable tbody tr");
	
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