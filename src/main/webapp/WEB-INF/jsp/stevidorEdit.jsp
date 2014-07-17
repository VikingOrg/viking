<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Компании-Оператора</title>
        
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container">
			<form:form id="registration" action="stevidorEdit" commandName="stevidorEditCommand" method="post" accept-charset="UTF-8">
			    <!-- 			    Контейнер заголовка блока контента -->
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			          
			      		<c:choose>
					      <c:when test="${stevidorEditCommand.formType=='E'}">
					      	<h3 class="page-header">Редактирование Компании-Оператора<br></h3>
					      </c:when>
					      <c:when test="${stevidorEditCommand.formType=='C'}">
					      	<h3 class="page-header">Копирование Компании-Оператора<br></h3>
					      </c:when>					      
					      <c:otherwise>
							<h3 class="page-header">Добавление Компании-Оператора<br></h3>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>

			          </div>
			        </div>
			      <div class="row">
			        <div class="col-sm-4 col-sm-offset-1">
			        
			         <spring:bind path="stevidor.name">
				        <div class="form-group ${status.error ? 'has-error' : ''}">
				        	<div class="controls">
					            <label class="form-label">Наименование</label>
					            <form:input path="stevidor.name" cssClass="form-control" title="Введите наименование"/>
					            <form:errors class="control-label" path="stevidor.name"/>
				            </div>
				        </div>
				     </spring:bind>
				     
			         <spring:bind path="stevidor.fullName">
				        <div class="form-group ${status.error ? 'has-error' : ''}">
				        	<div class="controls">
					            <label class="form-label">Полное наименование</label>
					            <form:input path="stevidor.fullName" cssClass="form-control" title="Введите полное наименование"/>
					            <form:errors class="control-label" path="stevidor.fullName"/>
				            </div>
				        </div>
				     </spring:bind>				     			        

			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
						<label class="form-label">Порт</label>
						<form:select path="stevidor.portId" cssClass="form-control">
						      <c:forEach items="${stevidorEditCommand.userPort}" var="port">
						          <form:option value="${port.key}" label="${port.value.name}" />
						      </c:forEach>							
						</form:select>		          
						<p>&nbsp;</p>
			           
			            <div class="form-group">
				            <label class="form-label">Примечания</label>
				            <div class="controls">
				            	<form:textarea path="stevidor.stevidorNote" rows="3" cssClass="form-control"/>
				            </div>
			            </div>
			            
			        </div>
			      </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-sm-10 col-sm-offset-1">
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
		           		<a type="button" class="cancelbtn" 
		            	onclick="window.location.href = '<c:url value="stevidorSearch"/>';" 
		            	value="Klick">Вернуться</a>
			          </div>
			        </div>
			      </div>
			    </div>		
			    
			    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
				<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-body" align="center">
				        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</h4>
				      </div>
				      <div class="modal-footer">
				        <a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
				        <button type="submit" class="btn btn-primary">Сохранить</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
		
			</form:form>    			
			</div> <!-- End of Main Container -->	
	</div> <!-- Closing div tag for wrap -->
		<jsp:include page="common/footer.jsp" />
	</body>
</html>