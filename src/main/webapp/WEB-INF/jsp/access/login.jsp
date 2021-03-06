<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
		<!-- Setting up common head elements -->
	    <meta name="description" content="Login Page. Any unauthorized access will be prostecuted to the fullest extend of the law.">
		
		<title>Регистрация в системе</title>
		
	    <meta name="viewport" content="width=device-width">
	    <link rel="shortcut icon" type="image/png" href="<c:url value="favicon.ico"/>"/>
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/real_estate.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/theme.css"/>"/><link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/dataTables.tableTools.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/core.css"/>"/>
	
	    <style type="text/css">
	      body {
	        padding-top: 40px;
	        padding-bottom: 40px;
	        background-color: #eee;
	      }
	      .form-message {
	        max-width: 530px;
	        padding: 15px;
	        margin: 0 auto;
	      }
	      .form-signin {
	        max-width: 330px;
	        padding: 15px;
	        margin: 0 auto;
	      }
	      .form-signin .form-signin-heading, .form-signin .checkbox {
	        margin-bottom: 10px;
	      }
	      .form-signin .checkbox {
	        font-weight: normal;
	      }
	      .form-signin .form-control {
	        position: relative;
	        font-size: 16px;
	        height: auto;
	        padding: 10px;
	        -webkit-box-sizing: border-box;
	        -moz-box-sizing: border-box;
	        box-sizing: border-box;
	      }
	      .form-signin .form-control:focus {
	        z-index: 2;
	      }
	      .form-signin input[type="text"] {
	        margin-bottom: -1px;
	        border-bottom-left-radius: 0;
	        border-bottom-right-radius: 0;
	      }
	      .form-signin input[type="password"] {
	        margin-bottom: 10px;
	        border-top-left-radius: 0;
	        border-top-right-radius: 0;
	      }
	    </style>        
	</head>

	<body>
		<div class="container">
			<form class="form-signin" action="j_spring_security_check" method="post">
				<h2 class="form-signin-heading text-center">ВХОД В СИСТЕМУ</h2>
				
				<input id="j_username" name="j_username" type="text" class="form-control" placeholder="E-mail" required autofocus>
				<input id="j_password" name="j_password" type="password" class="form-control" placeholder="Пароль" required>
				
				<button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
				<c:url value="register" var="registerURL"/>
				<p>&nbsp;</p>
				<p><a href="${registerURL}">Зарегистрироваться</a></p>
				<p><a href="<c:url value="passRecover"/>">Восстановить пароль</a></p>
				
			</form>
	    </div>
	    	<c:if test="${not empty message}">
	    		<div class="form-message alert alert-success">
	    			<h4><spring:message code="${message}" /></h4> 
				</div>	
			</c:if>	
			<c:if test="${not empty error}">
				<div class="form-message alert-danger show">
					<spring:message code="${error}" />
				</div>
			</c:if>				
	</body>
</html>