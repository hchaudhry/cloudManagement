$(document).ready(function(){

	$('#supplierTable tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getSupplier&id='+ $(this).parents().find('input').val();
	});

	$('#supplierTable tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	$('.delete-supplier').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce fournisseur?")) {
        	window.location = 'index.php?module=deleteSupplier&id='+ $(this).parents().find('input').val();
    	}else{
    		return false;	
    	}
	});
});