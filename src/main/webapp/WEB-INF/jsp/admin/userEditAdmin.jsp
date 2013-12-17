<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Редактирование данных пользователя</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>	
	</head>

	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<jsp:include page="../common/menu.jsp" />
			<!-- Begin page content -->
	  		<div class="container">
	  		<form:form id="registration" action="userEditAdmin" commandName="registrationCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
			      <div class="masthead">
			        <div class="container">
			        <div class="row">
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${registrationCommand.formType=='E'}">
					      	<h4 class="text-muted page-header">РЕДАКТИРОВАНИЕ ДАННЫХ ПОЛЬЗОВАТЕЛЯ<br></h4>
					      </c:when>
					      <c:when test="${registrationCommand.formType=='C'}">
					      	<h4 class="text-muted page-header">КОПИРОВАНИЕ ДАННЫХ ПОЛЬЗОВАТЕЛЯ<br></h4>
					      </c:when>					      
					      <c:otherwise>
							<h4 class="text-muted page-header">ДОБАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯ<br></h4>
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
			      </div>
			      <div class="row">
			        <div class="col-sm-4 col-sm-offset-1">
			        	<div class="form-group">
			            	<label class="form-label">РОЛЬ В СИСТЕМЕ</label>
							<form:select path="userRole" cssClass="form-control">
							   <form:option value="3" label="НЕ ЗАРЕГИСТРИРОВАН"/>
							   <form:option value="2" label="ПОЛЬЗОВАТЕЛЬ"/>
							   <form:option value="1" label="АДМИНИСТРАТОР"/>
							</form:select>			            	
			          	</div>
				     
				     <v:input path="user.lastName" label="ФАМИЛИЯ" required="true" title="Введите свою фамилию"/>
				     <v:input path="user.firstName" label="ИМЯ" required="true" title="Введите своё имя"/>
					 <v:input path="user.middleInitial" label="ОТЧЕСТВО" title="Введите своё отчество"/>

			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">E-MAIL</label>
			            	<form:input path="user.userEmail" type="email" cssClass="form-control" title="Укажите свой e-mail в качестве логина"/>
			            	<form:errors class="control-label" path="user.userEmail"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			                <label class="form-label">ПАРОЛЬ</label>
			                <form:input path="user.password" type="password" cssClass="form-control" title="Укажите пароль для входа"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ПОВТОРИТЕ ПАРОЛЬ</label>
			            	<form:input path="pswordCheck" type="password" cssClass="form-control" title="Повторно укажите пароль"/>
			            </div>
			          </div>
			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
			        	<label class="form-label">СТРАНА</label>
						<form:select path="user.countryId" cssClass="form-control"> 
			                <c:forEach items="${registrationCommand.userCountry}" var="country">
			                    <form:option value="${country.key}" label="${country.value.nameRus}" />
			                </c:forEach>
						</form:select>
			          	<p>&nbsp;</p>
				          <label class="form-label">ПОРТ</label>
							<form:select path="user.portId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userPort}" var="port">
				                    <form:option value="${port.key}" label="${port.value.name}" />
				                </c:forEach>							
							</form:select>		          
				          <p>&nbsp;</p>
				          <label class="form-label">КОМПАНИЯ</label>
							<form:select path="user.stevidorId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userStevidor}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
				                </c:forEach>								
							</form:select>
				          <p>&nbsp;</p>

			           <div class="form-group">
			            <div class="controls">
			              <label class="form-label">ПОДРАЗДЕЛЕНИЕ</label>
	 		              <form:input path="user.division" type="text" cssClass="form-control" title="Подразделение"/>
			            </div>
			          	</div>
			          <div class="form-group">
			            <label class="form-label">ДОЛЖНОСТЬ</label>
			            <div class="controls">
			                <form:input path="user.occupation" cssClass="form-control" title="Должность"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <label class="form-label">ПРИМЕЧАНИЯ</label>
			            <div class="controls">
			            	<form:textarea path="user.userNote" rows="3" cssClass="form-control"/>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
				
		    <div class="container">
		      <div class="row">
		        <div class="col-sm-10 col-sm-offset-1">
		          <div class="form-actions">
		            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">СОХРАНИТЬ &raquo;</button>
		            <button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="userSearchAdmin"/>';" 
		            	value="Klick">ВЕРНУТЬСЯ &raquo;</button>
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
		        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
		        <button type="submit" class="btn btn-primary">СОХРАНИТЬ</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
			</form:form>    
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer navbar-fixed-bottom">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
		

	</body>
</html>

