<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>

<!doctype html>
<html lang="ru">
<head>
<title>Главная страница</title>

<jsp:include page="common/menu.jsp" />

<!-- Begin page content -->

<div class="container">
	<h1 class="page-header">Крутой репорт.</h1>
	<div class="alert alert-success show">
		<p>
		<h4>
			Отчет формируется от имени: <span id="username">${userModel.firstName}&nbsp;</span>
		</h4>
		</p>
		<p>Для ознакомления с правилами формирования отчета звонител в
			службу потдежки.</p>
		<p>&nbsp;</p>
		<form:form id="machine_search_form" class="form-horizontal mini"
			style="margin-bottom: 0px;" action="machineSearch"
			commandName="reportSelectionCommand" method="post"
			accept-charset="UTF-8">
			<div class="row">

				<!--Sidebar content-->
				<div class="col-sm-4">

					<div class="col-sm-12 well">

						<div class="row">

							<div class="col-sm-12">

								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<div class="form-group">
										<label class="col-sm-3 control-label">Страна</label>
										<div class="col-sm-9">
											<form:select id="countrySelect" path="countryId"
												cssClass="form-control col-sm-12">
												<form:option value="">Все</form:option>
												<c:forEach items="${reportSelectionCommand.userCountry}"
													var="country">
													<form:option value="${country.value.nameRus}"
														label="${country.value.nameRus}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">Порт</label>
										<div class="col-sm-9">
											<form:select id="portSelect" path="portId"
												cssClass="form-control col-sm-12">
												<form:option value="">Все</form:option>
												<c:forEach items="${reportSelectionCommand.userPort}"
													var="port">
													<form:option value="${port.value.name}"
														label="${port.value.name}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">Компания</label>
										<div class="col-sm-9">
											<form:select id="stevidorSelect" path="stevidorId"
												cssClass="form-control col-sm-12">
												<form:option value="">Все</form:option>
												<c:forEach items="${reportSelectionCommand.userStevidor}"
													var="stevidor">
													<form:option value="${stevidor.value.fullName}"
														label="${stevidor.value.fullName}" />
												</c:forEach>
											</form:select>
										</div>
									</div>

								</sec:authorize>
								<div class="form-group">
									<label class="col-sm-3 control-label">Группа</label>
									<div class="col-sm-9">
										<form:select id="groupSelect" path="groupId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все</form:option>
											<c:forEach items="${reportSelectionCommand.groupMap}"
												var="group">
												<form:option value="${group.key}"
													label="${group.value.name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Год выпуска</label>
									<div class="col-sm-9">
										<form:select id="releaseYearSelect" path="releaseYear"
											cssClass="form-control" title="Выборка по году выпуска">
											<form:option value="" label="Все" />
											<form:options items="${reportSelectionCommand.yearMap}" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Производитель</label>
									<div class="col-sm-9">
										<form:select id="manufacturerSelect" path="manufacturerId"
											cssClass="form-control" title="Выборка по производителю">
											<form:option value="">Все</form:option>
											<c:forEach items="${reportSelectionCommand.manufacturerMap}"
												var="manufacturer">
												<form:option value="${manufacturer.value.name}"
													label="${manufacturer.value.name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
 
			                    <div class="filter_select">
				                    <label class="form-label">МОДЕЛЬ</label>
				                    <select class="form-control" title="Выборка по модели">
					                    <option>Не установлен</option>
					                    <option>Альбатрос 10/20т</option>
					                    <option>Кондор 16/20/32т</option>
					                    <option>Сокол 16/20/32т</option>
				                    </select>
			                    </div>	
							</div>

						</div>
						<hr>
						<!--  Операции с данными в таблице -->
						<div class="col-sm-12">
							<a href="<c:url value="machineEdit"/>"
								class="btn btn-primary pull-right" title="Ввод нового">Сформировать</a><span
								class="pull-right">&nbsp;</span> <a href="#"
								class="btn btn-primary pull-right" title="Удалить"
								data-toggle="modal" data-target="#confirmDelete">Отменить</a>
						</div>
					</div>

				</div>
				<!-- End of Sidebar content-->

				<div class="col-sm-8">

					<!-- Start table content -->

					<!--  Вывод сообщений и предупреждений  -->
					<c:if test="${not empty message}">
						<div class="alert alert-success show">
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

					<!-- 	Таблица отчета -->
					<h3 class="page-header">Отчет Номер 1</h3>
					<table id="machine_table"
						class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check nowrap">&nbsp;#</th>
								<th class="hidden-sm hidden-xs hidden-md nowrap">Компания&nbsp;&nbsp;</th>
								<th class="nowrap">Модель&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="column-check nowrap"></td>
								<td class="column-check nowrap"></td>
								<td class="column-check nowrap"></td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
			<!-- 		Модальное окно подтверждения удаления данных -->
			<div class="modal fade" id="confirmDelete" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body" align="center">
							<h4>ПОДТВЕРДИТЕ УДАЛЕНИЕ ДАННЫХ</h4>
						</div>
						<div class="modal-footer">
							<a type="button" class="cancelbtn" data-dismiss="modal">ОТМЕНА</a>
							<button type="submit" class="btn btn-primary">УДАЛИТЬ</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</form:form>

	</div>
</div>
</div>
<!-- Closing div tag for wrap -->

<jsp:include page="common/footer.jsp" />
</body>
</html>