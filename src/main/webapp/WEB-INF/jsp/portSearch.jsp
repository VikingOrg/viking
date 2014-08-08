<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Портов</title>
		<jsp:include page="common/headCoreElements.jsp" />
		
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#port_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               { "bSortable": false },
                	           ],
                	"scrollX": true,
                    "sDom": '<"#tableActions"T>t<"#source"l>ip',
                	tableTools: {
             			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
             		 	"aButtons": [
               	                "copy",
               	             	{
               	                    "sExtends":     "print",
               	                    "bHeader": true
               	                	},
               	            	{
               	                    "sExtends":     "csv",
               	                    "sButtonText": "Save",
               	                    "bHeader": true
               	                	}
               	            ]
             	   },
                    "bJQueryUI": true,
                    "oLanguage": {
                        "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                     },
                     "fnInitComplete": function(oSettings) {
	                	   $('select[name="port_table_length"]').appendTo("#table_length");
	                	   $('select[name="port_table_length"]').addClass("form-control");
	 	              },                   
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
				<div id = "limit_width" class="col-sm-3">
					<div class="col-sm-12 well lform">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label>Страна</label>
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
								<div class="form-group">
									<label>Поиск</label>
										<input id="dataTableSearch" class="form-control"
											placeholder="Введите..."
											title="Введите для поиска по всем полям" type="text" />
								</div>
								<div class="form-group">
										<label>Кол.строк:</label>
										<div id="table_length"></div>					
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 well lform">
							<div class="row" style="padding-right:10px">	
							<!--  Операции с данными в таблице -->
								<div class="col-sm-12">
									<div class="form-group">
										<a href="<c:url value="portEdit/new/"/> "class="btn btn-primary pull-right" title="Ввод нового">Добавить</a>
										<span class="pull-right">&nbsp;</span> 
										<a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
									</div>
								</div>
							</div>
					</div>
				</div>
				<!-- End of Sidebar content-->
				<div id = "#max_width" class="col-sm-9">
	
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
								<th class="column-check nowrap" width= "20px">&nbsp;</th>
								<th class="nowrap">Порт&nbsp;&nbsp;</th>
								<th class="nowrap">Страна&nbsp;&nbsp;</th>
								<th class="nowrap">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="port" varStatus="loop"
								items="${portSearchCommand.portList}">
								<c:if test="${port.archived != '1'}">
									<tr>
										<td class="column-check nowrap" width= "20px"><form:checkbox
												path="portList[${loop.index}].archived" value="Y"></form:checkbox>
										</td>
										<td class="nowrap">
											<a href="<c:url value="portEdit/edit/${port.portId}"/>"><c:out
													value="${port.name}" /></a></td>
										<td class="nowrap"><c:out
												value="${port.country.nameRus}" /></td>
										<td class="nowrap"><c:out
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