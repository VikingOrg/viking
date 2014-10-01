<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Главная страница</title>
		<jsp:include page="common/headCoreElements.jsp" />
	    
	</head>
	<body>
		
		<!-- Wrap all page content here -->  
	<div id="wrap">		
		<jsp:include page="common/menu.jsp" />

		  <!-- Begin page content -->		 
		  <div class="container">
		      <h1  class="page-header">Главная</h1>
                  <!--  Вывод сообщений и предупреждений  -->
				<c:if test="${not empty message}"> 
					<div class="alert alert-success show"><spring:message code="${message}" />
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>			
				</c:if>
				<c:if test="${not empty error}"> 
					<div class="alert alert-danger show"><spring:message code="${error}" />
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>			
				</c:if>			  
				<div class="alert alert-danger show">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<p><h2>Внимание!</h2></p>
					<p>Вы работаете с <b>beta</b> версией продукта (beta 1.0.0). </p>
    				Данная версия является <b>закрытой</b> "бетой" для ограниченного круга пользователей.</br>
    				Вы можете ознакомится со стадиями разработки программного обеспечения - <a href="http://ru.wikipedia.org/wiki/%D0%A1%D1%82%D0%B0%D0%B4%D0%B8%D0%B8_%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B8_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%BD%D0%BE%D0%B3%D0%BE_%D0%BE%D0%B1%D0%B5%D1%81%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F"><b>здесь</b></a>.</br>
    				Во время "бета" тестирования идет активная "доводка" функционала для подготовки продукта к <b><a href="https://ru.wikipedia.org/wiki/%D0%A0%D0%B5%D0%BB%D0%B8%D0%B7_%28%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%BD%D0%BE%D0%B5_%D0%BE%D0%B1%D0%B5%D1%81%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%29">релизу</a></b>.</br>
    				До стадии релиза, база данных является тестовой и используется <b>исключительно</b> для целей отладки и тестирования.</br>
    				Все временные пользователи (тестировщики) и ассоциированные с ними данные перед релизом будут <b>удалены</b>!
    				    
    				<p></p>
				</div>							    
		    	<div class="alert alert-success show">
		    		<p><h4>Приветствуем вас, <span id="username">${userModel.firstName}&nbsp;</span>!</h4></p>
		    		<p>Перед началом работы пожалуйста ознакомьтесь с Правилами пользования Системой.</p>
					<p>&nbsp;</p>
				</div> 
		  </div>	
	</div> <!-- Closing div tag for wrap -->
	
		   <jsp:include page="common/footer.jsp" />	
	</body>
</html>