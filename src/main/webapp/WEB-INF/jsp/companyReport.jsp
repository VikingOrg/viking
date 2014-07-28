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
<title>Отчет по количеству ПТО в Компаниях-операторах</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script src="<c:url value="/static/js/attc.googleCharts.js"/>"></script>
		
		
		<spring:url var = "action" value='/reportSelection'/> 
		<script>
		  $(document).ready(function() {
			  $("#sumbit_report").click(function(e) {
              	$('#report_select_form').attr('action', "${action}/companyReport/");
            	$('#report_select_form').attr('method', "post");
            	$('#report_select_form').attr('accept-charset', "UTF-8");
            	$('#report_select_form').submit();
				});

              $('#groupSelect').change(function() {
            	  var groupId = $(this).val();
            	  if(groupId=='0'){
            		  $('#modelSelect').html("<option value='0'>Все модели</option>");
                  } else {
	                  $.getJSON('${pageContext.request.contextPath}/machineEdit/model/' + groupId, function(machineModel) {
	                      var options='';
                          options += "<option value='0'>Все модели</option>";
	                      $.each(machineModel, function (i, e) {
	                          options += "<option value='" + e.modelId + "'>" + e.name + "</option>";
	                      });
	                      $('#modelSelect').html(options);
	                  });
                  }
              });	
              oTable = $('#company_report_table').dataTable({
            	  "sDom": '<"toolbar"><"#tableActions"T>t<"#source"l>ip',
            	  "responsive": true,
            	  "sPaginationType": "bootstrap",
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                   },
                  "fnInitComplete": function(oSettings) {
                	   $("#tableActions").appendTo("#table_Actions");
                	   $('select[name="company_report_table_length"]').appendTo("#table_length");
                	   $('select[name="company_report_table_length"]').removeClass( "form-control input-sm" ).addClass("form-control");
                	   var rowCount = $('#company_report_table tr').length;	    
                	   if(rowCount > 2) {
                		   $("#table_length").addClass("col-sm-8");
                		   $("#company_pie").removeClass("hidden");
                		   $("#data_table_elements").removeClass("hidden");            		    
                	   } else {
                		   $("#table_length").addClass("col-sm-8 hidden");
                		   $("#company_pie").addClass("hidden");
                		   $("#data_table_elements").addClass("hidden");
                	   }
                	   $("div.toolbar").html('<b>Custom tool bar! Text/images etc.</b>');
	              },

            	  "scrollX": true,
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
             	   }            	                			
              });
 		     
              $('#company_report_table').attc({
              "controls":{
            	  showHide:false,
            	  create:false,
            	  chartType:false,
            	  },
              "googleOptions":{"is3D":true, "legend":"none", "backgroundColor": "none"},
              });
              	
		  });
		  
		  </script>
		  <style type="text/css">
			  .alert-info {
				color: black;
				background-color: #d9edf7;
				border-color: #bce8f1;
				
				}
			.table_report_header{
			    height: 100%;
			    width: 100%;
			    margin:0px;
			    padding:0px;
			    border-top: 0px solid #dddddd;
			    line-height: 1.42857;
			    padding: 10px;
			    vertical-align: top;
			}
			.report_header{
				font-family: 'Open Sans', sans-serif;
				font-weight:300;
				font-style: italic;
			}

}
		  </style>		  
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
					<div class="col-sm-4">
	
						<div class="col-sm-12 well lform">

							<div class="row">
	
								<div class="col-sm-12">
									<div class="form-group">
										<label class="col-sm-4 control-label">Компания</label>
										<div class="col-sm-8">
											<form:select id="stevidorSelection" path="stevidorSelection" cssClass="form-control col-sm-12" multiple="true">
												<form:option value="0">Все компании</form:option>
												<c:forEach items="${reportSelectionCommand.stevidorMap}" var="stevidor">
													<form:option value="${stevidor.key}" label="(${stevidor.value.stevidorId}) ${stevidor.value.fullName}" />
												</c:forEach>
											</form:select>
										</div>
									</div>							
									<div class="form-group">
										<label class="col-sm-4 control-label">Группа</label>
										<div class="col-sm-8">
											<form:select id="groupSelect" path="groupId" cssClass="form-control col-sm-12">
												<form:option value="0" >Все группы</form:option>
												<c:forEach items="${reportSelectionCommand.groupMap}" var="group">
													<form:option value="${group.key}" label="${group.value.name}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
						        	<div class="form-group">
					                    <label class="col-sm-4 control-label">Модель</label>
					                    <div class="col-sm-8">
											<form:select id="modelSelect" path="modelId" cssClass="form-control col-sm-12">
												<form:option value="0">Все модели</form:option>
								                <c:forEach items="${reportSelectionCommand.machineModelMap}" var="model">
								                    <form:option value="${model.key}" label="${model.value.name}" />
								                </c:forEach>									
											</form:select>
										</div>
						        	</div>
									<div class="form-group">
										<label class="col-sm-4 control-label">Год&nbsp;выпуска</label>
										<div class="col-sm-4">
											<form:select id="releaseYearSelect" path="releaseYear"
												cssClass="form-control" title="Выборка по году выпуска">
												<form:option value="" label="С" />
												<form:options items="${reportSelectionCommand.yearMap}" />
											</form:select>
										</div>
										<div class="col-sm-4">
											<select class="form-control" title="Выборка по году выпуска">
												<option value="" label="По" />
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label">Производитель</label>
										<div class="col-sm-8">
											<form:select id="manufacturerId" path="manufacturerId"
												cssClass="form-control" title="Выборка по производителю">
												<form:option value="0">Все производители</form:option>
												<c:forEach items="${reportSelectionCommand.manufacturerMap}" var="manufacturer">
													<form:option value="${manufacturer.key}" label="${manufacturer.value.name}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div id="data_table_elements" class="form-group">
										<label class="col-sm-4 control-label">Кол.строк:</label>
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
										<input id="sumbit_report" type="button" class="btn btn-primary pull-right"  value="Очистить" />
									</div>	
								</div>
							</div>	
						</div>					
						
						<div id="company_pie" class="col-sm-12 well lform">
							<span>Всего механизмов:</span><c:out value="${reportSelectionCommand.totalMachineCount}"/>	
							<div id="companyReportPie" class="form-group"></div>
						</div>						
					</div>
					<!-- End of Sidebar content-->
	
					<div id = "print" class="col-sm-8">
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
	
						<!-- Таблица отчета -->
						<div class="pull-left">
							<h3 class="page-header">"Количество ПТО" в Компаниях-операторах.</h3>
						</div>
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">Составитель отчета: <span class="report_header">${userModel.firstName} ${userModel.lastName}</span></td>
									<td class="nowrap" rowspan="5" valign="bottom" id="table_Actions"></td>
								</tr>
								<tr>
									<td class="nowrap">Группа: <span class="report_header">${reportSelectionCommand.groupName}</span></td>
								</tr>
								<tr>
									<td class="nowrap">Модель: <span class="report_header">${reportSelectionCommand.modelName}</span></td>
								</tr>
								<tr>
									<td class="nowrap">Год выпуска: <span class="report_header">${reportSelectionCommand.relYearName}</span></td>
								</tr>
								<tr>
									<td class="nowrap">Производитель: <span class="report_header">${reportSelectionCommand.manufactName}</span></td>
								</tr>
							</tbody>
						</table>
						
						<table id="company_report_table" class="table table-striped table-bordered"
							title="Распределение ПТО по Компаниям"  
				    		summary="pieDescription" 
				    		data-attc-createChart="false"
				    		data-attc-colDescription="pieDescription" 
				    		data-attc-colValues="pieValues" 
				    		data-attc-location="companyReportPie" 
				    		data-attc-hideTable="false" 
				    		data-attc-type="pie"
				    		data-attc-controls='{"showHide":false,"create":false,"chartType":false}'>
							<thead>
								<tr>
									<th class="nowrap">№</th>
									<th class="nowrap" id="pieDescription">Компания&nbsp;&nbsp;</th>
									<th class="nowrap" id="pieValues">Кол-во&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
				            	<c:forEach items="${reportSelectionCommand.companyReport}" var="companyReportRow" varStatus="loop">
									<tr>
										<td class="nowrap"><c:out value="${loop.index}"/></td>
										<td class="nowrap"><c:out value="${companyReportRow[0]}"/></td>
										<td class="nowrap"><c:out value="${companyReportRow[1]}"/></td>
									</tr>
						        </c:forEach>
<%-- 								<tr>
									<td class="column-check "></td>
									<td class="column-check "><span style="font-weight: bold;">Всего механизмов:</span></td>
									<td class="column-check "><c:out value="${reportSelectionCommand.totalMachineCount}"/></td>
								</tr> --%>					        
							</tbody>
						</table>
	
					</div>
				</div> <!--End of Report 1-->

			</form:form>
	
		</div>
	</div>
</div>
<!-- Closing div tag for wrap -->

<jsp:include page="common/footer.jsp" />
</body>
</html>