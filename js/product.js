
$(document).ready(function(){

	$('table.table tr:not(.header) td:not(.header)').click(function () {
		window.location = 'index.php?module=getProduct&id='+ $(this).parents().find('input').val();
	});

	$('table.table tr:not(.header) td:not(.header)').mouseover(function() {
		$(this).css('cursor','pointer');
	});

	$('.delete-line').click(function() {
		if (confirm("Êtes-vous sûr de supprimer ce produit?")) {
        	window.location = 'index.php?module=deleteProduct&id='+ $(this).parents().find('input').val();
    	}else{
    		return false;	
    	}
	});
	
	$('#seuilInfo').popover({placement:'top', trigger : 'hover', delay: { show: 200, hide: 100 }});
	
	var url = window.location;
	$('ul.nav a').filter(function() {
	    return this.href == url;
	}).parents().addClass('active');

});