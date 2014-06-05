<table id="page-table">
	<tr>
		<td id="page-td">	
			<div id="global">
				<div id="line-haut">
					<input class="btn btn-primary" id="add-btn" type="button" value="Nouveau client" onclick="self.location.href='index.php?module=ajouteClient'" />
					<form method="post" action="index.php?module=rechercheClient">    
						<input type="submit" value="OK" name="rechercheOK" style="text-align:center; margin-top:-50px; float: right;" />
						<input type="search" placeholder="Rechercher" name="rechercher" style=" text-align:center; margin-right: 50px;margin-top:-50px; float: right;" />
				</form>
				</div>
				
				<div>
					<table class="table table-bordered headerTable">
						<tr class="header">
							<td>Nom</td>
							<td style="width: 168.4px;">Société</td>
							<td style="width: 149px;">Téléphone</td>
							<td style="width: 344px;">Action</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" id="clientTable">
						<?php foreach ($clients as $oneClient):
							echo "<tr>";
								echo "<input type='hidden' class='num' name='num' value=".$oneClient['id']."></td>";
								echo "<td>".$oneClient['name']."</td>";
								echo "<td style='width: 149px;'>".$oneClient['society']."</td>";
								echo "<td style='width: 149px;'>".$oneClient['phone']."</td>";
								echo "<td style='width: 344px;' class='header'><a class='btn btn-small delete-client header'><i class='icon-trash header'></i></a></td>";
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
	    var items = $("#clientTable tbody tr");
	
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