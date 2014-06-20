<table id="page-table">
	<tr>
		<td id="page-td">	
			<h3 id="titre-page">Liste des fournisseurs</h3>
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouveau fournisseur" onclick="self.location.href='index.php?module=ajouteFournisseur'" />
					<form method="post" action="index.php?module=rechercheSupplier">    
						<input type="submit" value="OK" name="rechercheOK" style="height:35px; text-align:center; margin-right:10px; margin-top: -50px; float:right;" />
						<input type="search" placeholder="Rechercher" name="rechercher" style="height:25px; text-align:center; margin-right:50px; margin-top: -50px; float:right;" />
					</form> 
				</div>
				
				<div>
					<table class="table table-bordered headerTable">
						<tr class="header">
							<td>Nom</td>
							<td style="width: 189px;">Société</td>
							<td style="width: 268px;">Téléphone</td>
							<td style="width: 264px;">Action</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" id="supplierTable">
						<?php foreach ($suppliers as $oneSupplier):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneSupplier['id']."></td>";
								echo "<td>".$oneSupplier['name']."</td>";
								echo "<td style='width: 189px;'>".$oneSupplier['society']."</td>";
								echo "<td style='width: 268px;'>".$oneSupplier['phone']."</td>";
								echo "<td style='width: 264px;' class='header'><a class='btn btn-small delete-client header' title='Supprimer'><i class='icon-trash header'></i></a></td>";
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

<script type="text/javascript" src="js/supplier.js"></script>
<script type="text/javascript">
	//mind the slight change below, personal idea of best practices
	jQuery(function($) {
	    // consider adding an id to your table,
	    // just incase a second table ever enters the picture..?
	    var items = $("#supplierTable tbody tr");
	
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