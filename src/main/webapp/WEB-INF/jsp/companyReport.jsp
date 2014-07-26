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
              $('#company_report_table').dataTable({
            	  "dom": 'tlip',
            	  "scrollX": true,
            	  "sPaginationType": "bootstrap",
                  "iDisplayLength": 15,
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                   }  

              });
              $('#company_report_table').attc({
              "controls":{
            	  showHide:false,
            	  create:false,
            	  chartType:false,
            	  },
              "googleOptions":{"is3D":true, "legend":"none"},
              });
              			
		  });
		  </script>
		  <style type="text/css">
			  .alert-info {
				color: black;
				background-color: #d9edf7;
				border-color: #bce8f1;
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
				<div class="row">
	
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
											<select Class="form-control" title="Выборка по году выпуска">
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
								</div>
	
							</div>
							<hr>
							<!--  Кнопочка сформировать отчет -->
							<div class="form-group">	
								<div class="col-sm-12">
									<input id="sumbit_report" type="button" class="btn btn-primary pull-right"  value="Сформировать" />						
								</div>
							</div>
							
							<div id="companyReportPie" class="form-group"></div>
						</div>
						
					</div>
					<!-- End of Sidebar content-->
	
					<div class="col-sm-8">
						<div class="pull-right">
							<h4>
								Составитель отчета: <span id="username">${userModel.firstName}&nbsp;</span>
							</h4>
						</div>
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
							<h3 class="page-header">Отчет 01"По количеству ПТО" в Компаниях-операторах:</h3>
						</div>
						<table id="machine_table" class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td class="column-check "><span style="font-weight: bold;">Группа:&nbsp;</span><br>${reportSelectionCommand.groupName}</td>
									<td class="column-check nowrap"><span style="font-weight: bold;">Модель:&nbsp;</span><br>${reportSelectionCommand.modelName}</td>
									<td class="column-check "><span style="font-weight: bold;">Год выпуска:&nbsp;</span><br>${reportSelectionCommand.relYearName}</td>
									<td class="column-check "><span style="font-weight: bold;">Производитель:&nbsp;</span><br>${reportSelectionCommand.manufactName}</td>
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
									<th class="column-check nowrap">&nbsp;№</th>
									<th class="nowrap" id="pieDescription">Компания&nbsp;&nbsp;</th>
									<th class="nowrap" id="pieValues">Кол-во&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
				            	<c:forEach items="${reportSelectionCommand.companyReport}" var="companyReportRow" varStatus="loop">
									<tr>
										<td class="column-check nowrap"><c:out value="${loop.index}"/></td>
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