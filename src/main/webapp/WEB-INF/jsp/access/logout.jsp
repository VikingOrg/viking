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
		      <h3 class="page-header">Сессия завершена.</h3>
			<p>Списибо, что вы использовали нашу систему. Для разработчика:Уровень снижен до "<span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>"!</p>
					<p>Если вы хотите продолжить работу <a href="<c:url value="login" />" > ВОЙДИТЕ СНОВА</a></p>
		  </div>
		</div>

		
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>