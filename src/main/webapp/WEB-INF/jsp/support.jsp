<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>ВОПРОС В СЛУЖБУ ПОДДЕРЖКИ</title>
		<jsp:include page="common/headCoreElements.jsp" />
	    
	</head>
	<body>
		
	<!-- Wrap all page content here -->  
	<div id="wrap">		
		<jsp:include page="common/menu.jsp" />

		<form:form action="support"	commandName="supportCommand" method="post" accept-charset="UTF-8">
			  <!-- Begin page content -->		 
			  <div class="container">
			  	<h1  class="page-header">Поддержка</h1><br/>
				<!--  Вывод сообщений и предупреждений  -->
				<c:if test="${not empty message}">
					<div id="success" class="alert alert-success show">
						<spring:message code="${message}" />
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-danger show">
						<spring:message code="${error}" />
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
				</c:if>
				
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