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
	                	  $('#model_details').html("Характеристика Модели:");
	                	  $('#model_manuf_name_rus').html("Компания Произовдитель:");
	                	  $('#model_manuf_country_name_rus').html("Место Производства:");
	                      var options='<option value="0">Не выбрана</option>';
	                      $.each(machineModel, function (i, e) {
	                          options += "<option value='" + e.modelId + "'>" + e.name + "</option>";
	                      });
	                      $('#modelSelect').html(options);
	                  });
                  }
              });

              $('#modelSelect').change(function() {refreshModel($(this).val());});

              $('#stevidorSelect').change(function() {
            	  var stevidorId = $(this).val();
                  $.getJSON('${pageContext.request.contextPath}/stevidorEdit/getStevidor/' + stevidorId, function(stevidor) {
                	  if (!$.trim(stevidor.port.name)) {
                		  $('#stevidor_port_name').html("Порт приписки: Отсутсвует!");
                      } else {
                    	  $('#stevidor_port_name').html("Порт приписки: "+stevidor.port.name);
                      }
                	  if (!$.trim(stevidor.port.country.nameRus)) {
                		  $('#stevidor_port_country_name_rus').html("Страна: Отсутсвует!");
                      } else {
                    	  $('#stevidor_port_country_name_rus').html("Страна: "+stevidor.port.country.nameRus);
                      }
                  });
              });

	          $("#edit_machine_model").on("click","#editExistingModel", function(){
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
                
              $("a[rel^='createNewModel']").click(function(e){
                    $.ajax('${pageContext.request.contextPath}/machineModel/createNew/', {
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

      	function refreshModel(modelId){
          $.getJSON('${pageContext.request.contextPath}/machineEdit/getModel/' + modelId, function(machineModel) {
        	  if (!$.trim(machineModel.details)) {
        		  $('#model_details').html("Характеристика Модели: Отсутсвует!");
              } else {
            	  $('#model_details').html("Характеристика Модели: "+machineModel.details);
              }
        	  if (!$.trim(machineModel.manufacturer.nameRus)) {
        		  $('#model_manuf_name_rus').html("Компания Произовдитель: Отсутсвует!");
              } else {
            	  $('#model_manuf_name_rus').html("Компания Произовдитель: "+machineModel.manufacturer.nameRus);
              }
        	  if (!$.trim(machineModel.manufacturer.nameRus)) {
        		  $('#model_manuf_country_name_rus').html("Место Производства: Отсутсвует!");
              } else {
            	  $('#model_manuf_country_name_rus').html("Место Производства: "+machineModel.manufacturer.country.nameRus);
              }
        	  if (!$.trim(machineModel.note)) {
        		  $('#model_note').html("Примечание: Отсутсвует!");
              } else {
            	  $('#model_note').html("Примечание: "+machineModel.note);
              }
              
              /*href to a new model.*/
        	  if (!$.trim(machineModel.modelId)) {
        		  $('#edit_machine_model').html("текущую");
              } else {
            	  $('#edit_machine_model').html("<a href='#' id='editExistingModel' data-param1='"+machineModel.modelId+"'>текущую</a>");
              }
          });
        }
		  
      	function closingModal(machineModelId){
    		$('#machineModelModal').modal('hide');
    		refreshModel(machineModelId);
    		//$('#'+machineModelId).removeClass("odd even");
    		//$('#'+machineModelId).addClass( "success" );
    		//var myClass = $('#'+machineModelId).attr('class');        		
        }
        
		  </script>
		  <style type="text/css">
		  
			.tab-pane-red {
			    border-left: 1px solid red;
			    border-right: 1px solid red;
			    border-bottom: 1px solid red;
			    border-top: 1px solid red;
			    border-radius: 0px 0px 5px 5px;
			    padding: 10px;
			}
			.active-red{
			    border-top-left-radius: 5px;
			    border-top-right-radius: 5px;
			    border-left: 1px solid red;
			    border-right: 1px solid red;
			    border-top: 1px solid red;			
			    border-bottom:none;

			}
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
				
				<!-- Start of Tab Container -->
			    <div class="container">
					<div class="col-md-10 col-md-offset-1">
						<c:choose>
							<c:when test="${machineEditCommand.formType=='E'}">
								<h3 class="page-header">
									Редактирование механизма<br>
								</h3>
							</c:when>
							<c:when test="${registrationCommand.formType=='C'}">
								<h3 class="page-header">
									Копирование механизма<br>
								</h3>
							</c:when>
							<c:otherwise>
								<h3 class="page-header">
									Добавление механизма<br>
								</h3>
							</c:otherwise>
						</c:choose>

						<c:if test="${not empty error}">
							<div class="alert alert-danger show">
								<spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
					</div>
				</div>
				<!-- Start of Tab Container -->	
				<div class="container">	
				    <ul id="machineEditTab" class="nav nav-tabs responsive" role="tablist">
				      <li class="active <c:if test="${machineEditCommand.machine.archived == '1'}">active-red</c:if>"">
				      	  <a href="#main" role="tab" data-toggle="tab">
						   	  Основные характеристики (Устройство №<c:out value="${machineEditCommand.machine.machineId} "/><c:if test="${machineEditCommand.machine.archived == '1'}">Удалено!</c:if>)
				      	  </a>
				      </li>
				      <li><a href="#tab_image" role="tab" data-toggle="tab">Дополнительные сведения</a></li>
				    </ul>
				    
					<div id="myTabContent" class="tab-content responsive">
					
		

							<div class="tab-pane fade tab-bordered <c:if test="${machineEditCommand.machine.archived == '1'}">tab-pane-red</c:if>" id="tab_image">
							      <div class="row">
							        <div class="col-sm-9 col-sm-offset-1">
							        	<div class="">
											<div class="panel panel-default"
												style="margin: 10px; margin: 10px;">
												<div class="panel-heading">Кран (Такой-то)</div>
												<div class="panel-body">
													<div id="result" class="result"></div>
				
												</div>
											</div>
							            </div>
							            
							        </div>							      
								  </div>	
							      <div class="row">
							        <div class="col-sm-9 col-sm-offset-1">
							        	<div class="">
										    <div class="col-sm-4 col-sm-offset-1">
												<p>
													<input type="file" id="file-input">
												</p>
												<p id="actions" style="display: none;">
													<button class="btn btn-primary" type="button" id="edit">Редактировать</button>
													<button class="btn btn-primary" type="button" id="crop">Обрезать</button>
												</p>
											</div>							
							            </div>
							        </div>							      
								  </div>									  
								  
								  
							</div>
							<div class="tab-pane fade in active tab-bordered <c:if test="${machineEditCommand.machine.archived == '1'}">tab-pane-red</c:if>"" id="main">
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
							                    	<span class="report_header">
							                    		(Нету в списке? Создайте <a href="#" rel="createNewModel">
								                    	новую</a>, или отредактируйте
								                    	<span id="edit_machine_model">
									                    	<a href="#" id="editExistingModel" 
									                    	data-param1="<c:out value="${machineEditCommand.machine.modelId}"/>">
									                    	текущую</a>
									                    </span> 
									                    модель механизма.)
								                    	
							                    	</span>
							                    </label>
												<form:select id="modelSelect" path="machine.modelId" cssClass="form-control">
													<form:option value="0">Не выбрана (или отсутствует в базе моделей)</form:option>
									                <c:forEach items="${machineEditCommand.machineModelMap}" var="model">
									                    <form:option value="${model.key}" label="(${model.key})${model.value.name}" />
														<c:if test="${machineEditCommand.machine.modelId == model.key}">
															<c:set var="currentModel" scope="request" value="${model.value}"/> 
														</c:if>									                    
									                </c:forEach>									
												</form:select>
												<form:errors path="machine.modelId" cssClass="control-label"/>
												<span id="model_details" class="report_header">Характеристика Модели:<c:out value=" ${currentModel.details}"/></span><br/>
								            	<span id="model_manuf_name_rus" class="report_header">Компания Произовдитель:<c:out value=" ${currentModel.manufacturer.nameRus}"/></span><br/>
								            	<span id="model_manuf_country_name_rus" class="report_header">Место Производства:<c:out value=" ${currentModel.manufacturer.country.nameRus}"/></span><br/>
								            	<span id="model_note" class="report_header">Примечание:<c:out value=" ${currentModel.note}"/></span><br/>
												
								        	</div>
							        	</spring:bind>
							        							        	
							        	<div class="form-group">
				  				            <label class="form-label">Компания*</label>
											<form:select id="stevidorSelect" path="machine.stevidorId" cssClass="form-control">
											    <form:option value="">Не выбрана (отсутствует)</form:option>
								                <c:forEach items="${machineEditCommand.stevidorMap}" var="stevidor">
								                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
								                    <c:out value="${stevidor.key}"/>:${machineEditCommand.machine.stevidorId}:
								                    <c:out value="${stevidor.value.fullName}"/>
													<c:if test="${machineEditCommand.machine.stevidorId == stevidor.key}">
														<c:set var="currentStevidor" scope="request" value="${stevidor.value}"/> 
													</c:if>								                    
								                </c:forEach>								
											</form:select>
											<span id="stevidor_port_name" class="report_header">Порт приписки:<c:out value="${currentStevidor.port.name}"/></span><br/>
											<span id="stevidor_port_country_name_rus" class="report_header">Страна:<c:out value="${currentStevidor.port.country.nameRus}"/></span><br/>
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
					</div>
			    </div>
			    <!-- End of Tab Container -->
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