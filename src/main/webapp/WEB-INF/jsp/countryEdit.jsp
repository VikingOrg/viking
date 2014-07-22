<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
<head>
<title>Редактирование Компании-Оператора</title>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/core.css"/>
	    
	    <!--[if lt IE 9]>
			<script type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js.response.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="../../static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="../../static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="../../static/js/dataTables.tableTools.js" ></script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container">
	<form:form id="registration" action="countryEdit"
		commandName="countryEditCommand" method="post" accept-charset="UTF-8">
		<!-- 			    Контейнер заголовка блока контента -->
		<div class="container">
			<div class="col-md-10 col-md-offset-1">

				<c:choose>
					<c:when test="${not empty countryEditCommand.country.countryId}">
						<h3 class="page-header">
							Редактирование Страны<br>
						</h3>
					</c:when>
					<c:otherwise>
						<h3 class="page-header">
							Добавление Страны<br>
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

				<spring:bind path="country.nameRus">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<div class="controls">
							<label class="form-label">Наименование по-русски</label>
							<form:input path="country.nameRus" cssClass="form-control"
								title="Введите наименование" />
							<form:errors class="control-label" path="country.nameRus" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="country.nameEn">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<div class="controls">
							<label class="form-label">Наименование по-английски</label>
							<form:input path="country.nameEn" cssClass="form-control"
								title="Введите полное наименование" />
							<form:errors class="control-label" path="country.nameEn" />
						</div>
					</div>
				</spring:bind>

			</div>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="form-actions">

						<input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()"
							value="Сохранить" /> <input type="button"
							class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()"
							value="Скопировать" /> <input type="button"
							class="btn btn-primary" data-toggle="modal"
							data-target="#confirmSave" onclick="submitForm()"
							value="Вернуться" />

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