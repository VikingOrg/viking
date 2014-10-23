<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Запрос на создание новой записи из </title>
		<jsp:include page="common/headCoreElements.jsp" />
	    
	</head>
	<body>
		
	<!-- Wrap all page content here -->  
	<div id="wrap">		
		<jsp:include page="common/menu.jsp" />
		<form:form action="support"	commandName="libraryRequestCommand" method="post" accept-charset="UTF-8">

		  <!-- Begin page content -->		 
		  <div class="container">
		      <h1  class="page-header">Запрос к Администратору</h1>
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
						    
		    	<div class="alert alert-success show">
		    		<p><h4>Приветствуем вас, <span id="username">${userModel.firstName}&nbsp;</span>!</h4></p>
		    		<p>Заполните запрос на создание новой записи в Справочнике на этой странице. 
		    		Запрос составляетя в произвольной форме. Не забудьте указать желаемое название новой Группы или Фирмы производителя.
		    		<!-- После рассмотрения заявки на ваш почтовый адресс будет выслано уведомление. --> 
		    		</p>
					<p>&nbsp;</p>
				</div>
				
				<div class="form-group">
					<label class="form-label">Введите ваш запрос:</label>
					<div class="controls">
						<form:textarea id="supportNote" path="supportMessage" rows="10" cssClass="form-control" />
					</div>
			    </div>
		        <div class="form-actions">
		          	<button type="submit" class="btn btn-primary">Отправить</button>
		        </div>
		  </div>
		 </form:form> 	
	</div> <!-- Closing div tag for wrap -->
	
		   <jsp:include page="common/footer.jsp" />	
	</body>
</html>