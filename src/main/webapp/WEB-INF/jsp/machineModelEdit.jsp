<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

				<form:form id="machineEditForm" commandName="machineModalEditCommand" action="/machineModel" method="POST" accept-charset="UTF-8">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="text-muted">РЕДАКТИРОВАНИЕ МОДЕЛИ</h4>
				      </div>
				      <div class="modal-body">
   					  	<div class="container">
					      <div class="masthead">
					        <div class="container">
					          <div class="col-md-10 col-md-offset-1">
			                    <!--  Вывод сообщений и предупреждений  -->
								<c:if test="${not empty message}"> 
									<div class="alert alert-success show"><spring:message code="${message}" />
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>			
								</c:if>
								<c:if test="${not empty error}"> 
									<div class="alert alert-danger show"><spring:message code="${error}" />
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>			
								</c:if>	
					          </div>
					        </div>
					      </div>
					      <div class="row">
					        <div class="col-sm-4 col-sm-offset-1">
					        	<v:input path="machineModel.name" label="МОДЕЛЬ" required="true" title="Укажите модель"/>
					            <div class="form-group">
						            <label class="form-label">ПРИМЕЧАНИЯ</label>
						            <div class="controls">
						            	<form:textarea path="machineModel.note" rows="3" cssClass="form-control"/>
						            </div>				            
					        	</div>
					        </div>
					        <div class="col-sm-4 col-sm-offset-1">

								<div class="filter_select">
				                    <label class="form-label">ГРУППА</label>
									<form:select id="groupSelect" path="machineModel.groupId" cssClass="form-control">
									    <form:option value="">Не установлен</form:option>
						                <c:forEach items="${machineModalEditCommand.groupMap}" var="group">
						                    <form:option value="${group.key}" label="(${group.key})${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>
						        <div class="filter_select">
		  				            <label class="form-label">ПРОИЗВОДИТЕЛЬ</label>
									<form:select id="manufacturerSelect" path="machineModel.manufacturerId" cssClass="form-control" title="Выборка по производителю">
									    <form:option value="">Не выбран</form:option>
						                <c:forEach items="${machineModalEditCommand.manufacturerMap}" var="manufacturer">
						                    <form:option value="${manufacturer.key}" label="${manufacturer.value.name}" />
						                </c:forEach>								
									</form:select>
					        	</div>
								<form:hidden id="machineModelId" path="machineModel.modelId" />
					        </div>
					      </div>
					    </div>
				      </div> <!-- /.modal-body -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button id="submitMachineModel" type="button" class="btn btn-primary">Save changes</button>
				      </div>
				 </form:form>
				 <script type="text/javascript">
	                $("#submitMachineModel").click(function(e) {
	                	e.preventDefault();
	                	machineModelId = $('#machineModelId').val();
		                $.ajax({
		                	type: "POST",
		        		    url: "${pageContext.request.contextPath}/machineModel/save/"+machineModelId,
		        		    data: $("#machineEditForm").serialize(),
//		        	        success: function(msg){
//		        	             $("#thanks").html(msg)
//		       	             	 $("#form-content").modal('hide');    
//		        	        },
	                        complete : function( response ) {
	                            $("#machineModelModalContent").html(response.responseText);
	                            $('#machineModelModal').modal('show');
	                            
	                        },	        	        
		        	        error: function(){
		        	        	alert("failure");
		        	        }
		                });
	                 });  				 	
				 </script>
				 