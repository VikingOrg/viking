<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Компании-Оператора</title>
	    <jsp:include page="common/headCoreElements.jsp" />
	    <script>
	    $('#stevidorEditTab a').click(function (e) {
	    	  e.preventDefault(),
	    	  $(this).tab('show');
	    	});

	    </script>
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
			          <div class="col-sm-10 col-sm-offset-1">
			          
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
					  <div class="col-sm-10 col-sm-offset-1">
					    <ul id="stevidorEditTab" class="nav nav-tabs" role="tablist">
					      <li class="active"><a href="#main" role="tab" data-toggle="tab">Главное</a></li>
					      <li><a href="#address" role="tab" data-toggle="tab">Адрес</a></li>
					      <li><a href="#contacts" role="tab" data-toggle="tab">Контакты</a></li>
					    </ul>
					    <div id="myTabContent" class="tab-content">
					      <div class="tab-pane fade in active" id="main">
					        <div class="row">
						        <div class="col-sm-4 col-sm-offset-1">
									<spring:bind path="stevidor.name">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Наименование</label>
								            <form:input path="stevidor.name" cssClass="form-control" title="Введите наименование"/>
								            <form:errors class="control-label" path="stevidor.name"/>
							            </div>
							        </div>
							     </spring:bind>
							     
						         <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Полное наименование</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите полное наименование"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>				     			        
			
						        </div>
						        <div class="col-sm-4 col-sm-offset-1">
									<label class="form-label">Порт</label>
									<form:select path="stevidor.portId" cssClass="form-control">
									      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
									          <form:option value="${port.key}" label="${port.value.name}" />
									      </c:forEach>							
									</form:select>		          
									<p>&nbsp;</p>
						           
						            <div class="form-group">
							            <label class="form-label">Примечания</label>
							            <div class="controls">
							            	<form:textarea path="stevidor.stevidorNote" rows="3" cssClass="form-control"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
			      		  </div>
					      <div class="tab-pane fade" id="address">
					        <div class="row">
						        <div class="col-sm-4 col-sm-offset-1">
									<spring:bind path="stevidor.name">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Индекс</label>
								            <form:input path="stevidor.name" cssClass="form-control" title="Введите индекс"/>
								            <form:errors class="control-label" path="stevidor.name"/>
							            </div>
							        </div>
							     </spring:bind>
							     
						         <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Регион</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите регион"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>				     			        
			
						        </div>
						        <div class="col-sm-4 col-sm-offset-1">
						        	<div class="form-group ${status.error ? 'has-error' : ''}">
										<label class="form-label">Область</label>
										<form:select path="stevidor.portId" cssClass="form-control">
										      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
										          <form:option value="${port.key}" label="${port.value.name}" />
										      </c:forEach>							
										</form:select>	
									</div>
									<div class="form-group">
							            <label class="form-label">Город</label>
										<form:select path="stevidor.portId" cssClass="form-control">
										      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
										          <form:option value="${port.key}" label="${port.value.name}" />
										      </c:forEach>							
										</form:select>
									</div>
						            <div class="form-group">
							            <label class="form-label">Улица</label>
							            <div class="controls">
							            	<form:textarea path="stevidor.stevidorNote" rows="2" cssClass="form-control"/>
							            </div>
						            </div>
						            
						        </div>
						      </div>
						     </div>
					      <div class="tab-pane fade" id="contacts">
					      	<div class="row">
					        	 <div class="col-sm-4 col-sm-offset-1">
									<label class="form-label">Контакт</label>
									<form:select path="stevidor.portId" cssClass="form-control">
									      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
									          <form:option value="${port.key}" label="${port.value.name}" />
									      </c:forEach>							
									</form:select>		          
									<p>&nbsp;</p>
							</div>	
					        <div class="row">
						           
						        </div>
						        <div class="col-sm-4 col-sm-offset-1">
									<spring:bind path="stevidor.name">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Фамилия</label>
								            <form:input path="stevidor.name" cssClass="form-control" title="Введите Фамилию"/>
								            <form:errors class="control-label" path="stevidor.name"/>
							            </div>
							        </div>
							     </spring:bind>
							     
						         <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Имя</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите Имя"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		
							     
							     <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Отчество</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите Отчество"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		
							     
							     <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Подразделение</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите подразделение"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		     		
							     
							     <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Должность</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите должность"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		        
			
						        </div>
						        <div class="col-sm-4 col-sm-offset-1">
						        	<spring:bind path="stevidor.name">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Телефон</label>
								            <form:input path="stevidor.name" cssClass="form-control" title="Введите телефон"/>
								            <form:errors class="control-label" path="stevidor.name"/>
							            </div>
							        </div>
							     </spring:bind>
							     
						         <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">Факс</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите факс"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		
							     
							     <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">E-mail</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите E-mail"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>		
							     
							     <spring:bind path="stevidor.fullName">
							        <div class="form-group ${status.error ? 'has-error' : ''}">
							        	<div class="controls">
								            <label class="form-label">WWW</label>
								            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите WWW"/>
								            <form:errors class="control-label" path="stevidor.fullName"/>
							            </div>
							        </div>
							     </spring:bind>	
						            
						        </div>
						      </div>
						    </div>
					    </div>
					  </div>
					  <!-- Tabs End -->
			        <div class="col-sm-10 col-sm-offset-1">
			          <div class="form-actions" style= "padding-left: 20px">
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
	</body>
</html>