<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Восстановление пароля</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    
	    <!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script src="static/js.response.min.js" type="text/javascript"></script>
	</head>
	<body>
			<form:form id="user_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="passRecover" commandName="registrationCommand" method="post" accept-charset="UTF-8">
			
			<!-- Begin page content -->
		    <div class="container">

			    <div class="container">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			            <h3 class="page-header">ЗАПРОС НА ВОССТАНОВЛЕНИЕ ПАРОЛЯ</h3>
			            
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>
								            
			          </div>
			        </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
						<v:input path="user.lastName" label="Фамилия" required="true" title="Введите свою фамилию"/>
						<v:input path="user.firstName" label="Имя" required="true" title="Введите своё имя"/>
						<v:input path="user.middleInitial" label="Отчество" title="Введите своё отчество"/>
						<v:input path="user.userEmail" type="email" label="E-Mail" title="Укажите свой e-mail в качестве логина"/>	
			        </div>
			        
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        <label class="form-label">Порт</label>
			          <select class="form-control" name="port">
			            <option>Санкт-Петербург</option>
			            <option>Высоцк</option>
			            <option>Приморский</option>
			          </select>
			          <p>&nbsp;</p> 
			        <label class="form-label">Компания</label>
			          <select class="form-control" name="company">
			            <option>1-я Стивидорная</option>
			            <option>2-я Стивидорная</option>
			            <option>3-я Стивидорная</option>
			          </select>
			          <p>&nbsp;</p>
			        </div>
			      </div>
			    
			      </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1">
			          <div class="form-actions">
			          	<button type="submit" class="btn btn-primary">Отправить</button>
			            <a type="button" class="cancelbtn" 
			            	onclick="window.location.href = '<c:url value="login"/>';" 
			            	value="Klick">Отменить
			            </a>
			          </div>
			        </div>
			      </div>
			    </div>
	
			</div> <!-- End of Main Container -->
		</form:form>	
	</body>
</html>