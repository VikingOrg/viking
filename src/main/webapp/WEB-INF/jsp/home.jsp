<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Главная страница</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="common/menu.jsp" />
		  
		  <!-- Begin page content -->
		  <div class="container">
		    <div class="page-header">
		      <h1>Главная</h1>
		    </div>
		    <div class="alert alert-success show">
		    
		    	  <h3><spring:message code="label.menu.main"/>&nbsp;
		    	  	  <spring:message code="label.menu.ports"/>&nbsp;
		    	  	  <spring:message code="label.menu.mech"/>&nbsp;
		    	  	  <spring:message code="label.menu.reports"/>&nbsp;
		    	  	  <spring:message code="label.menu.admin"/>&nbsp;
		    	  </h3>
		    
		    		<p><h4>Приветствуем вас, <span id="username">${userModel.firstName}&nbsp;${userModel.lastName}</span>!</p></h4>
		    		<p>Перед началом работы пожалуйста ознакомьтесь с Правилами пользования Системой.</p>
					<p>&nbsp;</p>
					<p>Непременным условием является трезвость ума и ясность рассудка на всем протяжении сессии!</p>
					<p>&nbsp;</p>
					<p>При замеченных признаках явного "Торможения" системы и задержке отклика на действия рекомендуем "перезагрузку" мозга или кратковременный переход в режим STANDBY!</p>
			</div>
					
		  </div>
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>