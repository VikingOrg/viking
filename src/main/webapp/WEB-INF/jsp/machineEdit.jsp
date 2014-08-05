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
	    <title>Редактирование Механизма</title>
	    <meta name="viewport" content="width=device-width">
        <jsp:include page="common/headCoreElements.jsp" />
        
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
	    <script type="text/javascript" src="<c:url value="/static/js/responsive-tabs.js"/>"></script>
	    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
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
              document.getElementById('file-input').onchange = function (e) {
            	    loadImage(
            	        e.target.files[0],
            	        function (img) {
            	            document.body.appendChild(img);
            	        },
            	        {maxWidth: 600} // Options
            	    );
            	};

                $("a[rel^='tableRowEdit']").click(function(e){

                    $.ajax('${pageContext.request.contextPath}/machineModel/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#machineModelModalContent").html(response.responseText);
                            $('#machineModelModal').modal('show');
                            
                        }
                    });
                });            	
		  });

      	function closingModal(machineModelId){
    		$('#machineModelModal').modal('hide');
    		//$('#'+machineModelId).removeClass("odd even");
    		$('#'+machineModelId).addClass( "success" );
    		//var myClass = $('#'+machineModelId).attr('class');        		
    		//alert("classes = " + myClass);
        }
        
		  </script>
		  <style type="text/css">
			.report_header{
				font-family: 'Open Sans', sans-serif;
				font-weight:300;
				font-style: italic;
			}
		  </style>			  
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container"> 
				<form:form id="machine_edit_form" action="machineEdit" commandName="machineEditCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
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
			    	<ul id="machineEditTab" class="nav nav-tabs responsive" role="tablist">
					      <li class="active"><a href="#main" role="tab" data-toggle="tab">
					      Основные характеристики (Устройства №<c:out value="${machineEditCommand.machine.machineId}"/>)</a></li>
					      <li><a href="#image" role="tab" data-toggle="tab">Изображение</a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content responsive">
					    
					      <div class="tab-pane fade in active tab-bordered" id="main">
		<!-- 			    Контейнер заголовка блока контента -->
					          
						      <div class="row">
						        <div class="col-sm-4 col-sm-offset-1">
						            <label class="form-label">
						            	<span class="required">Описание механизма*</span>
						            	<span class="report_header">(Пример правильного описания: Старый кран, кабина разбита...
						        	Пример не правильного описания: Портальный Кран ГАНЦ 5/6тн. Стрела 30м.)</span>
						            </label>
						        	<v:input path="machine.name"  title="Описание Механизма"/>
						        	<spring:bind path="machine.groupId">
							        	<div class="form-group ${status.error ? 'has-error' : '' }">
						                    <label class="form-label">Группа*</label>
											<form:select id="groupSelect" path="machine.groupId" cssClass="form-control">
											    <form:option value="0">Не выбрана (отсутствует)</form:option>
								                <c:forEach items="${machineEditCommand.groupMap}" var="group">
								                    <form:option value="${group.key}" label="${group.value.name}" />
								                </c:forEach>								
											</form:select>
											<form:errors path="machine.groupId" cssClass="control-label"/>
							        	</div>
						        	</spring:bind>
						        	<spring:bind path="machine.modelId">
							        	<div class="form-group ${status.error ? 'has-error' : '' }">
						                    <label class="form-label">Модель*
						                    	<span class="report_header">(Нету в списке? Создайте <a href="#" rel="tableRowEdit" data-param1="3">
						                    	новую</a>.)</span>
						                    </label>
											<form:select id="modelSelect" path="machine.modelId" cssClass="form-control">
												<form:option value="0">Не выбрана (отсутствует)</form:option>
								                <c:forEach items="${machineEditCommand.machineModelMap}" var="model">
								                    <form:option value="${model.key}" label="${model.value.name}" />
								                </c:forEach>									
											</form:select>
											<form:errors path="machine.modelId" cssClass="control-label"/>
											<span class="report_header">Характеристика Модели:</span><br/>
							            	<span class="report_header">Компания Произовдитель:</span><br/>
							            	<span class="report_header">Место Производства:</span><br/>
											
							        	</div>
						        	</spring:bind>
						        	
						        	
						        							        	
						        	<div class="form-group">
			  				            <label class="form-label">Компания*</label>
										<form:select id="stevidorSelect" path="machine.stevidorId" cssClass="form-control">
										    <form:option value="">Не выбрана (отсутствует)</form:option>
							                <c:forEach items="${machineEditCommand.stevidorMap}" var="stevidor">
							                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
							                </c:forEach>								
										</form:select>
										<span class="report_header">Порт приписки:</span><br/>
										<span class="report_header">Страна:</span><br/>
						        	</div>		
									
									<%-- 						        	 	
						        	<div class="form-group">
							          <label class="form-label">Страна Производства</label>
							          <select class="form-control" name="manufacturer">
							          	<option>Все</option>
							            <option>Россия</option>
							            <option>Германия</option>
							            <option>Япония</option>
							          </select>
						        	</div>
						        	 --%>        		
						        	<div class="form-group">
			  				            <label class="form-label">Год производства(Выпуска)</label>
										<form:select path="machine.releaseYear" cssClass="form-control">
										   <form:option value="" label="Не выбран"/>
										   <form:options items="${machineEditCommand.yearMap}" />
										</form:select>  				            
						        	</div>			        		
						            <v:input path="machine.location" label="МЕСТО УСТАНОВКИ" title="Укажите место установки"/>
						            
						            
						            * - Поля обязательные к заполнению.
						        </div>
						        <div class="col-sm-4 col-sm-offset-1">
							      	<%-- 
									<v:input path="machine.details" label="Характеристики" required="true" title="Укажите характеристики модели"/>
									--%>
						            <v:input path="machine.inventoryNumb" label="Инвентарный №" required="true" title="Введите инвентарный номер"/>
						            <v:input path="machine.startDate" label="Дата ввода в эксплуатацию" required="true" title="Укажите дату ввода в эксплуатацию" id="datepicker"/>
									<v:input path="machine.doc" label="Контракт №" required="true" title="Укажите документ ввода в эксплуатацию"/>
									<v:input path="machine.transNumb" label="Транс №" required="true" title="Укажите номер Транса"/>
						            <v:input path="machine.factoryNumb" label="Заводской №" required="true" title="Укажите заводской номер"/>
						            <v:input path="machine.nomNo" label="Номенклатурный №" required="true" title="Укажите номенклатурный номер"/>
						            <v:input path="machine.regNo" label="Регистрационный №" required="true" title="Укажите регистрационный номер"/>
			
						            <div class="form-group">
							            <label class="form-label">Примечания</label>
							            <div class="controls">
							            	<form:textarea path="machine.note" rows="3" cssClass="form-control"/>
							            </div>				            
						        	</div>
						        </div>
						      </div>
				      </div>
				      <div class="tab-pane fade in active tab-bordered" id="image">
		<!-- 			    Контейнер заголовка блока изображения -->
							<div class="panel panel-default" style="margin:10px; margin:10px;">
							      <div class="panel-heading">Кран (Такой-то)</div>
							      	<div class="panel-body">
											<div id="result" class="result">
											    
											</div>
										
								     </div>
							</div>
								<div class="row">
					          			<div class="col-sm-4 col-sm-offset-1">
											<p><input type="file" id="file-input"></p>
											<p id="actions" style="display:none;">
												<button class="btn btn-primary"  type="button" id="edit">Редактировать</button>
												<button class="btn btn-primary"  type="button" id="crop">Обрезать</button>
											</p>
										</div>
								</div>
					    </div>
				     </div>
			    </div>
			    <div class="container">
			      <div class="form-actions" style= "padding: 20px">
			          <br>
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
			            <input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()" value="Скопировать" />
			            <a class="cancelbtn" type="button"
			            	onclick="window.location.href = '<c:url value="machineSearch"/>';" 
			            	value="Klick">Отмена</a>
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
			
				<div id="machineModelModal" class="modal modal-wide fade">
				  <div class="modal-dialog">
				    <div id="machineModelModalContent" class="modal-content">
				    
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->			
					
			</div> <!-- End of Main Container -->
	
	</div> <!-- Closing div tag for wrap -->
		   <jsp:include page="common/footer.jsp" />

	</body>
</html>