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
        <jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript">
	        $(document).ready(function() {
	        	var oTable = $('#machine_table').dataTable( {
	        	        "bJQueryUI": true,
	        	        "sDom": '<r>t<"F"ip>',
	        	        "sPaginationType": "full_numbers",
	        	        "bProcessing": true,
	        	        "responsive": true,
	                    "oLanguage": {
	                        "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
	                     },
	                    "sScrollX": "99%",
	        	        "sAjaxSource": '${pageContext.request.contextPath}/machineSearch/getMachines/',
	        	        "aoColumnDefs": [
	        	                         { "bVisible": true,  "aTargets": [ 1 ] },
	        	                         {
		        	   	        		      "aTargets": [ 2 ],
		        	   	        		      "mData": 2,
		        	   	        		      "mRender": function ( data, type, full ) {
		        	   	        		        return '<a href="'+data+'">'+data+'</a>';
		        	   	        		      }
	        	   	        		     }
	        	                       ]       
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
			                <th>Id</th>
			                <th>Группа</th>
			                <th>Модель</th>
			                <th>Компания</th>
							<th>Характеристики</th>									                
							<th>Производитель</th>
							<th>Год выпуска</th>
							<th>Дата ввода в эксплуатацию</th>
							<th>Контракт №</th>
							<th>Инвентарный №</th>
							<th>Транс №</th>
							
							<th>Заводской №</th>
							<th>Страна призводства&nbsp;&nbsp;</th>
							<th>Место установки</th>
							<th>Порт&nbsp;&nbsp;</th>
							<th>Страна&nbsp;&nbsp;</th>
							<th>Номенклатурный №</th>
							<th>Регистрационный №</th>
							<th>Примечания</th>
							<th>group Id</th>							
			            </tr>
			        </thead>
			        <tbody>
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