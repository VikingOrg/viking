/*!
 * CoreViking v0.1 (http://Jalastic.viking.com)
 * Copyright 2014-current Danil Ozherelyev
 * Licensed to ITT21
 */
$(document).ready(function() {
	                /*Modal code.*/ 
	                $('#machineModelModal').on('shown.bs.modal', function (e) {
	              	  	var height = $(window).height() - 200;
	            	  	$(this).find(".modal-body").css("max-height", height);
	            	               	   
	                    $("#submitCopy").click(function(e) {
	                 	    e.preventDefault();
	                        if ($("#ajaxSubmitForm").valid()) {
	          			       initiateAjaxCall("copy");
	                        }
	                    });

	                    $("#saveExisting").on("click", "#machineModelModalContent", function(e) {
	                    	   alert("Here!");	
		                 	   e.preventDefault();
		                       if ($("#ajaxSubmitForm").valid()) {
		          			      initiateAjaxCall("update");
		                       }
	                    });
	                    
//	                    $("#saveExisting").on("click", function(e) {
//		                 	   e.preventDefault();
//		                       if ($("#ajaxSubmitForm").valid()) {
//		          			      initiateAjaxCall("update");
//		                       }
//		                });

	                    
	                    $("#submitCreate").click(function(e) {
	                 	   e.preventDefault();
	                       if ($("#ajaxSubmitForm").valid()) {
	          			      initiateAjaxCall("create");
	                       }
	                    });
	                    
	         	       function initiateAjaxCall(requestType){
	         	            ajaxObjectId =  $("#ajaxObjectId").val();
	         	            $.ajax({
	         		               	type: "POST",
	         		       		    url: "${pageContext.request.contextPath}/machineModel/save/" + requestType,
	         		       		    data: $("#ajaxSubmitForm").serialize(),
	         		                complete : function( response ) {
	         		                          $("#machineModelModalContent").html(response.responseText);
	         		                          check = $("#ajaxSuccessFlag").val();
	         	
	         		                          if(check=='true'){
	         			                          var successMsg = $("#successMessage").html();
	         			                          /*For any type of update we are assuming there is a record in DOM with provided id.*/
	         			                          if(requestType == "update"){
	             			                          	/*Closing Modal.*/
	             			                          	$('#machineModelModal').data( "id", ajaxObjectId );
	             			                          	//$( "#saveExisting" ).unbind();
		             			   	                    //$("#saveExisting").off("click");
	         				                       	    closingModal(ajaxObjectId, successMsg, $('#groupSelectModal').val());	
	         				                      } else {
		         					                    $('#machineModelModal').data( "id", $("#ajaxObjectId").val() );
	         			                       	    	closingModal($("#ajaxObjectId").val(), successMsg, $('#groupSelectModal').val());	
	         					                  }
	         		                          } //if not true - modal is still up with error message on the top.
	         		                          
	         		                },	        	        
	         		       	        error: function(){
	             		       	        //something went wrong on server side...
	         		       	        	alert("Ошибка сервера.");
	         		       	        }
	         	            });           	
	         	       }
	             	   
	                });				

	                $("#ajaxSubmitForm").validate({
	    		        highlight: function(element) {
	    		            $(element).closest('.form-group').addClass('has-error');
	    		        },
	    		        unhighlight: function(element) {
	    		            $(element).closest('.form-group').removeClass('has-error');
	    		        },
	    		        errorElement: 'span',
	    		        errorClass: 'help-block',
	    		        errorPlacement: function(error, element) {
	    		            if(element.parent('.input-group').length) {
	    		                error.insertAfter(element.parent());
	    		            } else {
	    		                error.insertAfter(element);
	    		            }
	    		        }
	    		    });
	    		                     
	                $("#machineModelName").rules("add", {required:true});
	                $("#machineModelDetail").rules("add", {required:true}); 
	                $("#groupSelectModal").rules("add", {required:true});
	                $("#manufacturerSelectModal").rules("add", {required:true}); 
	                
}); // end of document.ready	                
