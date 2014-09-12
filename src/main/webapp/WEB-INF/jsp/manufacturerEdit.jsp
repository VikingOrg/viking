<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<form:form id="ajaxSubmitForm" action="/manufacturerEdit" commandName="manufacturerCommand" method="post" accept-charset="UTF-8">

	      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<c:if test="${not empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
		        	<h4 class="text-muted">РЕДАКТИРОВАНИЕ ФИРМЫ ПРОИЗВОДТЕЛЯ (№ ${manufacturerCommand.currentManufacturer.manufacturerId})</h4>
		        </c:if>
				<c:if test="${empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
		        	<h4 class="text-muted">СОЗДАНИЕ НОВОЙ ФИРМЫ ПРОИЗВОДИТЕЛЯ</h4>
		        </c:if>				        
	      </div> <!-- modal header end -->
	
	
	      <div class="modal-body">
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
						<v:input id="currentManufacturerNameRus" path="currentManufacturer.nameRus" label="Наименование на русском" required="true" title="Введите наименование" maxlength="100"/>
						<v:input id="currentManufacturerNameEn" path="currentManufacturer.nameEn" label="Наименование на английском" required="true" title="Введите наименование на английском" maxlength="100"/>
					</div>

					<div class="col-sm-4 col-sm-offset-1">
						<div class="form-group">
							<label class="form-label">Страна производства</label>
							<form:select id="currentManufacturerCountryId" path="currentManufacturer.countryId" cssClass="form-control" title="Выберите Страну размещения">
								<form:option value="">Не выбрана</form:option>
								<c:forEach items="${manufacturerCommand.countryMap}" var="country">
									<form:option value="${country.key}" label="${country.value.nameRus}" />
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<label class="form-label">Примечания</label>
							<div class="controls">
								<form:textarea id="currentManufacturerNote" path="currentManufacturer.note" rows="3"
									cssClass="form-control" />
							</div>
						</div>
					</div>					
				</div>
				<!-- Need this for Ajax call -->
				<form:hidden id="ajaxObjectId" path="currentManufacturer.manufacturerId" />
				<form:hidden id="ajaxSuccessFlag" path="successFlag" />
	
		  </div> <!-- end of modal body -->

	      <div id="editManufacture" class="modal-footer">
	      	<div class="container">
	             <div class="row">
			        <div class="col-md-4 col-md-offset-1">
			          <h4>* Поля, обязательные к заполнению</h4>
			        </div>
        			<div class="col-md-4 col-md-offset-1">
				        <button type="button" class="btn cancelbtn" data-dismiss="modal">Отмена</button>
				        
						<c:if test="${not empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
					        <button id="submitUpdate" type="button" class="btn btn-primary">Сохранить</button>
					        <%--
					        <button id="submitCopy" type="button" class="btn btn-primary">Скопировать</button>
					         --%>
				        </c:if>
						<c:if test="${empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
					        <button id="submitCreate" type="button" class="btn btn-primary">Создать</button>
				        </c:if>				
				    </div>
				 </div>
	        </div>		        
	      </div>			
      		
	</form:form>
	 <script type="text/javascript">

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
				                      		$('#countryNameRus'+ajaxObjectId).text($("#currentManufacturerCountryId option:selected").text());
				                      		$('#manufacturerNameEn'+ajaxObjectId).text($('#currentManufacturerNameEn').val());
				                      		$('#manufacturerNote'+ajaxObjectId).text($('#currentManufacturerNote').val());
				                      		/*Closing Modal.*/
				                       	    closingModal(ajaxObjectId, successMsg);	
				                      } else {
					                        /*For newly added records we insert new one at the end of Datatable object and move coursor to that position.*/
				                    	  	var obj = $('#manufacturer_table').dataTable().fnAddDataAndDisplay( [ $("#ajaxObjectId").val(), 
						                    	                 			                    	     $('#currentManufacturerNameRus').val(), 
						                    	                 			                    	    $("#currentManufacturerCountryId option:selected").text(),
						                    	                 			                    	     $('#currentManufacturerNameEn').val(),
						                    	                 			                    	     $('#currentManufacturerNote').val()] 
			 			                    	  													 );
				                    	  	$(obj.nTr).addClass( "success" );
			                       	    	closingModal($("#ajaxObjectId").val(), successMsg);	
					                  }
		                          } else {
		                        	  closingModal($("#ajaxObjectId").val(), "Все плохо!");	
   		                      }
		                          
		                },	        	        
		       	        error: function(){
		       	        	alert("failure");
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
		                     
            $("#currentManufacturerNameRus").rules("add", {required:true});
            $("#currentManufacturerNameEn").rules("add", {required:true});
            $("#currentManufacturerCountryId").rules("add", {required:true});

               
	 </script>




