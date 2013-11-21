<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Доступ Запрещён</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="../common/menu.jsp" />
		  
		  <!-- Begin page content -->
		  <div class="container">
		    <div class="page-header">
		      <h1>Доступ Ограничен</h1>
		    </div>
			<p><span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>!</p>
				  <p>У Вас нет допуска к этому ресурсу.</p>
					
		  </div>
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>