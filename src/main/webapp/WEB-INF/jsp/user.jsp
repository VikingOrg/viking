<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width">
	    <title>Механизмы (устройства)</title>
	    
	    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="resources/css/menu_tweeks.css" rel="stylesheet" type="text/css" />
	    
		<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
		    
		<script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<jsp:include page="common/menu.jsp" />
			
			<h1 id="banner">Механизмы(Перечень)</h1>
			<hr/>
			
			<p>All users can see this page</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et velit et sem 
			fermentum viverra. Duis fringilla consequat lectus, et rhoncus mauris porta ut. Cum 
			sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
			Donec commodo lorem sed felis iaculis pretium. Cras vel scelerisque ipsum. 
			Donec a lacus lectus, ac dignissim dui. Duis vel dui et lacus dapibus lacinia. Mauris 
			lacus metus, semper in varius vitae, ornare at augue. Nam enim elit, iaculis iaculis 
			viverra at, blandit quis turpis. Nulla turpis quam, suscipit sed pellentesque sit amet, 
			fermentum nec mauris. In non urna ornare sem cursus luctus. Pellentesque sed leo 
			elit. Duis ut felis dui, et mollis nibh. Suspendisse faucibus molestie feugiat. Pellentesque 
			non velit blandit ipsum auctor tempor placerat a eros. Quisque nec porttitor velit.</p>
			
			<jsp:include page="common/footer.jsp" />
		</div>
	</body>
</html>