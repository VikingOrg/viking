<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Выход из системы</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		  <!-- Begin page content -->
		  <div class="container">
			  <div class="panel  panel-success" style="margin-top: 50px;">
			      <div class="panel-heading" style="background-color:#DDEDCC;">
					    <h3 class="page-header">Сессия завершена.</h3>
			      </div>
				  <div class="panel-body">
				    <p><br>Списибо, что вы использовали нашу систему.<br> Для разработчика:Уровень снижен до "<span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>"!<br></p>
					
				  </div>
				  <div class="panel-footer"><p>Для продолжения работы<a href="<c:url value="login" />" > ВОЙДИТЕ СНОВА</a></p></div>
			  </div>
		      
			
		  </div>
		</div>

		
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>