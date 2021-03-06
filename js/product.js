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
	
	$('.stats-line').click(function() {
		window.location = 'index.php?module=statsView&id='+ $(this).parents().find('input').val();
	});
	
	$('#seuilInfo').popover({placement:'top', trigger : 'hover', delay: { show: 200, hide: 100 }});
	
	var url = window.location;
	$('ul.nav a').filter(function() {
	    return this.href == url;
	}).parents().addClass('active');
	
	$('#stats').on('click', function() {
		
		$.urlParam = function(name){
		    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
		    return results[1] || 0;
		}
		var id = $.urlParam('id');
		var beginDate = $('#beginDate').val();
		var endDate = $('#endDate').val();
		
		console.log(beginDate + ' ' + endDate);
		window.location = 'index.php?module=getProductForStats&beginDate='+ beginDate + '&endDate=' + endDate + '&id=' + id;
	});
	
	$('.supcli-btn').click(function() {
		window.location = 'index.php?module=SuppliersClients&id='+ $(this).parents().find('input').val();
	});

});

$(document).ready(function() {
	 $("#productForm").validate({
	      rules: {
	         ref: {
	            required: true,
	            minlength: 3
	               },
	         nom: {
	             required: true,
	             minlength: 3
	                },
	         commentaires: {
	             required: true,
	             minlength: 3
	                },
	         qte: {
	             required: true,
	             minlength: 1,
	             number: true
	                },
	         prix: {
	             required: true,
	             minlength: 1,
	             number: true
	                },
	        seuil: {
	            minlength: 1,
	            number: true
	               }
	         },
	         messages: {
	        	 ref: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			nom: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			commentaires: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			qte: {
	 				required: "Champ requis",
	 				minlength: "1 caractères minimum requis"
	 			},
	 			prix: {
	 				required: "Champ requis",
	 				minlength: "1 caractères minimum requis"
	 			},
	 			seuil: {
	 				minlength: "1 caractères minimum requis"
	 			}
	          }
	     });
});