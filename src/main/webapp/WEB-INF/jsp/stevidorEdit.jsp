<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Компании-Оператора</title>
	    <jsp:include page="common/headCoreElements.jsp" />
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
	    <script type="text/javascript" src="<c:url value="/static/js/responsive-tabs.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/jquery.maskedinput.min.js"/>"></script>
	    
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	       
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container">
			<form:form id="registration" action="stevidorEdit" commandName="stevidorEditCommand" method="post" accept-charset="UTF-8">
			    <!-- 			    Контейнер заголовка блока контента -->
			        <div class="container">
			          <div class="col-sm-12">
			          
			      		<c:choose>
					      <c:when test="${stevidorEditCommand.formType=='E'}">
					      	<h3 class="page-header">Редактирование Компании-Оператора<br></h3>
					      </c:when>
					      <c:when test="${stevidorEditCommand.formType=='C'}">
					      	<h3 class="page-header">Копирование Компании-Оператора<br></h3>
					      </c:when>					      
					      <c:otherwise>
							<h3 class="page-header">Добавление Компании-Оператора<br></h3>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>

			          </div>
			        </div>
			        	<!-- Tabs -->
					  <div class="container">
					    <!-- <ul id="stevidorEditTab" class="nav nav-tabs responsive" role="tablist"> -->
					    <ul id="stevidorEditTab" class="nav nav-tabs" role="tablist">
					      <li class="active"><a href="#main" role="tab" data-toggle="tab">Основные данные (N:${stevidorEditCommand.stevidor.stevidorId})</a></li>
					      <li><a href="#address" role="tab" data-toggle="tab">Дополнительные сведения</a></li>
					      <li><a href="#contacts" role="tab" data-toggle="tab">Контакты</a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content responsive">
					      <div class="tab-pane fade in active tab-bordered" id="main">
					      	  <br/>
					      	  <!-- First paragraph --><!-- First paragraph --><!-- First paragraph -->
						      <div class="panel panel-default" style="margin-left:10px; margin-right:10px;">
							      <div class="panel-heading">Общие данные</div>
							      <div class="panel-body">
							        <div class="col-sm-4 col-sm-offset-1">
							            <v:input id = "stevidorName" path="stevidor.name" label="Наименование" required="true" title="Введите наименование Компании-оператора" maxlength="45"/>
								     	<v:input id = "stevidorFullName" path="stevidor.fullName" label="Полное наименование" required="true" title="Введите полное наименование" maxlength="100"/>
										<v:input id = "stevidorNameEng" path="stevidor.nameEng" label="Наименование (на англ.)" required="false" title="Введите наименование на английском" maxlength="45"/>							        
							        </div>
							        
							        <div class="col-sm-4 col-sm-offset-1">
							        	<div class="form-group">
											<label class="form-label">Порт*</label>
											<form:select id="portSelect" path="stevidor.portId" cssClass="form-control" title="Выберите Порт местонахождения">
									    		 <%--  <form:option value="">Не установлен</form:option> --%>
											      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
											          <form:option value="${port.key}" label="${port.value.name}" />
											      </c:forEach>							
											</form:select>		          
							            </div>
							            <div class="form-group">
								            <label class="form-label">Примечания</label>
								            <div class="controls">
								            	<form:textarea path="stevidor.stevidorNote" rows="3" cssClass="form-control"/>
								            </div>
							            </div>							        
							        </div>							        
							      </div>
							  </div>
							  
							  <!-- Second paragraph --> <!-- Second paragraph --><!-- Second paragraph -->
							  <div class="panel panel-default" style="margin-left:10px; margin-right:10px;">
							      <div class="panel-heading">Почтовый адрес</div>
							      <div class="panel-body">
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorPostCode" path="stevidor.postCode" label="Индекс" title="Введите индекс" maxlength="6"/>
								        <v:input id = "stevidorArea" path="stevidor.area" label="Область" title="Введите область" maxlength="50"/>
								        <v:input id = "stevidorStreet" path="stevidor.street" label="Улица" title="Введите улицу" maxlength="50"/>
							        </div>
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorRegion" path="stevidor.region" label="Регион" title="Введите регион" maxlength="50"/>
								        <v:input id = "stevidorCity" path="stevidor.city" label="Город" title="Введите Город" maxlength="50"/>
								        <v:input id = "stevidorBuilding" path="stevidor.building" label="Дом" title="Введите Дом" maxlength="50"/>
							        </div>
							      </div>
						      </div>
						      
						      <!-- Third paragraph --><!-- Third paragraph --><!-- Third paragraph -->
							  <div class="panel panel-default" style="margin-left:10px; margin-right:10px;">
							      <div class="panel-heading">Связь</div>
							      <div class="panel-body">
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorPhone" path="stevidor.phone" label="Телефон" title="Введите Телефон"/>
								        <v:input id = "stevidorFax" path="stevidor.fax" label="Факс" title="Введите Факс"/>
							        </div>
							        
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorEmail" type="email" path="stevidor.email" label="E-mail" title="Введите E-mail Компании" placeholder="abcde@mail.ru"/>
								        <v:input id = "stevidorUrl" path="stevidor.url" label="WWW" title="Введите адрес сайта Компании" placeholder="www.abcde.ru"/>
							        </div>							        
							      </div>
							  </div>  
			      		  </div>
					      <div class="tab-pane fade tab-bordered" id="address">
					        <div class="row">
					            <br/>
						        <div class="col-sm-9 col-sm-offset-1">
						        	<div class="form-group">
							            <label class="form-label">Место производственной деятельности</label>
							            <div class="controls">
							            	<form:textarea id="stevidorActivityPlace" path="stevidor.activityPlace" rows="3" cssClass="form-control" maxlength="250"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						      <div class="row">
						        <div class="col-sm-9 col-sm-offset-1">
						        	<div class="form-group">
							            <label class="form-label">Количество причалов</label>
							            <div class="controls">
							            	<form:textarea id="stevidorMoorageCount" path="stevidor.moorageCount" rows="3" cssClass="form-control" maxlength="100"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						      <div class="row">
						        <div class="col-sm-9 col-sm-offset-1">
						        	<div class="form-group">
							            <label class="form-label">Специализация</label>
							            <div class="controls">
							            	<form:textarea id="stevidorSpecialization" path="stevidor.specialization" rows="3" cssClass="form-control" maxlength="250"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						     </div>
					      <div class="tab-pane fade tab-bordered" id="contacts">
					      	<div class="row" style="margin: 0 20px 20px 20px; overflow: auto">
					      		<div class="col-sm-12">
						      		<table class="table-contacts">
										<thead>
											<tr>
												<th>Должность</th>
												<th class="nowrap">Фамилия, Имя, Отчество</th>
												<th>Телефон</th>
												<th>Моб. телефон</th>
												<th>Факс</th>
												<th>Эл.почта</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="contact" varStatus="loop" items="${stevidorEditCommand.stevidor.contacts}" >
												<tr>
													<td>
														<form:select path="stevidor.contacts[${loop.index}].npp">
															<form:option value="0" label="Не выбрана"/>
															<form:options items="${stevidorEditCommand.positionList}" itemValue="positionId" itemLabel="name"/>
														</form:select>
	
													</td>
													<td>
														<form:input path="stevidor.contacts[${loop.index}].fns" cssClass="fns-contacts-form-control" title="Введите "/>
													</td>
													<td>
														<form:input id="contactPhone" path="stevidor.contacts[${loop.index}].phone" cssClass="contacts-form-control" title="Введите "/>
													</td>
													<td>
														<form:input path="stevidor.contacts[${loop.index}].mobPhone" cssClass="contacts-form-control" title="Введите "/>
													</td>
													<td>
														<form:input path="stevidor.contacts[${loop.index}].fax" cssClass="contacts-form-control" title="Введите "/>
													</td>
													<td>
														<form:input path="stevidor.contacts[${loop.index}].email" cssClass="contacts-form-control" title="Введите "/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 
									<div class="form-group">
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Добавить Контакт</button>
										<br/>
									</div>
									 -->
								</div>
					        	 </div>
						    </div>
					    </div>
					  </div>
					  <!-- Tabs End -->
			        <div class="container">
			             <div class="row">
					        <div class="col-md-4 col-md-offset-1">
					          <br>
					          <h4>* Поля, обязательные к заполнению</h4>
					        </div>
		        			<div class="col-md-4 col-md-offset-1">
					          <div class="form-actions" style= "padding: 20px">
					            <%--
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Копировать</button>
						         --%>
					            <button id="submitUpdate" type="button" class="btn btn-primary">Сохранить</button>
				           		<a type="button" class="cancelbtn" onclick="window.location.href = '<c:url value="stevidorSearch"/>';" >Отмена</a>
					          </div>
					        </div>
		        		  </div>
					  </div>
					  <jsp:include page="common/confirmModal.jsp" />	
			</form:form>    			
		 </div> <!-- End of Main Container -->	
	</div> <!-- Closing div tag for wrap -->
	
	<jsp:include page="common/footer.jsp" />
	
	<script>
        $("#submitUpdate").click(function(e) {
     	   e.preventDefault();
     	   if ($("#registration").valid()) {
     		  $("#confirmSave").modal('show');
           }
        });
		
	    $('#stevidorEditTab a').click(function (e) {
	    	  e.preventDefault(),
	    	  $(this).tab('show');
	    	});
	    (function($) {
	          fakewaffle.responsiveTabs(['xs', 'sm']);
	      })(jQuery);


        jQuery(function($){
      	   $("#stevidorPhone").mask("+7(999) 999-9999");
      	   $("#stevidorFax").mask("+7(999) 999-9999");
      	   $("#contactPhone").mask("+7(999) 999-9999");
      	});	
	       
	    $("#registration").validate({
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

	    $("#stevidorName").rules("add", {required:true});                 
        $("#stevidorFullName").rules("add", {required:true});             
        $("#portSelect").rules("add", {required:true});

	    </script>
	</body>
</html>