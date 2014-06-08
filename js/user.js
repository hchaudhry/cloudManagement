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

$(document).ready(function() {
	 $("#userForm").validate({
	      rules: {
	    	lastname: {
	            required: true,
	            minlength: 3
	               },
	        firstname: {
	             required: true,
	             minlength: 3
	                },
	        login: {
	             required: true,
	             minlength: 5
	                },
	        password: {
	             minlength: 6,
	             maxlength: 12
	                },
	        passwordconfirm: {
	        	equalTo: "#password"
	               },
	        email: {
	            required: true,
	            email: true
	               }
	         },
	         messages: {
	        	 lastname: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			firstname: {
	 				required: "Champ requis",
	 				minlength: "3 caractères minimum requis"
	 			},
	 			login: {
	 				required: "Champ requis",
	 				minlength: "5 caractères minimum requis"
	 			},
	 			password: {
	 				minlength: "6 caractères minimum requis",
	 				maxlength: "12 caractères maximum"
	 			},
	 			passwordconfirm: {
	 				minlength: "6 caractères minimum requis",
	 				maxlength: "12 caractères maximum"
	 			},
	 			email: {
	 				required: "Champ requis"
	 			}
	          }
	     });
});