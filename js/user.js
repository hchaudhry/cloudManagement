$(document).ready(function(){

	$('#usersTable tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getUser&id='+ $(this).parents().find('input').val();
	});

	$('#clientTable tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	$('.delete-user').click(function() {
		if (confirm("Êtes-vous sûr de supprimer cet utilisateur?")) {
        	window.location = 'index.php?module=deleteUser&id='+ $(this).parents().find('input').val();
    	}else{
    		return false;	
    	}
	});
});