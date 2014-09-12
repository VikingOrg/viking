<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

				<form:form id="ajaxSubmitForm" commandName="machineModalEditCommand" action="/machineModel" method="POST" accept-charset="UTF-8">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<c:if test="${not empty machineModalEditCommand.machineModel.modelId}"> 
				        	<h4 class="text-muted">РЕДАКТИРОВАНИЕ МОДЕЛИ (№ ${machineModalEditCommand.machineModel.modelId})</h4>
				        </c:if>
						<c:if test="${empty machineModalEditCommand.machineModel.modelId}"> 
				        	<h4 class="text-muted">СОЗДАНИЕ НОВОЙ МОДЕЛИ</h4>
				        </c:if>				        
				      </div> <!-- modal header end -->
				      
				      <div class="modal-body">
   					  	<div class="container">
					      <div class="masthead">
								<div class="container">
									<div class="col-md-10 col-md-offset-1">
										<c:if test="${not empty message}">
											<div class="alert alert-success show">
												<span id="successMessage"><spring:message code="${message}" /></span>
												<button type="button" class="close" data-dismiss="alert">&times;</button>
											</div>
										</c:if>					
									
										<c:if test="${not empty error}">
											<div class="alert alert-danger show">
												<spring:message code="${error}" />
												<button type="button" class="close" data-dismiss="alert">&times;</button>
											</div>
										</c:if>
									</div>
								</div>
					      </div>
					      <div class="row">
					        <div class="col-sm-4 col-sm-offset-1">
					        	<v:input id="machineModelName" path="machineModel.name" label="Модель" required="true" title="Укажите модель" maxlength="60"/>
					        	<v:input id="machineModelDetail" path="machineModel.details" label="Характеристика" required="true" title="Укажите характеристики модели" maxlength="250"/>
					        	
					            <div class="form-group">
						            <label class="form-label">Примечания</label>
						            <div class="controls">
						            	<form:textarea id="macnineModelNote" path="machineModel.note" rows="3" cssClass="form-control"/>
						            </div>				            
					        	</div>
					        </div>
					        <div class="col-sm-4 col-sm-offset-1">

								<div class="form-group">
				                    <label class="form-label">Группа*</label>
									<form:select id="groupSelectModal" path="machineModel.groupId" cssClass="form-control" title="Выберите Группу Механизмов">
									    <form:option value="">Не выбрана</form:option>
						                <c:forEach items="${machineModalEditCommand.groupMap}" var="group">
						                    <form:option value="${group.key}" label="${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>
						        <div class="form-group">
		  				            <label class="form-label">Производитель*</label>
									<form:select id="manufacturerSelectModal" path="machineModel.manufacturerId" cssClass="form-control" title="Выберите Производителя">
									    <form:option value="">Не выбран</form:option>
						                <c:forEach items="${machineModalEditCommand.manufacturerMap}" var="manufacturer">
						                    <form:option value="${manufacturer.key}" label="${manufacturer.value.nameRus}" />
						                </c:forEach>								
									</form:select>
					        	</div>
								<!-- Need this for Ajax call -->
								<form:hidden id="ajaxObjectId" path="machineModel.modelId" />
								<form:hidden id="ajaxSuccessFlag" path="successFlag" />					        	
					        </div>
					      </div>
					    </div>
				      </div> <!-- /.modal-body -->

				      <div id="editManufacture" class="modal-footer">
				      	<div class="container">
				             <div class="row">
						        <div class="col-md-4 col-md-offset-1">
						          <h4>* Поля, обязательные к заполнению</h4>
						        </div>
			        			<div class="col-md-4 col-md-offset-1">
							        <button type="button" class="btn cancelbtn" data-dismiss="modal">Отмена</button>
							        
									<c:if test="${not empty machineModalEditCommand.machineModel.modelId}"> 
								        <button id="submitUpdate" type="button" class="btn btn-primary">Сохранить</button>
								        <button id="submitCopy" type="button" class="btn btn-primary">Сохранить как новую</button>
							        </c:if>
									<c:if test="${empty machineModalEditCommand.machineModel.modelId}"> 
								        <button id="submitCreate" type="button" class="btn btn-primary">Создать</button>
							        </c:if>	
							    </div>
							 </div>
				        </div>			        
				      </div>
				      
				 </form:form>
				 <script type="text/javascript">

	                /*Modal code.*/ 
	                $('#machineModelModal').on('shown.bs.modal', function (e) {
	              	  	var height = $(window).height() - 200;
	            	  	$(this).find(".modal-body").css("max-height", height);
	            	               	   
	            	  	$("#submitUpdate").click(function(e) {
	                 	   e.preventDefault();
	                        if ($("#ajaxSubmitForm").valid()) {
	                     	 initiateAjaxCall("update");
	                        }
	                    });
	                    $("#submitCopy").click(function(e) {
	                 	   e.preventDefault();
	                        if ($("#ajaxSubmitForm").valid()) {
	          			     initiateAjaxCall("copy");
	                        }
	                    });
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
	         				                            /*For Ajax DataTable.*/
	         			                        		//var rowData = [];
	         			                        		//$('#'+machineModelId).children('td').each(function(i, data) {
	         			                        			//console.log("Debugging:"+$(this).html()+":End");	
	         			                        			//rowData.push($(this).html());
	         			                       			//});
	         			                        		//oTable.fnUpdate( rowData, document.getElementById(machineModelId) );
	         			                        		//oTable.fnUpdate( $('#machineModelName').val(), document.getElementById(machineModelId), 2 );
	         			                        		/*For DOM DataTable.*/
	         			                        		$('#group'+ajaxObjectId).text($('#groupSelectModal option:selected').text());
	         			                        		$('#name'+ajaxObjectId).text($('#machineModelName').val());
	         			                        		$('#manafacturer'+ajaxObjectId).text($( "#manufacturerSelectModal option:selected" ).text() );
	         			                        		$('#note'+ajaxObjectId).text($('#macnineModelNote').val());
	         			                        		$('#details'+ajaxObjectId).text($('#machineModelDetail').val());
	             			                          
	         				                      		/*Closing Modal.*/
	         				                       	    closingModal(ajaxObjectId, successMsg, $('#groupSelectModal').val());	
	         				                      } else {
	         					                        /**For newly added records we insert new one at the end of Datatable object and move coursor to that position.
	         					                         * Plus since below code specific for one page we check if model table exist  
	         					                         */
	         					                        if($('#modelSearchTable').length){
		         				                    	    var obj = $('#modelSearchTable').dataTable().fnAddDataAndDisplay( [ $("#ajaxObjectId").val(), 
		         				                    	  	                                                                      $('#machineModelName').val(), 
		         				                    	  	                                                                      $('#machineModelDetail').val(),
		         				                    	  	                                                                      $('#groupSelectModal option:selected').text(),
		         				                    	  	                                                                      $("#manufacturerSelectModal option:selected" ).text(),
		         						                    	                 			                    	              "Страна",
		         						                    	                 			                    	              $('#macnineModelNote').val(),
		         						                    	                 			                    	              $('#groupSelectModal').val()] 
		         			 			                    	  													 );

		         				                    	  	$(obj.nTr).addClass( "success" );		         					                        
		         					                    }

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
				 </script>
				 	 
				 	 
				 	 