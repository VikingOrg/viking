
jQuery(function($) {
	$('form[data-async]').on('submit', function(event) {
		var $form = $(this);
		var $target = $($form.attr('data-target'));
		var action =  $form.attr('action');
		var method =  $form.attr('method');
        $.ajax({
        	type: "POST",
		    url: "userSearchAdmin",
		    data: $('form.contact').serialize(),
	        success: function(msg){
	             $("#thanks").html(msg)
	             $("#form-content").modal('hide');    
	        },
	        error: function(){
	        	alert("failure");
	        }
         });
		 
		event.preventDefault();
	});
});


//jQuery(function($) {
//	$('form[data-async]').on('submit', function(event) {
//		var $form = $(this);
//		var $target = $($form.attr('data-target'));
//		var action =  $form.attr('action');
//		var method =  $form.attr('method');
//		$.ajax({
//			type: $form.attr('method'),
//			url: $form.attr('action'),
//			data: $('form.contact').serialize(),
//			 
//            success: function(msg){
//                $("#thanks").html(msg)
//                $("#form-content").modal('hide');    
//            },
//			
//	        error: function(){
//	            alert("failure");
//	        }
//		
//		});
//		 
//		event.preventDefault();
//	});
//});


//$(function() {
//	//twitter bootstrap script
//	    $("button#submit").click(function(){
//	               $.ajax({
//	                   type: "POST",
//	            url: "process.php",
//	            data: $('form.contact').serialize(),
//	                success: function(msg){
//	                        $("#thanks").html(msg)
//	                    $("#form-content").modal('hide');    
//	                },
//	            error: function(){
//	                alert("failure");
//	                }
//	                  });
//	    });
//	});

