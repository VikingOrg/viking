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
	    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
        <jsp:include page="common/headCoreElements.jsp" />
       
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/dropzone.css">
  
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	    <script type="text/javascript" src="<c:url value="/static/js/responsive-tabs.js"/>"></script>
	    <script type="text/javascript" src="<c:url value="/static/js/dropzone.js"/>"></script>
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
		  
		  
		<script>
		  $(document).ready(function() {
		      $( "#datepicker" ).datepicker( { dateFormat: "dd/mm/yy", firstDay: 1, dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ], 
				  monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ] });

              $('#groupSelect').change(function() {
            	  var groupId = $(this).val();
            	  if(groupId=='0'){
            		  $('#modelSelect').html("<option value='0'>Не выбрана</option>");
                  } else {
                	  refreshModelElements(groupId, 0);
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
              
              $( "#machine_edit_form" ).submit(function( event ) {
                  if (submittignForm) {
                  } else {
                	  event.preventDefault();
                  }
              });
              

		  }); // end of document.ready
		  
      	function closingModal(modelId, successMsg, groupId){
          	$('#groupSelect').val(groupId);
          	refreshModelElements(groupId, modelId);
    		$('#machineModelModal').modal('hide');
    		$('#success_alert').attr("class","alert alert-success");
    		$("#success_alert_message").html(successMsg);    		
        }
      	
		/*Getting model list from DB.*/
		function refreshModelElements(groupId, modelId){
            $.getJSON('${pageContext.request.contextPath}/machineEdit/model/' + groupId, function(machineModel) {
                var options='<option value="0">Не выбрана</option>';
                $.each(machineModel, function (i, e) {
                    options += "<option value='" + e.modelId + "'>" + e.name + "</option>";
                });
                $('#modelSelect').html(options);
                $('#modelSelect').val(modelId);
                refreshModel($('#modelSelect').val());
            });			
		}
		  
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
			
			/*file upload zone CSS*/			
			#dropzone {
			    background: #ccccc;
			    width: 150px;
			    height: 50px;
			    line-height: 50px;
			    text-align: center;
			    font-weight: bold;
			}
			#dropzone.in {
			    width: 600px;
			    height: 200px;
			    line-height: 200px;
			    font-size: larger;
			}
			#dropzone.hover {
			    background: lawngreen;
			}
			#dropzone.fade {
			    -webkit-transition: all 0.3s ease-out;
			    -moz-transition: all 0.3s ease-out;
			    -ms-transition: all 0.3s ease-out;
			    -o-transition: all 0.3s ease-out;
			    transition: all 0.3s ease-out;
			    opacity: 1;
			}			
			
		    html, body {
		      height: 100%;
		    }
		    #actions {
		      margin: 2em 0;
		    }
		
		
		    /* Mimic table appearance */
		    div.table {
		      display: table;
		    }
		    div.table .file-row {
		      display: table-row;
		    }
		    div.table .file-row > div {
		      display: table-cell;
		      vertical-align: top;
		      border-top: 1px solid #ddd;
		      padding: 8px;
		    }
		    div.table .file-row:nth-child(odd) {
		      background: #f9f9f9;
		    }
		
		
		
		    /* The total progress gets shown by event listeners */
		    #total-progress {
		      opacity: 0;
		      transition: opacity 0.3s linear;
		    }
		
		    /* Hide the progress bar when finished */
		    #previews .file-row.dz-success .progress {
		      opacity: 0;
		      transition: opacity 0.3s linear;
		    }
		
		    /* Hide the delete button initially */
		    #previews .file-row .delete {
		      display: none;
		    }
		
		    /* Hide the start and cancel buttons and show the delete button */
		
		    #previews .file-row.dz-success .start,
		    #previews .file-row.dz-success .cancel {
		      display: none;
		    }
		    #previews .file-row.dz-success .delete {
		      display: block;
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
						<div id="success_alert" class="alert alert-success hidden">
							<span id="success_alert_message"></span>
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>						
					</div>
				</div>
				<!-- Start of Tab Container -->	
				<div class="container">	
				    <ul id="machineEditTab" class="nav nav-tabs responsive" role="tablist">
				      <li class="active <c:if test="${machineEditCommand.machine.archived == '1'}">active-red</c:if>">
				      	  <a href="#main" role="tab" data-toggle="tab">
						   	  Основные характеристики 
						   	  <c:if test="${not empty machineEditCommand.machine.machineId}">
						   	  	 (Машина № <c:out value="${machineEditCommand.machine.machineId} "/>
						   	  	 <c:if test="${machineEditCommand.machine.archived == '1'}">Удалено!</c:if>)	
						   	  </c:if>
				      	  </a>
				      </li>
				      <li><a id="click_to_init" href="#tab_image" role="tab" data-toggle="tab">Изображения</a></li>
				    </ul>
				    
					<div id="myTabContent" class="tab-content responsive">
							<div class="tab-pane fade tab-bordered" id="tab_image">
							      <div class="row">
							        <div class="col-sm-9 col-sm-offset-1">
							        	<!-- Dropzone here -->
											<jsp:include page="common/dropzone.jsp" />																	    
							            <!-- End of Dropzone here -->
							        </div>							      
								  </div>	
							</div>		
							
							<div class="tab-pane fade in active tab-bordered <c:if test="${machineEditCommand.machine.archived == '1'}">tab-pane-red</c:if>" id="main">
							      <div class="row">
							        <div class="col-sm-4 col-sm-offset-1">
							        	<%-- <br/>
							            <label class="form-label">
							            	<span class="required">Описание механизма*</span>
							            	<span class="report_header">(Пример правильного описания: Старый кран, кабина разбита...
							        	Пример не правильного описания: Портальный Кран ГАНЦ 5/6тн. Стрела 30м.)</span>
							            </label>
							        	<v:input path="machine.name"  title="Описание Механизма"/> --%>
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
							                    <label class="form-label">Модель*&nbsp; </label>
							                    	<a href="#" rel="createNewModel" title="Ввод нового">
							                    	<span class="glyphicon glyphicon-plus"></span>Добавить</a>&nbsp;
								                    	<span id="edit_machine_model">
									                    	<a href="#" id="editExistingModel"
									                    	data-param1="<c:out value="${machineEditCommand.machine.modelId}"/>">
									                    	<span class="glyphicon glyphicon-edit"></span>Редактировать
									                    	</a>
									                    </span>
							                    <div class="panel panel-default" style="margin-left: -15px; margin-right: -15px">
						                    		<div class="panel-heading">
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
													</div>
													<div  class="panel-body">
														<span id="model_details" class="report_header"><b>Характеристика Модели:</b><c:out value=" ${currentModel.details}"/></span><br/>
										            	<span id="model_manuf_name_rus" class="report_header"><b>Компания Производитель:</b><c:out value=" ${currentModel.manufacturer.nameRus}"/></span><br/>
										            	<span id="model_manuf_country_name_rus" class="report_header"><b>Страна Производства:</b><c:out value=" ${currentModel.manufacturer.country.nameRus}"/></span><br/>
										            	<span id="model_note" class="report_header"><b>Примечания:</b><c:out value=" ${currentModel.note}"/></span><br/>
													</div>
												</div>
								        	</div>
							        	</spring:bind>
							        							        	
							        	<div class="form-group">
				  				            <label class="form-label">Компания*</label>
				  				            <div class="panel panel-default" style="margin-left: -15px; margin-right: -15px">
					                    		<div class="panel-heading">
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
												</div>
												<div  class="panel-body">		
													<span id="stevidor_port_name" class="report_header"><b>Порт приписки:&nbsp;</b><c:out value="${currentStevidor.port.name}"/></span><br/>
													<span id="stevidor_port_country_name_rus" class="report_header"><b>Страна:&nbsp;</b><c:out value="${currentStevidor.port.country.nameRus}"/></span><br/>
								        		</div>
							        		</div>
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
							            <v:input path="machine.location" label="Место эксплуатации (установки)" title="Укажите место установки или эксплуатации механизма"/>
							            
							            
							            * - Поля обязательные к заполнению.
							        </div>
							        <div class="col-sm-4 col-sm-offset-1">
							        	<br/>
								      	<%-- 
										<v:input path="machine.details" label="Характеристики" required="true" title="Укажите характеристики модели"/>
										--%>
							            <v:input id="inventoryNumb" path="machine.inventoryNumb" label="Инвентарный №" required="true" title="Введите инвентарный номер" maxlength="50"/>
							            <v:input path="machine.startDate" label="Дата ввода в эксплуатацию" required="true" title="Укажите дату ввода в эксплуатацию" id="datepicker"/>
										<v:input id="docNumb" path="machine.doc" label="Контракт №" required="true" title="Укажите документ ввода в эксплуатацию" maxlength="20"/>
										<v:input id="transNumb" path="machine.transNumb" label="Транс №" required="true" title="Укажите номер Транса" maxlength="15"/>
							            <v:input id="factoryNumb" path="machine.factoryNumb" label="Заводской №" required="true" title="Укажите заводской номер" maxlength="20"/>
							            <v:input id="nomNo" path="machine.nomNo" label="Номенклатурный №" required="true" title="Укажите номенклатурный номер" maxlength="50"/>
							            <v:input id="regNo" path="machine.regNo" label="Регистрационный №" required="true" title="Укажите регистрационный номер из реестра Ростехнадзора" maxlength="50"/>
				
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
			    
			    <!-- Buttons -->
			    <div class="container">
			      <div class="form-actions" style= "padding: 20px">
			          <br>
			          <div class="form-actions">
						<c:if test="${machineEditCommand.formType=='E'}">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm_edit" onclick="submitForm()" value="Сохранить Отред." />
						</c:if>	
						<c:if test="${machineEditCommand.formType != 'E'}">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm_new" onclick="submitForm()" value="Сохранить Новую." />
						</c:if>	
			            <!--  <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm_edit" onclick="submitForm()" value="Скопировать" /> -->
			            <a class="cancelbtn" type="button" onclick="window.location.href = '<c:url value="machineSearch"/>';" value="Klick">Отмена</a>			            
			            
			          </div>
			      </div>
			    </div>
			    <!-- End of Buttons -->
			    
				<!-- Mодальное окно подтверждения сохранения нового механизма -->
				<div class="modal fade" id="confirm_new" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body" align="center">
				        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ НОВОГО МЕХАНИЗМА</h4>
				      </div>
				      <div class="modal-footer">
				        <a id = "modal_new_cancel" class="cancelbtn" type="button" data-dismiss="modal">Отмена</a>
				        <a id = "modal_new_submit" class="btn btn-primary" type="button" data-dismiss="modal">Сохранить</a>
				      </div>
				      <script type="text/javascript">
		      		    $("#modal_new_cancel").click(function(e) {
		      		    	$('#confirm_new').modal('hide');
		                });
		                
		      		    $("#modal_new_submit").click(function(e) {
		      		    	$('#confirm_new').modal('hide');
			              	$('#machine_edit_form').attr('action', "${pageContext.request.contextPath}/machineEdit/persist/new");
			              	$('#machine_edit_form').attr('method', "post");
			              	$('#machine_edit_form').attr('accept-charset', "UTF-8");
			              	submittignForm = true;
			              	$('#machine_edit_form').submit();
		                });		      
				      </script>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->

				<!-- Mодальное окно подтверждения сохранения копии текущего механизма -->
				<div class="modal fade" id="confirm_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body" align="center">
				        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ МЕХАНИЗМА</h4>
				      </div>
				      <div class="modal-footer">
				        <a id = "modal_copy_cancel" class="cancelbtn" type="button" data-dismiss="modal">Отмена</a>
				        <a id = "moda_copy_submit" class="btn btn-primary" type="button" data-dismiss="modal">Сохранить</a>
				      </div>
				     
   				      <script type="text/javascript">
		      		    $("#modal_copy_cancel").click(function(e) {
		      		    	$('#confirm_edit').modal('hide');
		                });
		                
		      		    $("#moda_copy_submit").click(function(e) {
		      		    	$('#confirm_edit').modal('hide');
			              	$('#machine_edit_form').attr('action', "${pageContext.request.contextPath}/machineEdit/persist/edit");
			              	$('#machine_edit_form').attr('method', "post");
			              	$('#machine_edit_form').attr('accept-charset', "UTF-8");
			              	submittignForm = true;
			              	$('#machine_edit_form').submit();
		                });

		                
		    		    $("#machine_edit_form").validate({
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
		    		                     
		                $("#inventoryNumb").rules("add", {required:true});
		                $("#docNumb").rules("add", {required:true});
		                $("#transNumb").rules("add", {required:true});
		                $("#factoryNumb").rules("add", {required:true});
		                $("#nomNo").rules("add", {required:true});
		                $("#regNo").rules("add", {required:true});
		                				      
				      </script>
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