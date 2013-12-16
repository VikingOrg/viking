<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Механизмов</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="common/menu.jsp" />
			<!-- Begin page content -->
		    <div class="container">
				<form:form id="machine_edit_form" action="machineEdit" commandName="machineEditCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
<!-- 			    Контейнер заголовка блок контента -->
			      <div class="masthead">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${machineEditCommand.formType=='E'}">
					      	<h4 class="text-muted page-header">РЕДАКТИРОВАНИЕ МЕХАНИЗМА<br></h4>
					      </c:when>
					      <c:when test="${registrationCommand.formType=='C'}">
					      	<h4 class="text-muted page-header">КОПИРОВАНИЕ МЕХАНИЗМА<br></h4>
					      </c:when>					      
					      <c:otherwise>
							<h4 class="text-muted page-header">ДОБАВЛЕНИЕ МЕХАНИЗМА<br></h4>
					      </c:otherwise>
						</c:choose>
						
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
			        	
				      	<v:input path="machine.model.name" label="МОДЕЛЬ" required="true" title="Модель"/>
						<v:input path="machine.model.details" label="ХАРАКТЕРИСТИКИ" required="true" title="Укажите характеристики модели"/>
			            <v:input path="machine.inventoryNumb" label="ИНВЕНТАРНЫЙ №" required="true" title="Введите инвентарный номер"/>
			            <v:input path="machine.startDate" label="ДАТА ВВОДА В ЭКСПЛУАТАЦИЮ" required="true" title="Укажите дату ввода в эксплуатацию"/>
						<v:input path="machine.doc" label="КОНТРАКТ №" required="true" title="Укажите документ ввода в эксплуатацию"/>
						<v:input path="machine.transNumb" label="ТРАНС №" required="true" title="Укажите номер Транса"/>
			            <v:input path="machine.factoryNumb" label="ЗАВОДСКОЙ №" required="true" title="Укажите заводской номер"/>

			           <!--  
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">НОМЕНКЛАТУРНЫЙ №</label>
			              <input type="text" class="form-control" name="serial" title="Укажите номенклатурный номер">
			            </div>
			          </div>
			          
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">РЕГИСТРАЦИОННЫЙ №</label>
			              <input type="text" class="form-control" name="serial" title="Укажите регистрационный номер">
			            </div>
			          </div>
			          -->
			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
			        	<div class="form-group">
		                    <label class="form-label">ГРУППА</label>
							<form:select id="groupSelect" path="machine.groupId" cssClass="form-control">
							    <form:option value="">Не выбрана</form:option>
				                <c:forEach items="${machineEditCommand.groupMap}" var="group">
				                    <form:option value="${group.key}" label="${group.value.name}" />
				                </c:forEach>								
							</form:select>
			        	</div>
		        		<!-- <div class="form-group">
				          <label class="form-label">СТРАНА</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>РОССИЯ</option>
				            <option>УКРАИНА</option>
				            <option>ЛАТВИЯ</option>
				          </select>
			        	</div>	
			        	<div class="form-group">
				          <label class="form-label">ПОРТ</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>С-Петербургски</option>
				            <option>Выборгский</option>
				            <option>Высоцкий</option>
				          </select>
			        	</div>	 -->
			        	<div class="form-group">
  				            <label class="form-label">КОМПАНИЯ</label>
							<form:select id="stevidorSelect" path="machine.stevidorId" cssClass="form-control">
							    <form:option value="">Не выбрана</form:option>
				                <c:forEach items="${machineEditCommand.stevidorMap}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
				                </c:forEach>								
							</form:select>
			        	</div>			        		
			        	
				        <div class="form-group">
  				            <label class="form-label">ПРОИЗВОДИТЕЛЬ(Оборудования)</label>
							<form:select id="stevidorSelect" path="machine.model.manufacturerId" cssClass="form-control">
							    <form:option value="">Не выбран</form:option>
				                <c:forEach items="${machineEditCommand.manufacturerMap}" var="manufacturer">
				                    <form:option value="${manufacturer.key}" label="${manufacturer.value.name}" />
				                </c:forEach>								
							</form:select>
			        	</div>		        	
			        	
			        	<!-- 	
			        	<div class="form-group">
				          <label class="form-label">СТРАНА ПРОИЗВОДСТВА</label>
				          <select class="form-control" name="manufacturer">
				          	<option>Выбрать</option>
				            <option>РОССИЯ</option>
				            <option>ГЕРМАНИЯ</option>
				            <option>ЯПОНИЯ</option>
				          </select>
			        	</div>
			        	 -->
			        	 		        		
			        	<div class="form-group">
  				            <label class="form-label">ГОД ПРОИЗВОДСТВА(Выпуска)</label>
							<form:select path="machine.releaseYear" cssClass="form-control">
							   <form:option value="" label="Не выбран"/>
							   <form:options items="${machineEditCommand.yearMap}" />
							</form:select>  				            
			        	</div>			        		
			            <v:input path="machine.location" label="МЕСТО УСТАНОВКИ" title="Укажите место установки"/>

			            <div class="form-group">
				            <label class="form-label">ПРИМЕЧАНИЯ</label>
				            <div class="controls">
				            	<form:textarea path="machine.note" rows="3" cssClass="form-control"/>
				            </div>				            
			        	</div>
			        </div>
			      </div>
			    </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-sm-10 col-sm-offset-1">
			          <br>
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">СОХРАНИТЬ &raquo;</button>
			            <button type="button" class="btn btn-default" 
			            	onclick="window.location.href = '<c:url value="machineSearch"/>';" 
			            	value="Klick">ОТМЕНА &raquo;</button>
			          </div>
			        </div>
			      </div>
			    </div>
			    
			    
		    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
		<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body">
		        <p>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
		        <button type="submit" class="btn btn-primary">СОХРАНИТЬ</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
			    
			</form:form>		
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>