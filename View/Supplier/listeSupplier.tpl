<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouveau fournisseur" onclick="self.location.href='index.php?module=ajouteFournisseur'" />
					    <input type="search" placeholder="Rechercher" name="q" style="height:25px; text-align:center; margin-right:10px; float:right;" />
				</div>
				
				<div>
					<table class="table table-striped table-bordered" id="supplierTable">
						<tr class="header">
							<td>Nom</td>
							<td>Société</td>
							<td>Téléphone</td>
							<td>Action</td>
						</tr>
						<?php foreach ($suppliers as $oneSupplier):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneSupplier['id']."></td>";
								echo "<td>".$oneSupplier['name']."</td>";
								echo "<td>".$oneSupplier['society']."</td>";
								echo "<td>".$oneSupplier['phone']."</td>";
								echo "<td class='header'><a class='btn btn-small delete-client header'><i class='icon-trash header'></i></a></td>";
							echo "</tr>";
						endforeach; ?>
					</table>
				</div>
			</div>
			<div id="tablePagination"></div>
			<div id="footer"></div>
		</td>
	</tr>
</table>
</div>

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