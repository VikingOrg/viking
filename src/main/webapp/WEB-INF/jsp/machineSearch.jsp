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
<title>Таблица подъемно-транспортного оборудования</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    
	    <!--[if lt IE 9]>
			<script type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js.response.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/dataTables.tableTools.js" ></script>
		<script type="text/javascript">
	        $(document).ready(function() {
	        	var oTable = $('#machine_table').dataTable( {
	            	
	                "sDom": "t<'row'<'col-xs-6'i><'col-xs-6'p>>",
	                "sPaginationType": "bootstrap",
	                "iDisplayLength": 15,
     	           "scrollX": true,
	                "oLanguage": {
                        "sUrl": "static/js/dataTable_ru_RU.txt"
                     } 
	            } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 15);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 14);
                });
                $('#stevidorSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 3);
                });
                $('#groupSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 19);
                });
                $('#manufacturerSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 5);
                });                                                
                $('#releaseYearSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 6);
                });
                 
//                 $('#selectAll').click(function (e) {
//                     $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
//                 });
            } );
    
        </script>
	
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container">
	<form:form id="machine_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="machineSearch" 
	commandName="machineSearchCommand" method="post" accept-charset="UTF-8">
		<div class="row">

			<!--Sidebar content-->
			<div class="col-sm-4">

				<div class="col-sm-12 well lform">

					<div class="row">

						<div class="col-sm-12">

							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="form-group">
									<label class="col-sm-4 control-label">Страна</label>
									<div class="col-sm-8">
										<form:select id="countrySelect" path="countryId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все</form:option>
											<c:forEach items="${machineSearchCommand.userCountry}"
												var="country">
												<form:option value="${country.value.nameRus}"
													label="${country.value.nameRus}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Порт</label>
									<div class="col-sm-8">
										<form:select id="portSelect" path="portId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все</form:option>
											<c:forEach items="${machineSearchCommand.userPort}"
												var="port">
												<form:option value="${port.value.name}"
													label="${port.value.name}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Компания</label>
									<div class="col-sm-8">
										<form:select id="stevidorSelect" path="stevidorId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все</form:option>
											<c:forEach items="${machineSearchCommand.userStevidor}"
												var="stevidor">
												<form:option value="${stevidor.value.fullName}"
													label="${stevidor.value.fullName}" />
											</c:forEach>
										</form:select>
									</div>
								</div>

							</sec:authorize>
							<div class="form-group">
								<label class="col-sm-4 control-label">Группа</label>
								<div class="col-sm-8">
									<form:select id="groupSelect" path="groupId"
										cssClass="form-control col-sm-12">
										<form:option value="">Все</form:option>
										<c:forEach items="${machineSearchCommand.groupMap}"
											var="group">
											<form:option value="${group.key}" label="${group.value.name}" />
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Год выпуска</label>
								<div class="col-sm-8">
									<form:select id="releaseYearSelect" path="releaseYear"
										cssClass="form-control" title="Выборка по году выпуска">
										<form:option value="" label="Все" />
										<form:options items="${machineSearchCommand.yearMap}" />
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Производитель</label>
								<div class="col-sm-8">
									<form:select id="manufacturerSelect" path="manufacturerId"
										cssClass="form-control" title="Выборка по производителю">
										<form:option value="">Все</form:option>
										<c:forEach items="${machineSearchCommand.manufacturerMap}"
											var="manufacturer">
											<form:option value="${manufacturer.value.nameRus}"
												label="${manufacturer.value.nameRus}" />
										</c:forEach>
									</form:select>
								</div>
							</div>
							<!-- 
					                    <div class="filter_select">
						                    <label class="form-label">МОДЕЛЬ</label>
						                    <select class="form-control" title="Выборка по модели">
							                    <option>Не установлен</option>
							                    <option>Альбатрос 10/20т</option>
							                    <option>Кондор 16/20/32т</option>
							                    <option>Сокол 16/20/32т</option>
						                    </select>
					                    </div>	
					                     -->
							<div class="form-group">
								<label class="col-sm-4 control-label">Поиск</label>
								<div class="col-sm-8">
									<input id="dataTableSearch" class="form-control"
										placeholder="Введите..."
										title="Введите для поиска по всем полям" type="text" />
								</div>
							</div>
						</div>

					</div>
					<hr>
					<!--  Операции с данными в таблице -->
					<div class="form-group">
						<div class="col-sm-12">
							<a href="<c:url value="machineEdit"/> "class="btn btn-primary pull-right" title="Ввод нового">Добавить</a>
								<span class="pull-right">&nbsp;</span> 
							<a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
						</div>
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

				<!-- 	Таблица со списком машин -->
				<h3 class="page-header">Подъемно-транспортное оборудование</h3>
				<table id="machine_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th class="column-check nowrap">&nbsp;</th>
							<th class="hidden-sm hidden-xs nowrap">Группа&nbsp;&nbsp;</th>
							<th class="nowrap">Модель&nbsp;&nbsp;</th>
							<th class="hidden-sm hidden-xs nowrap">Компания&nbsp;&nbsp;</th>
							<th class="hidden-sm hidden-xs nowrap">Характеристики&nbsp;&nbsp;</th>
							<th class="hide">Производитель&nbsp;&nbsp;</th>
							<th class="hide">Год выпуска&nbsp;&nbsp;</th>
							<th class="hide">Дата ввода в эксплуатацию</th>
							<th class="hide">Контракт №</th>
							<th class="hide">Инвентарный №</th>
							<th class="hide">Транс №</th>
							<th class="hide">Заводской №</th>
							<th class="hide">Страна призводства&nbsp;&nbsp;</th>
							<th class="hide">Место установки</th>
							<th class="hide">Порт&nbsp;&nbsp;</th>
							<th class="hide">Страна&nbsp;&nbsp;</th>
							<th class="hidden-sm hidden-xs nowrap">Номенклатурный №</th>
							<th class="hide">Регистрационный №</th>
							<th class="hidden-sm hidden-xs nowrap">Примечания</th>
							<th class="hide">group Id&nbsp;&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="machine" varStatus="loop"
							items="${machineSearchCommand.machineList}">
							<c:if test="${machine.archived != 'Y'}">
								<tr>
									<td class="column-check nowrap"><form:checkbox
											path="machineList[${loop.index}].archived" value="Y"></form:checkbox>
										<c:if test="${system.localConfig}">
													<span class="alert-danger">
				                              			<c:out value="(${machine.machineId})"/>
				                              		</span>
										</c:if></td>
									<td class="hidden-sm hidden-xs hidden-md nowrap"><c:if
											test="${system.localConfig}">
											<%-- 	<span class="alert-danger">
					                              			<c:out value="(${machine.machineModel.group.groupId})"/>
					                              		</span> --%>
										</c:if> <c:out value="${machine.machineModel.group.name}" /></td>
									<td class="nowrap"><a
										href="<c:url value="machineEdit?machineId=${machine.machineId}&copy=true"/>">&nbsp;<span
											class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;
									</a> <a
										href="<c:url value="machineEdit?machineId=${machine.machineId}"/>">
											<c:if test="${system.localConfig}">
												<%-- <span class="alert-danger">
				                              			<c:out value="(${machine.machineModel.modelId})"/>
				                              		</span> --%>
											</c:if> <c:out value="${machine.machineModel.name}" />
									</a></td>
									<td class="hidden-sm hidden-xs nowrap"><c:out
											value="${machine.stevidor.fullName}" /></td>
									<td class="hidden-sm hidden-xs nowrap"><c:out
											value="${machine.details}" /></td>
									<td class="hide"><c:out
											value="${machine.machineModel.manufacturer.nameRus}" /></td>
									<td class="hide"><c:out value="${machine.releaseYear}" /></td>
									<td class="hide"><spring:eval
											expression="machine.startDate" /></td>
									<td class="hide">№<c:out value="${machine.doc}" /></td>
									<td class="hide"><c:out value="${machine.inventoryNumb}" /></td>
									<td class="hide"><c:out value="${machine.transNumb}" /></td>
									<td class="hide"><c:out value="${machine.factoryNumb}" /></td>
									<td class="hide"></td>
									<td class="hide"><c:out value="${machine.location}" /></td>
									<td class="hide"><c:out
											value="${machine.stevidor.port.name}" /></td>
									<td class="hide"><c:out
											value="${machine.stevidor.port.country.nameRus}" /></td>
									<td class="hidden-sm hidden-xs nowrap"></td>
									<td class="hide"></td>
									<td class="hidden-sm hidden-xs nowrap"><c:out
											value="${machine.note}" /></td>
									<td class="hide"><c:out
											value="${machine.machineModel.group.groupId}" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<!-- 		Модальное окно подтверждения удаления данных -->
		<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" align="center">
						<h4>ПОДТВЕРДИТЕ УДАЛЕНИЕ ДАННЫХ</h4>
					</div>
					<div class="modal-footer">
						<a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
						<button type="submit" class="btn btn-primary">Удалить</button>
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
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />
</body>
</html>