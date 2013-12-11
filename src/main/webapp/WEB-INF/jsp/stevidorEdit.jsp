<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование стивидора</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="common/menu.jsp" />
			<!-- Begin page content -->
		    <div class="container">
			<form:form id="registration" action="stevidorEdit" commandName="stevidorEditCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
			      <div class="masthead">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			          
			      		<c:choose>
					      <c:when test="${stevidorEditCommand.formType=='E'}">
					      	<h4 class="text-muted page-header">РЕДАКТИРОВАНИЕ СТИВИДОРА<br></h4>
					      </c:when>
					      <c:when test="${stevidorEditCommand.formType=='C'}">
					      	<h4 class="text-muted page-header">КОПИРОВАНИЕ СТИВИДОРА<br></h4>
					      </c:when>					      
					      <c:otherwise>
							<h4 class="text-muted page-header">ДОБАВЛЕНИЕ СТИВИДОРА<br></h4>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>

			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        
			         <spring:bind path="stevidor.name">
				        <div class="form-group ${status.error ? 'has-error' : ''}">
				        	<div class="controls">
					            <label class="form-label">НАИМЕНОВАНИЕ</label>
					            <form:input path="stevidor.name" cssClass="form-control" title="Введите наименование"/>
					            <form:errors class="control-label" path="stevidor.name"/>
				            </div>
				        </div>
				     </spring:bind>
				     
			         <spring:bind path="stevidor.fullName">
				        <div class="form-group ${status.error ? 'has-error' : ''}">
				        	<div class="controls">
					            <label class="form-label">ПОЛНОЕ НАИМЕНОВАНИЕ</label>
					            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите полное наименование"/>
					            <form:errors class="control-label" path="stevidor.fullName"/>
				            </div>
				        </div>
				     </spring:bind>				     			        

			        </div>
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
						<label class="form-label">ПОРТ</label>
						<form:select path="stevidor.portId" cssClass="form-control">
						      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
						          <form:option value="${port.key}" label="${port.value.name}" />
						      </c:forEach>							
						</form:select>		          
						<p>&nbsp;</p>
			           
			            <div class="form-group">
				            <label class="form-label">ПРИМЕЧАНИЯ</label>
				            <div class="controls">
				            	<form:textarea path="stevidor.stevidorNote" rows="3" cssClass="form-control"/>
				            </div>
			            </div>
			            
			        </div>
			      </div>
			    </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1">
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">СОХРАНИТЬ &raquo;</button>
		           		<button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="stevidorSearch"/>';" 
		            	value="Klick">ВЕРНУТЬСЯ &raquo;</button>
			          </div>
			        </div>
			      </div>
			    </div>		
			    
			    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
				<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				        <h4 class="modal-title">ВНИМАНИЕ!</h4>
				      </div>
				      <div class="modal-body">
				        <p>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</p>
				      </div>
				      <div class="modal-footer navbar-fixed-bottom">
				        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
				        <button type="submit" class="btn btn-primary">СОХРАНИТЬ</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
		
			</form:form>    			
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>