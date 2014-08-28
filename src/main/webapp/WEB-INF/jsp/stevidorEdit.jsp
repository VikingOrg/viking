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
	    <script type="text/javascript" src="<c:url value="/static/js/responsive-tabs.js"/>"></script>
	    
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
					    <ul id="stevidorEditTab" class="nav nav-tabs responsive" role="tablist">
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
							            <v:input id = "stevidorName" path="stevidor.name" label="Наименование" required="true" title="Введите наименование"/>
								     	<v:input id = "stevidorFullName" path="stevidor.fullName" label="Полное наименование" required="true" title="Введите полное наименование"/>
										<v:input id = "stevidorNameEng" path="stevidor.nameEng" label="Name (In English)" required="true" title="Inter name in English"/>							        
							        </div>
							        
							        <div class="col-sm-4 col-sm-offset-1">
							        	<div class="form-group">
											<label class="form-label">Порт</label>
											<form:select path="stevidor.portId" cssClass="form-control">
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
							      <div class="panel-heading">Почтовые (физические) адреса</div>
							      <div class="panel-body">
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorPostCode" path="stevidor.postCode" label="Индекс" title="Введите индекс"/>
								        <v:input id = "stevidorArea" path="stevidor.area" label="Область" title="Введите область"/>
								        <v:input id = "stevidorStreet" path="stevidor.street" label="Улица" title="Введите улицу"/>
							        </div>
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorRegion" path="stevidor.region" label="Регион" title="Введите регион"/>
								        <v:input id = "stevidorCity" path="stevidor.city" label="Город" title="Введите Город"/>
								        <v:input id = "stevidorBuilding" path="stevidor.building" label="Дом" title="Введите Дом"/>
							        </div>
							      </div>
						      </div>
						      
						      <!-- Third paragraph --><!-- Third paragraph --><!-- Third paragraph -->
							  <div class="panel panel-default" style="margin-left:10px; margin-right:10px;">
							      <div class="panel-heading">Электронные адреса</div>
							      <div class="panel-body">
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorPhone" path="stevidor.phone" label="Телефон" title="Введите Телефон"/>
								        <v:input id = "stevidorFax" path="stevidor.fax" label="Факс" title="Введите Факс"/>
							        </div>
							        
							        <div class="col-sm-4 col-sm-offset-1">
								        <v:input id = "stevidorEmail" path="stevidor.email" label="E-mail" title="Введите E-mail"/>
								        <v:input id = "stevidorUrl" path="stevidor.url" label="WWW" title="Введите WWW"/>
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
							            	<form:textarea id="stevidorActivityPlace" path="stevidor.activityPlace" rows="3" cssClass="form-control"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						      <div class="row">
						        <div class="col-sm-9 col-sm-offset-1">
						        	<div class="form-group">
							            <label class="form-label">Количество причалов</label>
							            <div class="controls">
							            	<form:textarea id="stevidorMoorageCount" path="stevidor.moorageCount" rows="3" cssClass="form-control"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						      <div class="row">
						        <div class="col-sm-9 col-sm-offset-1">
						        	<div class="form-group">
							            <label class="form-label">Специализация</label>
							            <div class="controls">
							            	<form:textarea id="stevidorSpecialization" path="stevidor.specialization" rows="3" cssClass="form-control"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						     </div>
					      <div class="tab-pane fade tab-bordered" id="contacts">
					      	<div class="row">
					      		<div class="col-sm-9 col-sm-offset-1">
					      		<table class="table table-contacts table-responsive">
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
												<th>
													<form:input path="stevidor.contacts[${loop.index}].jobTitle" cssClass="form-control" title=""/>
												</th>
												<th>
													<form:input path="stevidor.contacts[${loop.index}].fns" cssClass="form-control" title="Введите "/>
												</th>
												<th>
													<form:input path="stevidor.contacts[${loop.index}].phone" cssClass="form-control" title="Введите "/>
												</th>
												<th>
													<form:input path="stevidor.contacts[${loop.index}].mobPhone" cssClass="form-control" title="Введите "/>
												</th>
												<th>
													<form:input path="stevidor.contacts[${loop.index}].fax" cssClass="form-control" title="Введите "/>
												</th>
												<th>
													<form:input path="stevidor.contacts[${loop.index}].email" cssClass="form-control" title="Введите "/>
												</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</div>
					        	 </div>
						    </div>
					    </div>
					  </div>
					  <!-- Tabs End -->
			        <div class="container">
			          <div class="form-actions" style= "padding: 20px">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
							
						<input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()" value="Скопировать" />
							
		           		<a type="button" class="cancelbtn" onclick="window.location.href = '<c:url value="stevidorSearch"/>';" 
		            	value="Klick">Отмена</a>
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
				        <a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
				        <button type="submit" class="btn btn-primary">Сохранить</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
		
			</form:form>    			
			</div> <!-- End of Main Container -->	
	</div> <!-- Closing div tag for wrap -->
		<jsp:include page="common/footer.jsp" />
		<script>
	    $('#stevidorEditTab a').click(function (e) {
	    	  e.preventDefault(),
	    	  $(this).tab('show');
	    	});
	    (function($) {
	          fakewaffle.responsiveTabs(['xs', 'sm']);
	      })(jQuery);

	    </script>
	</body>
</html>