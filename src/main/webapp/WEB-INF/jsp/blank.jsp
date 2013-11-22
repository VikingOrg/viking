<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Титул</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/core.css"/>
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
		      <h1>Титул Страницы</h1>
		    </div>
			<p>Welcome <span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>!</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>
					<p>Все заменить на нужное и не нужно здесь..</p>					
		  </div>
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>