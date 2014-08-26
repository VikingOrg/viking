/**
 * 
 * 
 * 
 */
$(document).ready(function() {
 
           $("#submitUpdate").click(function(e) {
        	   e.preventDefault();
 			   initiateAjaxCall("update");
           });
           $("#submitCopy").click(function(e) {
        	   e.preventDefault();
 			   initiateAjaxCall("copy");
           });

           

           
//           $("#submitCreate").click(function(e) {
//        	   e.preventDefault();
// 			   initiateAjaxCall("create");
//           });
           
	       function initiateAjaxCall(requestType){
	            ajaxObjectId =  $("#ajaxObjectId").val();
	            $.ajax({
		               	type: "POST",
		       		    url: "${pageContext.request.contextPath}/manufacturer/save/" + requestType,
		       		    data: $("#ajaxSubmitForm").serialize(),
		                      complete : function( response ) {
		                          $("#manufacturerEditModalContent").html(response.responseText);
		                          check = $("#ajaxSuccessFlag").val();
	
		                          if(check=='true'){
			                          var successMsg = $("#successMessage").html();
			                          /*For any type of update we are assuming there is a record in DOM with provided id.*/
			                          if(requestType == "update"){
				                      		/*For DOM DataTable.*/
											
				                      		$('#manufacturerNameRus'+ajaxObjectId).text($('#currentManufacturerNameRus').val());
				                      		$('#countryNameRus'+ajaxObjectId).text($('#currentManufacturerCountryId').val());
				                      		$('#manufacturerNameEn'+ajaxObjectId).text($('#currentManufacturerNameEn').val());
				                      		$('#manufacturerNote'+ajaxObjectId).text($('#currentManufacturerNote').val());
				                      		/*Closing Modal.*/
				                       	    closingModal(ajaxObjectId, successMsg);	
				                      } else {
					                        /*For newly added records we insert new one at the end of Datatable object and move coursor to that position.*/
				                    	  	var obj = $('#manufacturer_table').dataTable().fnAddDataAndDisplay( [ $("#ajaxObjectId").val(), 
						                    	                 			                    	     $('#currentManufacturerNameRus').val(), 
						                    	                 			                    	     $('#currentManufacturerCountryId').val(),
						                    	                 			                    	     $('#currentManufacturerNameEn').val(),
						                    	                 			                    	     $('#currentManufacturerNote').val()] 
			 			                    	  													 );
				                    	  	$(obj.nTr).addClass( "success" );
			                      			/*Closing Modal.*/
			                       	    	closingModal($("#ajaxObjectId").val(), successMsg);	
					                  }
		                          }
		                      },	        	        
		       	        error: function(){
		       	        	alert("failure");
		       	        }
	            });           	
	       }
	       
       } );	       
	       
          $("#editManufacture").on("click","#submitCreate", function(){
        	   e.preventDefault();
 			   initiateAjaxCall("create");
          });	       