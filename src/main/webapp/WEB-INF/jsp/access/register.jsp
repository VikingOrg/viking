<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html lang="ru">
	<head>
	    <title>Регистрационная форма</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta name="viewport" content="width=device-width">
	    <meta name="author" content="Viking Inc.">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>

		
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
   		  <!-- Begin page content -->
		  <div class="container">
		  
		  <form:form id="registration" action="register" commandName="registrationCommand" method="post" accept-charset="UTF-8">
		    <div class="container">
		      <div class="masthead">
		        <div class="container">
		          <div class="col-md-10 col-md-offset-1">
		            <h4 class="text-muted page-header">ЗАПОЛНИТЕ ПОЛЯ ФОРМЫ РЕГИСТРАЦИИ</h4>
		            
					<c:if test="${not empty error}"> 
						<div class="alert alert-danger show"><spring:message code="${error}" />
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>			
					</c:if>	
					            
		          </div>
		        </div>
		      </div>
		      <div class="row">
		        
		      
		        <div class="col-md-4 col-md-offset-1 col-xs-6">
		          <div class="form-group">
		            <div class="controls">
		            	<label class="form-label">ФАМИЛИЯ</label>
		            	<form:input path="user.lastName" cssClass="form-control" title="Введите свою фамилию"/>
		            	<form:errors class="invalid" path="user.lastName"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ИМЯ</label>
		                <form:input path="user.firstName" cssClass="form-control" title="Введите своё имя"/>
		                <form:errors class="invalid" path="user.firstName"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ОТЧЕСТВО</label>
		            	<form:input path="user.middleInitial" cssClass="form-control" title="Введите своё отчество"/>
		            	<form:errors class="invalid" path="user.middleInitial"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		            <label class="form-label">E-MAIL</label>
		              <form:input path="user.userEmail" type="email" cssClass="form-control"title="Укажите свой e-mail в качестве логина"/>
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
		          <div class="checkbox">
		            <label>
		              <input type="checkbox" value="true">Я СОГЛАСЕН С УСЛОВИЯМИ ПОЛЬЗОВАНИЯ *</label>
		          </div>
		        </div>
		        <div class="col-md-4 col-md-offset-1 col-xs-6">
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
			                    <form:option value="${stevidor.key}" label="${stevidor.value.name}" />
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
		            <div class="controls">
		                <label class="form-label">ДОЛЖНОСТЬ</label>
		              <form:input path="user.occupation" type="text" cssClass="form-control" title="Должность"/>
		            </div>
		          </div>		          
		          
		        </div>
		      </div>
		      
		    </div>

		    <div class="container">
		      <div class="row">
		        <div class="col-md-4 col-md-offset-1">
		          <div class="form-actions">
		          <button type="submit" class="btn btn-primary">ОТПРАВИТЬ &raquo;</button>
		            <button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="login"/>';" 
		            	value="Klick">ОТМЕНИТЬ &raquo;</button>
		          </div>
		          	<div class="row text-left">
		            	<p>&nbsp;</p>
		            	<a href="#">* УСЛОВИЯ ПОЛЬЗОВАНИЯ</a>
		            </div>
		        </div>
		      </div>
		    </div>
		  </form:form>
		  </div>
	  	</div><!-- End of wrapper-->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>