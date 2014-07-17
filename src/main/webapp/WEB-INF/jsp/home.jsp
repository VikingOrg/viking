<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Главная страница</title>
		
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