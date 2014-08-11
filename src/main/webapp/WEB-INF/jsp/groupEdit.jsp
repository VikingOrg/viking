<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
<head>
<title>Редактирование Группы Механизмов</title>
	    <jsp:include page="common/headCoreElements.jsp" />
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container">
	<form:form action="portEdit" commandName="portEditCommand" method="post" accept-charset="UTF-8">
		<div class="container">
			<div class="col-md-10 col-md-offset-1">

				<c:choose>
					<c:when test="${not empty portEditCommand.port.portId}">
						<h3 class="page-header">
							Редактирование Группы<br>
						</h3>
					</c:when>
					<c:otherwise>
						<h3 class="page-header">
							Добавление Группы<br>
						</h3>
					</c:otherwise>
				</c:choose>

				<c:if test="${not empty error}">
					<div class="alert alert-danger show">
						<spring:message code="${error}" />
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
				</c:if>

			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">

				<spring:bind path="port.name">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<div class="controls">
							<label class="form-label">Наименование</label>
							<form:input path="port.name" cssClass="form-control"
								title="Введите наименование" />
							<form:errors class="control-label" path="port.name" />
						</div>
					</div>
				</spring:bind>
			</div>
			<div class="col-sm-4 col-sm-offset-1">
				

				<div class="form-group">
					<label class="form-label">Примечания</label>
					<div class="controls">
						<form:textarea path="port.portNote" rows="3"
							cssClass="form-control" />
					</div>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="form-actions">

						<input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()" value="Сохранить" />
							
						<input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()" value="Скопировать" />
							
						<input type="button" class="btn cancelbtn" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()" value="Отмена" />
							
					</div>
				</div>
			</div>
		</div>
		

		<!-- 		Модальное окно подтверждения сохранения введенных данных -->
		<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" align="center">
						<h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</h4>
					</div>
					<div class="modal-footer">
						<a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
						<button type="submit" class="btn btn-primary">Сохранить</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</form:form>
</div>
<!-- End of Main Container -->
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />
</body>
</html>