$(document).ready(function(){

	//Client
	$('#clientsTable tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getClient&id='+ $(this).parents().find('input').val();
	});

	$('#clientsTable tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});
	
	var productId = $('body').find('#productId').val();

	$('.delete-client').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce client?")) {
        	window.location = 'index.php?module=deleteClientForProduct&idClient='+ $(this).parents().find('input').val() + '&productId='+ productId;
    	}else{
    		return false;	
    	}
	});
	
	
	$('#addClient').on('click', function() {
		window.location = 'index.php?module=addProductClient&idProduct='+ productId +'&idClient='+ $('#clients').val();
	});
	
	//Supplier
	$('#suppliersTable tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getSupplier&id='+ $(this).parents().find('input').val();
	});

	$('#suppliersTable tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	var productId = $('body').find('#productId').val();
	
	$('.delete-supplier').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce fournisseur?")) {
        	window.location = 'index.php?module=deleteSupplierForProduct&idSupplier='+ $(this).parents().find('input').val() + '&productId='+ productId;
    	}else{
    		return false;	
    	}
	});
	
	$('#addSupplier').on('click', function() {
		window.location = 'index.php?module=addProductSupplier&idProduct='+ productId +'&idSupplier='+ $('#suppliers').val();
	});
	
	$('#footer').css('position', 'absolute');
});