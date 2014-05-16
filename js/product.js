
$(document).ready(function(){

	$('table.table tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getProduct&id='+ $(this).parents().find('input').val();
	});

	$('table.table tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	$('a.btn').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce produit?")) {
        	window.location = 'index.php?module=deleteProduct&id='+ $(this).parents().find('input').val();
    	}else{
    		return false;	
    	}
	});
});