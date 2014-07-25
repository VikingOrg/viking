<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Главная страница</title>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/real_estate.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/theme.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/core.css"/>"/>
	    
	    <!--[if lt IE 9]>
			<script type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="<c:url value="/static/css/js.response.min.js"/>"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="<c:url value="/static/css/dataTables.bootstrapPagination.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/css/ajax-form.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/css/dataTables.tableTools.js"/>"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">		
		<jsp:include page="common/menu.jsp" />

		  <!-- Begin page content -->
		 
		  <div class="container">
		      <h1  class="page-header">Главная</h1>
		    <div class="alert alert-success show">
		    		<p><h4>Приветствуем вас, <span id="username">${userModel.firstName}&nbsp;</span>!</h4></p>
		    		<p>Перед началом работы пожалуйста ознакомьтесь с Правилами пользования Системой.</p>
					<p>&nbsp;</p>
					<!-- 
					<p><h4>Турбо!</h4></p>
		    		<div class="video-container">
						<iframe width="560" height="315" src="//www.youtube.com/embed/aTSdOt62Mpg" frameborder="0" allowfullscreen></iframe>						
					</div>
					-->

			</div>
		  </div>	
	</div> <!-- Closing div tag for wrap -->
	
		   <jsp:include page="common/footer.jsp" />	
	</body>
</html>