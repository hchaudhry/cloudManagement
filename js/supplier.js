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

$(document).ready(function() {
	 $("#supplierForm").validate({
	      rules: {
	         nom: {
	            required: true,
	            minlength: 3
	               },
	         societe: {
	             required: true,
	             minlength: 3
	                },
	         adresse: {
	             required: true,
	             minlength: 3
	                },
	         ville: {
	             required: true,
	             minlength: 3
	                },
	         codePostal: {
	             required: true,
	             minlength: 5,
	             maxlength: 5
	                },
	        telephone: {
	            required: true,
	            minlength: 10,
	            maxlength: 10
	               },
	        email: {
	            required: true,
	            email: true
	               }
	         },
	         messages: {
	        	 nom: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			societe: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			adresse: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			ville: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			codePostal: {
	 				required: "Champ requis",
	 				minlength: "5 caractères minimum requis",
	 				maxlength: "5 caractères maximum"
	 			},
	 			telephone: {
	 				required: "Champ requis",
	 				minlength: "10 caractères minimum requis",
	 				maxlength: "10 caractères maximum"
	 			},
	 			email: {
	 				required: "Champ requis"
	 			}
	          }
	     });
});