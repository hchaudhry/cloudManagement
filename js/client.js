$(document).ready(function(){

	$('#clientTable tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getClient&id='+ $(this).parents().find('input').val();
	});

	$('#clientTable tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	$('.delete-client').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce client?")) {
        	window.location = 'index.php?module=deleteClient&id='+ $(this).parents().find('input').val();
    	}else{
    		return false;	
    	}
	});
});