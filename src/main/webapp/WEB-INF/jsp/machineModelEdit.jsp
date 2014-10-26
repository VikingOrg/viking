<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	    <script type="text/javascript" src="<c:url value="/static/js/responsive-tabs.js"/>"></script>
	    
				<form:form id="ajaxSubmitForm" commandName="machineModalEditCommand" action="/machineModel" method="POST" accept-charset="UTF-8">
				      
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					  <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<c:if test="${not empty machineModalEditCommand.machineModel.modelId}"> 
				        	<h4 class="text-muted">РЕДАКТИРОВАНИЕ МОДЕЛИ (№ ${machineModalEditCommand.machineModel.modelId})</h4>
				        </c:if>
						<c:if test="${empty machineModalEditCommand.machineModel.modelId}"> 
				        	<h4 class="text-muted">СОЗДАНИЕ НОВОЙ МОДЕЛИ</h4>
				        </c:if>				        
				      </div> <!-- modal header end -->
					</sec:authorize>
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
 					      <div class="container">
					      	<ul id="machineEditTab" class="nav nav-tabs" role="tablist">
						      <li class="active">
						      	  <a href="#main" role="tab" data-toggle="tab">
								   	  Основные характеристики
						      	  </a>
						      </li>
						      <li><a id="click_to_init" href="#tab_image" role="tab" data-toggle="tab">Изображение</a></li>
						    </ul>
				    		
							<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade tab-bordered" id="tab_image">
							          	<div class="container">
													<div class="input-append">
														<div class="row" style="margin:5px">
													       <input id="lefile" type="file" style="display:none">
														    <div class="pull-left" style="margin:15px">
														    	<a class="btn btn-primary" onclick="$('input[id=lefile]').click();">Открыть</a>
														    </div>
														    <div class="pull-left" style="margin:15px">
														    	<input id="photoCover" class="form-control" type="text">
														    </div>
														    <div class="" style="margin:15px">
														    	<input id="submit_avatar" type="submit" value="Загрузить" class="btn btn-primary"/>
														    </div>
														</div>
														<div class="row" style="margin:15px">
															<img alt="" id="userImg" src="<spring:url value="/fileController/getModelImg/${machineModalEditCommand.machineModel.modelImg}" htmlEscape="true"/>"/>
									        				<br>
															<!-- Need this for Ajax call -->
															<form:hidden id="ajaxObjectId" path="machineModel.modelId" />
															<form:hidden id="ajaxSuccessFlag" path="successFlag" />
															<form:hidden id="modelImage" path="machineModel.modelImg"/>
														 </div>
													</div>
													<script type="text/javascript">
														$('input[id=lefile]').change(function() {
														$('#photoCover').val($(this).val());
														});
													</script>	
							        	</div>	
									</div>	
									
									<div class="tab-pane fade in active tab-bordered" id="main">
							      		<div class="container" style="margin-top:15px">
									        <div class="col-sm-4 col-sm-offset-1">
									        	<v:input id="machineModelName" path="machineModel.name" label="Модель" required="true" title="Укажите модель" maxlength="60"/>
									        	<v:input id="machineModelDetail" path="machineModel.details" label="Характеристика" required="false" title="Укажите характеристики модели" maxlength="250"/>
									        	
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
									        </div>
								        </div>
								  </div>  
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
							        <button type="button" class="btn cancelbtn" data-dismiss="modal" >Отмена</button>
							        
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<c:if test="${not empty machineModalEditCommand.machineModel.modelId}"> 
								        <button id="saveExisting" type="button" class="btn btn-primary">Сохранить</button>
							        </c:if>	
									<c:if test="${empty machineModalEditCommand.machineModel.modelId}"> 
								        <button id="submitCreate" type="button" class="btn btn-primary">Создать</button>
							        </c:if>	
									</sec:authorize>
							    </div>
							 </div>
				        </div>			        
				      </div>
				      
				 </form:form>
				 <script type="text/javascript">
				 
	                /*Modal code.*/ 
						$('#machineModelModal').data( "id", "" );
	                
	              	  	var height = $(window).height() - 200;
	            	  	$(this).find(".modal-body").css("max-height", height);
	            	               	   
	                    $("#submitCopy").click(function(e) {
	                 	    e.preventDefault();
	                        if ($("#ajaxSubmitForm").valid()) {
	          			       initiateAjaxCall("copy");
	                        }
	                    });
	                    
	                    $("#saveExisting").on("click", function(e) {
		                 	   e.preventDefault();
		                       if ($("#ajaxSubmitForm").valid()) {
		          			      initiateAjaxCall("update");
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
	                $("#machineModelDetail").rules("add", {required:false}); 
	                $("#groupSelectModal").rules("add", {required:true});
	                $("#manufacturerSelectModal").rules("add", {required:true}); 

					$("#submit_avatar").click( function(e) {
						e.preventDefault();
	 				    var formData = new FormData();
						formData.append('file', $('#lefile')[0].files[0]);
						formData.append("name", "name");
						$.ajax({
						       url: '${pageContext.request.contextPath}/fileController/model/${machineModalEditCommand.machineModel.modelId}',
						       data: formData,
						       async: false,
						       contentType: false,
						       processData: false,
						       cache: false,
						       type: 'POST',
						       success: function(response) {
							       var newFileName = response[0].fileName;
						    	   $("#userImg").attr("src", "${pageContext.request.contextPath}/fileController/getModelImg/"+newFileName+"?timestamp=" + new Date().getTime());
						           //alert('Успешно загружен!');
						           $("#modelImage").val(newFileName);
						       },
				               error: errorHandler = function() {
				                    alert("Файл успешно загрузился в черную дыру!");
				               },					       
						     });    return false;    
					});		                

				 </script>

				 	 
				 	 
				 	 