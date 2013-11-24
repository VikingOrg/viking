<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Оборудование</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
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
		      <h1>Оборудование</h1>
		    </div>
			<p>Welcome <span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>!</p>
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
					
		  </div>
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>

