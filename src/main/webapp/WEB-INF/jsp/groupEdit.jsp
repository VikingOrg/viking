<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<form:form id="ajaxSubmitForm" action="/groupEdit" commandName="groupCommand" method="post" accept-charset="UTF-8">

	      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<c:if test="${not empty groupCommand.currentGroup.groupId}"> 
		        	<h4 class="text-muted">РЕДАКТИРОВАНИЕ ГРУППЫ (№ ${groupCommand.currentGroup.groupId})</h4>
		        </c:if>
				<c:if test="${empty groupCommand.currentGroup.groupId}"> 
		        	<h4 class="text-muted">СОЗДАНИЕ НОВОЙ ГРУППЫ</h4>
		        </c:if>				        
	      </div> <!-- modal header end -->
	
	
	      <div class="modal-body">
				<div class="container">
					<div class="col-md-10 col-md-offset-1">
						<c:if test="${not empty error}">
							<div class="alert alert-danger show">
								<spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-sm-offset-1">
						<v:input id = "groupName" path="currentGroup.name" label="Наименование" required="true" title="Введите наименование"/>
					</div>
					<div class="col-sm-4 col-sm-offset-1">
						<div class="form-group">
							<label class="form-label">Примечания</label>
							<div class="controls">
								<form:textarea id="groupNote" path="currentGroup.groupNote" rows="3" cssClass="form-control" />
							</div>
						</div>
					</div>
				</div>
				<!-- Need this for Ajax call -->
				<form:hidden id="ajaxObjectId" path="currentGroup.groupId" />
				<form:hidden id="ajaxSuccessFlag" path="successFlag" />
	
		  </div> <!-- end of modal body -->
			
			
	      <div class="modal-footer">
	        <button type="button" class="btn cancelbtn" data-dismiss="modal">Отмена</button>
	        <button id="submitAjax" type="button" class="btn btn-primary">Сохранить</button>
	        <button id="submitAjax" type="button" class="btn btn-primary">Скопировать</button>
	      </div>
      		
	</form:form>



	 <script type="text/javascript">
              $("#submitAjax").click(function(e) {
              	e.preventDefault();
              	ajaxObjectId =  $("#ajaxObjectId").val();
               $.ajax({
               	type: "POST",
       		    url: "${pageContext.request.contextPath}/group/save/",
       		    data: $("#ajaxSubmitForm").serialize(),
                      complete : function( response ) {
                          $("#groupEditModalContent").html(response.responseText);
                          check = $("#ajaxSuccessFlag").val();
                          if(check=='true'){
                      		/*For DOM DataTable.*/
                      		$('#name'+ajaxObjectId).text($('#groupName').val());
                      		$('#note'+ajaxObjectId).text($('#groupNote').val());

                      		/*Closing Modal.*/
                       	closingModal(ajaxObjectId);	
                       }
                      },	        	        
       	        error: function(){
       	        	alert("failure");
       	        }
               });
               });  				 	
	 </script>

