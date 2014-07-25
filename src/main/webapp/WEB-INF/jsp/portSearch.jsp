<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Портов</title>
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
            	var oTable = $('#port_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               { "bSortable": false },
                	           ],
                	"sDom": "t<'row'<'col-xs-6'i><'col-xs-6'p>>",
                    "oTableTools": {
                    	"sSwfPath": "static/swf/copy_csv_xls_pdf.swf"
                    },
                    "sPaginationType": "bootstrap",
	                "iDisplayLength": 15,
                    "oLanguage": {
                        "sUrl": "static/js/dataTable_ru_RU.txt"
                     }                    
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 3);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 2);
                });
                
            } );

    
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
	<div class="container">
	
		<form:form id="port_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="portSearch"
			commandName="portSearchCommand" method="post" accept-charset="UTF-8">
			<div class="row">
	
				<!--Sidebar content-->
				<div class="col-sm-4">
					<div class="col-sm-12 well lform">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-sm-4 control-label">Страна</label>
									<div class="col-sm-8">
										<form:select id="countrySelect" path="countryId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все</form:option>
											<c:forEach items="${portSearchCommand.userCountry}"
												var="country">
												<form:option value="${country.value.nameRus}"
													label="${country.value.nameRus}" />
											</c:forEach>
										</form:select>
									</div>
								</div>
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
								<a href="<c:url value="portEdit/new/"/> "class="btn btn-primary pull-right" title="Ввод нового">Добавить</a>
								<span class="pull-right">&nbsp;</span> 
								<a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
							</div>
						</div>
					</div>
				</div>
				<!-- End of Sidebar content-->
				<div class="col col-sm-8">
	
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
	
	
					<!-- Таблица со списком портов -->
					<h3 class="page-header">Список портов</h3>
					<table id="port_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check nowrap">&nbsp;</th>
								<th class="nowrap">Порт&nbsp;&nbsp;</th>
								<th class="hidden-sm hidden-xs nowrap">Страна&nbsp;&nbsp;</th>
								<th class="hidden-sm hidden-xs nowrap">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="port" varStatus="loop"
								items="${portSearchCommand.portList}">
								<c:if test="${port.archived != 'Y'}">
									<tr>
										<td class="column-check nowrap"><form:checkbox
												path="portList[${loop.index}].archived" value="Y"></form:checkbox>
											<c:if test="${system.localConfig}">
												<span class="alert-danger"> <c:out
														value="(${port.portId})" />
												</span>
											</c:if></td>
										<td class="nowrap">
											<a href="<c:url value="portEdit/edit/${port.portId}"/>"><c:out
													value="${port.fullName}" /></a></td>
										<td class="hidden-sm hidden-xs nowrap"><c:out
												value="${port.country.nameRus}" /></td>
										<td class="hidden-sm hidden-xs nowrap"><c:out
												value="${port.portNote}" /></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
	
				</div>
			</div>
	
		</form:form>
	</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />



</body>
</html>