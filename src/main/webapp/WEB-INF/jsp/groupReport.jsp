<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<!doctype html>
<html lang="ru">
<head>
<title>Отчет по количеству ПТО</title>
	<jsp:include page="common/headCoreElements.jsp" />
	<spring:url var = "action" value='/reportSelection'/> 
	<script type="text/javascript" src="//www.google.com/jsapi"></script>
	<script src="<c:url value="/static/js/attc.googleCharts.js"/>"></script>
	<script>
		  $(document).ready(function() {
			  oTable = $('#group_report_table').dataTable({
            	  "bJQueryUI": true,
            	  "sPaginationType": "full_numbers",
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
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                  },
                  "aoColumns": [
                                 { "mDataProp": "groupId" },
                                 { "mDataProp": "name" },
                                 { "mDataProp": "count" }
                               ],                      
                  "fnInitComplete": function(oSettings) {
                	   $("#tableActions").appendTo("#table_Actions");
                	   $('select[name="group_report_table_length"]').appendTo("#table_length");
                	   $('select[name="group_report_table_length"]').addClass("form-control");
 	              },
              });

              $("#sumbit_report").click(function(e) {
	           		e.preventDefault();
	           		$('#divErrorMessage').attr("class","alert alert-danger hide");
	           		showProgressModal('#wait_modal');
	           		oTable.fnClearTable();
	           		var pageData =  $("#report_select_form").serialize();
	          		$.getJSON("${pageContext.request.contextPath}/reportSelection/getGroupReport/", pageData, function (data) {
	          			if (data.length != 0 ) {
	          				oTable.fnAddData(data);
	          			}
	          			setReportTitle();
	          			closeProgressModal('#wait_modal');
	          		}).fail( function(d, textStatus, error) {
	          	        console.error("getJSON failed, status: " + textStatus + ", error: "+error);
	          	        closeProgressModal('#wait_modal');
	          	        $('#divErrorMessage').attr("class","alert alert-danger show");
	         	   	});
              });
              
              $('#group_report_table').attc({
                  "controls":{
                	  showHide:false,
                	  create:false,
                	  chartType:false,
                	  },
                  "googleOptions":{"is3D":true, "legend":"none", "backgroundColor": "none"},
              });
              
		  });  //end of document.ready

		  function setReportTitle() {
			   $('#title_company').html($("#stevidorSelect option:selected").text());
			   $('#title_year').html($("#releaseStartYearSelect option:selected").text()+"-"+$("#releaseEndYearSelect option:selected").text());
			   $('#title_manufacturer').html($("#manufacturerSelect option:selected").text());
		  }
					  
	  </script>		  
</head>
<body>
		<!-- Wrap all page content here -->  
<div id="wrap">			
<jsp:include page="common/menu.jsp" />
	<!-- Begin page content -->
	<div class="container">
<!-- 		<h1 class="page-header">Отчеты.</h1> -->
		<div class="alert alert-info">
			
			<form:form id="report_select_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="${action}" 
								commandName="reportSelectionCommand" method="post" accept-charset="UTF-8">

				<!--Report 1 part 1-->
				<div class="row" style="margin:-15px">
	
					<!--Sidebar content-->
					<div id = "limit_width" class="col-sm-4">
	
						<div class="col-sm-12 well lform">
	
							<div class="row">
	
								<div class="col-sm-12">
									<sec:authorize access="hasRole('ROLE_ADMIN')">
									<div class="form-group">
										<label>Компания</label>
											<form:select id="stevidorSelect" path="stevidorId" cssClass="form-control col-sm-12">
												<form:option value="0">Все компании</form:option>
												<c:forEach items="${reportSelectionCommand.stevidorMap}" var="stevidor">
													<form:option value="${stevidor.key}" label="(${stevidor.value.stevidorId}) ${stevidor.value.fullName}" />
												</c:forEach>
											</form:select>
									</div>
									</sec:authorize>

									<div class="form-group">
										<label class="col-sm-4 control-label">Год выпуска</label>
										<div class="col-sm-8" style="padding-right: 0px">
											<form:select id="releaseStartYearSelect" path="releaseStartYear"
												cssClass="form-control" title="Выборка по году выпуска">
												<form:option value="" label="Все года" />
												<form:options items="${reportSelectionCommand.yearMap}" />
											</form:select>
											<form:select id="releaseEndYearSelect" path="releaseEndYear"
												cssClass="form-control" title="Выборка по году выпуска">
												<form:option value="" label="Все года" />
												<form:options items="${reportSelectionCommand.yearMap}" />
											</form:select>										
										</div>
									</div>
									<div class="form-group">
										<label>Производитель</label>
											<form:select id="manufacturerSelect" path="manufacturerId"
												cssClass="form-control" title="Выборка по производителю">
												<form:option value="0">Все производители</form:option>
												<c:forEach items="${reportSelectionCommand.manufacturerMap}" var="manufacturer">
													<form:option value="${manufacturer.key}" label="${manufacturer.value.nameRus}" />
												</c:forEach>
											</form:select>
									</div>
									<div id="data_table_elements" class="form-group">
										<label>Кол.строк:</label>
										<div id="table_length"></div>					
									</div>
								</div>
							</div>
						</div>
					<div class="col-sm-12 well lform">
						<div class="row" style="padding-right:10px">
							<div class="col-sm-12">
								<div class="form-group">
									<!--  Кнопочка сформировать отчет -->
									<input id="sumbit_report" type="button" class="btn btn-primary pull-right"  value="Сформировать" />
									<span class="pull-right">&nbsp;</span>
									<button id="refresh" class="btn cancelbtn pull-left"><span class="glyphicon glyphicon-refresh"></span> </button>
								</div>	
							</div>
						</div>	
					</div>
					<div id="group_pie" class="col-sm-12 well lform">
						<%-- <span>Всего механизмов:</span><c:out value="${reportSelectionCommand.totalMachineCount}"/>	 --%>
						<div id="groupReportPie" class="form-group"></div>
					</div>
				</div>
					<!-- End of Sidebar content-->
	
					<div id = "#max_width" class="col-sm-8">
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
						<div id="divErrorMessage" class="alert alert-danger hide">
							<span id="errorMessage">Произошла ошибка во время формирования отчета!</span>
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
	
						<!-- Таблица отчета -->
						<div class="pull-left">
							<h3 class="page-header">Отчет 02  "Кол-во Механизмов в Группах"</h3>
						</div>
						<table id="machine_table" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">Составитель отчета: <span class="report_header">${userModel.firstName} ${userModel.lastName}</span></td>
									<td class="nowrap" rowspan="4" valign="bottom" id="table_Actions"></td>
								</tr>
								<tr>
									<td class="nowrap">Компания:<span id="title_company" class="report_header">Все компании</span><br></td>
								</tr>
								<tr>
									<td class="nowrap">Год выпуска: <span id="title_year" class="report_header">Все года</span></td>
								</tr>
								<tr>
									<td class="nowrap">Производитель: <span id="title_manufacturer" class="report_header">Все производители</span></td>
								</tr>
							</tbody>
						</table>

						<table id="group_report_table" class="table table-striped table-bordered"
							title="Распределение ПТО по Группам"  
				    		summary="pieDescription" 
				    		data-attc-createChart="false"
				    		data-attc-colDescription="pieDescription" 
				    		data-attc-colValues="pieValues" 
				    		data-attc-location="groupReportPie" 
				    		data-attc-hideTable="false" 
				    		data-attc-type="pie"
				    		data-attc-controls='{"showHide":false,"create":false,"chartType":false}'>
							<thead class="tablehead">
								<tr>
									<th class="column-check">№</th>
									<th class="nowrap">Группа</th>
									<th class="nowrap">Кол-во</th>
								</tr>
							</thead>
							<tbody>
								<%--
					            <c:forEach items="${reportSelectionCommand.groupReportList}" var="groupReport" varStatus="loop">
									<tr>
										<td class="column-check"><c:out value="${groupReport.groupId}"/></td>
										<td class="nowrap" id="pieDescription"><c:out value="${groupReport.name}"/></td>
										<td class="nowrap" id="pieValues"><c:out value="${groupReport.count}"/></td>
									</tr>			            
				                </c:forEach>						
							 	--%>
							</tbody>
						</table>
	
					</div>
				</div> <!--End of Report 2-->
				<!-- 		Модальное окно ожидания загрузки данных -->
				<div class="modal fade" id="wait_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body" align="center">
								<h3 style="color:#448800">Подождите, идет загрузка данных</h3>
								<img src="<c:url value="/static/images/32.gif"/>">
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