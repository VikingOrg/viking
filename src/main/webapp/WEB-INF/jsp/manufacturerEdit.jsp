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
						<v:input id="currentManufacturerNameRus" path="currentManufacturer.nameRus" label="Наименование на русском" required="true" title="Введите наименование"/>
						<v:input id="currentManufacturerNameEn" path="currentManufacturer.nameEn" label="Наименование на английском" required="true" title="Введите наименование по английски"/>
					</div>

					<div class="col-sm-4 col-sm-offset-1">
						<div class="form-group">
							<label class="form-label">Страна производства</label>
							<form:select id="currentManufacturerCountryId" path="currentManufacturer.countryId" cssClass="form-control">
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
	        <button type="button" class="btn cancelbtn" data-dismiss="modal">Отмена</button>
	        
			<c:if test="${not empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
		        <button id="submitUpdate" type="button" class="btn btn-primary">Сохранить</button>
		        <button id="submitCopy" type="button" class="btn btn-primary">Скопировать</button>
	        </c:if>
			<c:if test="${empty manufacturerCommand.currentManufacturer.manufacturerId}"> 
		        <button id="submitCreate" type="button" class="btn btn-primary">Создать</button>
	        </c:if>				        
	      </div>			
      		
	</form:form>




