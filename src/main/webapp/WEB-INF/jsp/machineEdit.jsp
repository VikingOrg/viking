<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>



<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Механизмов</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
	    
	    <!--[if lt IE 9]>
			<script type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js.response.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/dataTables.tableTools.js" ></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script>
		  $(document).ready(function() {
		      $( "#datepicker" ).datepicker( { dateFormat: "dd/mm/yy", firstDay: 1, dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ], 
				  monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ] });

              $('#groupSelect').change(function() {
            	  var groupId = $(this).val();
            	  if(groupId=='0'){
            		  $('#modelSelect').html("<option value='0'>Не выбрана</option>");
                  } else {
	                  $.getJSON('${pageContext.request.contextPath}/machineEdit/model/' + groupId, function(machineModel) {
	                      var options='';
	                      $.each(machineModel, function (i, e) {
	                          options += "<option value='" + e.modelId + "'>" + e.name + "</option>";
	                      });
	                      $('#modelSelect').html(options);
	                  });
                  }
              });
		  });
		  </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container"> 
				<form:form id="machine_edit_form" action="machineEdit" commandName="machineEditCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
<!-- 			    Контейнер заголовка блока контента -->
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${machineEditCommand.formType=='E'}">
					      	<h3 class="page-header">Редактирование механизма<br></h3>
					      </c:when>
					      <c:when test="${registrationCommand.formType=='C'}">
					      	<h3 class="page-header">Копирование механизма<br></h3>
					      </c:when>					      
					      <c:otherwise>
							<h3 class="page-header">Добавление механизма<br></h3>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>
			          </div>
			      <div class="row">
			        <div class="col-sm-4 col-sm-offset-1">
				      	
						<v:input path="machine.details" label="Характеристики" required="true" title="Укажите характеристики модели"/>
			            <v:input path="machine.inventoryNumb" label="Инвентарный №" required="true" title="Введите инвентарный номер"/>
			            <v:input path="machine.startDate" label="Дата ввода в эксплуатацию" required="true" title="Укажите дату ввода в эксплуатацию" id="datepicker"/>
						<v:input path="machine.doc" label="Контракт №" required="true" title="Укажите документ ввода в эксплуатацию"/>
						<v:input path="machine.transNumb" label="Транс №" required="true" title="Укажите номер Транса"/>
			            <v:input path="machine.factoryNumb" label="Заводской №" required="true" title="Укажите заводской номер"/>
			            
			           <!--  
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">Номенклатурный №</label>
			              <input type="text" class="form-control" name="serial" title="Укажите номенклатурный номер">
			            </div>
			          </div>
			          
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">Регистрационный №</label>
			              <input type="text" class="form-control" name="serial" title="Укажите регистрационный номер">
			            </div>
			          </div>
			          -->
			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
			        	<spring:bind path="machine.groupId">
				        	<div class="form-group ${status.error ? 'has-error' : '' }">
			                    <label class="form-label">Группа</label>
								<form:select id="groupSelect" path="machine.groupId" cssClass="form-control">
								    <form:option value="0">Все</form:option>
					                <c:forEach items="${machineEditCommand.groupMap}" var="group">
					                    <form:option value="${group.key}" label="${group.value.name}" />
					                </c:forEach>								
								</form:select>
								<form:errors path="machine.groupId" cssClass="control-label"/>
				        	</div>
			        	</spring:bind>
			        	<spring:bind path="machine.modelId">
				        	<div class="form-group ${status.error ? 'has-error' : '' }">
			                    <label class="form-label">Модель</label>
								<form:select id="modelSelect" path="machine.modelId" cssClass="form-control">
									<form:option value="0">Все</form:option>
					                <c:forEach items="${machineEditCommand.machineModelMap}" var="model">
					                    <form:option value="${model.key}" label="${model.value.name}" />
					                </c:forEach>									
								</form:select>
								<form:errors path="machine.modelId" cssClass="control-label"/>
				        	</div>
			        	</spring:bind>
					        	
		        		<!-- <div class="form-group">
				          <label class="form-label">Страна</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>РОССИЯ</option>
				            <option>УКРАИНА</option>
				            <option>ЛАТВИЯ</option>
				          </select>
			        	</div>	
			        	<div class="form-group">
				          <label class="form-label">Порт</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>С-Петербургски</option>
				            <option>Выборгский</option>
				            <option>Высоцкий</option>
				          </select>
			        	</div>	 -->
			        	<sec:authorize access="hasRole('ROLE_ADMIN')">
			        	<div class="form-group">
  				            <label class="form-label">Компания</label>
							<form:select id="stevidorSelect" path="machine.stevidorId" cssClass="form-control">
							    <form:option value="">Все</form:option>
				                <c:forEach items="${machineEditCommand.stevidorMap}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
				                </c:forEach>								
							</form:select>
			        	</div>		
			        	</sec:authorize>    		
			        	
			        	<!--
				        <div class="form-group">
  				            <label class="form-label">Производитель(Оборудования)</label>
							<form:select id="stevidorSelect" path="machine.machineModel.manufacturerId" cssClass="form-control">
							    <form:option value="">Все</form:option>
				                <c:forEach items="${machineEditCommand.manufacturerMap}" var="manufacturer">
				                    <form:option value="${manufacturer.key}" label="${manufacturer.value.nameRus}" />
				                </c:forEach>								
							</form:select>
			        	</div>		        	
			        	 	
			        	<div class="form-group">
				          <label class="form-label">Страна Производства</label>
				          <select class="form-control" name="manufacturer">
				          	<option>Все</option>
				            <option>Россия</option>
				            <option>Германия</option>
				            <option>Япония</option>
				          </select>
			        	</div>
			        	 -->
			        	 		        		
			        	<div class="form-group">
  				            <label class="form-label">Год производства(Выпуска)</label>
							<form:select path="machine.releaseYear" cssClass="form-control">
							   <form:option value="" label="Не выбран"/>
							   <form:options items="${machineEditCommand.yearMap}" />
							</form:select>  				            
			        	</div>			        		
			            <v:input path="machine.location" label="МЕСТО УСТАНОВКИ" title="Укажите место установки"/>

			            <div class="form-group">
				            <label class="form-label">Примечания</label>
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
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
			            <a class="cancelbtn" type="button"
			            	onclick="window.location.href = '<c:url value="machineSearch"/>';" 
			            	value="Klick">Отмена</a>
			          </div>
			        </div>
			      </div>
			    </div>
			    
			    
		    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
		<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</h4>
		      </div>
		      <div class="modal-footer">
		        <a class="cancelbtn" type="button" data-dismiss="modal">Отмена</a>
		        <button type="submit" class="btn btn-primary">Сохранить</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
			    
			</form:form>		
			</div> <!-- End of Main Container -->
	
	</div> <!-- Closing div tag for wrap -->
		   <jsp:include page="common/footer.jsp" />
		
	</body>
</html>