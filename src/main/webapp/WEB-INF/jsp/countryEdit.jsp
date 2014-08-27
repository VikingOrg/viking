<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

	<form:form id="ajaxSubmitForm" commandName="countryCommand" method="post" accept-charset="UTF-8">
		  <div class="modal-header"> <!-- modal header start -->
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<c:if test="${not empty countryCommand.country.countryId}"> 
		        	<h4 class="text-muted">РЕДАКТИРОВАНИЕ СТРАНЫ (№ ${countryCommand.country.countryId})</h4>
		        </c:if>
				<c:if test="${empty countryCommand.country.countryId}"> 
		        	<h4 class="text-muted">ДОБАВЛЕНИЕ СТРАНЫ</h4>
		        </c:if>				        
	      </div> <!-- modal header end -->
	
	      <div class="modal-body"> <!-- Start of modal body -->
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
				
				<div class="row">
					<div class="col-sm-4 col-sm-offset-1">
						<spring:bind path="country.nameRus">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<div class="controls">
									<label class="form-label">Наименование по-русски</label>
									<form:input path="country.nameRus" cssClass="form-control"
										title="Введите наименование" />
									<form:errors class="control-label" path="country.nameRus" />
								</div>
							</div>
						</spring:bind>
		
						<spring:bind path="country.nameEn">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<div class="controls">
									<label class="form-label">Наименование по-английски</label>
									<form:input path="country.nameEn" cssClass="form-control"
										title="Введите полное наименование" />
									<form:errors class="control-label" path="country.nameEn" />
								</div>
							</div>
						</spring:bind>					
					</div>
					<div class="col-sm-4 col-sm-offset-1">
						<div class="form-group">
							<label class="form-label">Примечания</label>
							<div class="controls">
								<form:textarea path="country.countryNote" rows="3"
									cssClass="form-control" />
							</div>
						</div>
					</div>
				</div>
				<!-- Need this for Ajax call -->
				<form:hidden id="ajaxObjectId" path="country.countryId" />
				<form:hidden id="ajaxSuccessFlag" path="successFlag" />
	
		  </div> <!-- end of modal body -->
	
	      <div class="modal-footer"> <!-- Modal Footer Start -->
	        <button type="button" class="btn cancelbtn" data-dismiss="modal">Отмена</button>
	        
			<c:if test="${not empty countryCommand.country.countryId}"> 
		        <button id="submitUpdate" type="button" class="btn btn-primary">Сохранить</button>
		        <button id="submitCopy" type="button" class="btn btn-primary">Скопировать</button>
	        </c:if>
			<c:if test="${empty countryCommand.country.countryId}"> 
		        <button id="submitCreate" type="button" class="btn btn-primary">Создать</button>
	        </c:if>				        
	      </div> <!-- Modal Footer End -->

	</form:form>
	 <script type="text/javascript">

           $("#submitUpdate").click(function(e) {
        	   e.preventDefault();
 			   initiateAjaxCall("update");
           });
           $("#submitCopy").click(function(e) {
        	   e.preventDefault();
 			   initiateAjaxCall("copy");
           });
           $("#submitCreate").click(function(e) {
        	   e.preventDefault();
 			   initiateAjaxCall("create");
           });
           
	       function initiateAjaxCall(requestType){
	            ajaxObjectId =  $("#ajaxObjectId").val();
	            $.ajax({
		               	type: "POST",
		       		    url: "${pageContext.request.contextPath}/country/save/" + requestType,
		       		    data: $("#ajaxSubmitForm").serialize(),
		                      complete : function( response ) {
		                          $("#editModalContent").html(response.responseText);
		                          check = $("#ajaxSuccessFlag").val();
	
		                          if(check=='true'){
			                          var successMsg = $("#successMessage").html();
			                          
			                          if(requestType == "update"){
				                      		/*For DOM DataTable.*/
				                      		$('#name'+ajaxObjectId).text($('#groupName').val());
				                      		$('#note'+ajaxObjectId).text($('#groupNote').val());
				                      		/*Closing Modal.*/
				                       	    closingModal(ajaxObjectId, successMsg);	
				                      } else {
				                    	  	var obj = $('#country_table').dataTable().fnAddDataAndDisplay( [ $("#ajaxObjectId").val(), 
						                    	                 			                    	     $('#groupName').val(), 
						                    	                 			                    	     $('#groupName').val()] 
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

        
	 </script>