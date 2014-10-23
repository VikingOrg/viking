<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ru">
<head>

<title>Отчет по списочному составу Механизмов</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="//www.google.com/jsapi"></script>
		<script type="text/javascript" src="<c:url value="/static/js/vikingGoogleChart.js"/>"></script>
		
		<spring:url var = "action" value='/reportSelection'/>
		<script>
		  var mapLength = "${fn:length(reportSelectionCommand.accountReportMap)}";
		  $(document).ready(function() {
              $('#group_report_table').dataTable({
            	  "sDom": '<"#tableActions"T>t<"#source"l>ip',
            	  "bJQueryUI": true,  
            	  "scrollX" : true,	
            	  "bSort": false,
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                   },  
                   "fnInitComplete": function(oSettings) {
                	   $("#tableActions").appendTo("#table_Actions");
                	   $('select[name="group_report_table_length"]').appendTo("#table_length");
                	   $('select[name="group_report_table_length"]').addClass("form-control");
 	              },
                  tableTools: {
          			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
          		 	"aButtons": [
            	                "copy",
            	             	{
            	                    "sExtends": "print",
      	       	                "fnClick": function (nButton, oConfig) {
      	       	                	oConfig.sMessage = $('#printHeader').html();
      	       	                	this.fnPrint( true, oConfig );
      		       	            },
            	                    "sInfo": "</br>"+
	               	                 "</br>"+
	               	                 "Нажмите ESC для выхода из режима ПЕЧАТИ.",
            	                    
            	                	},
            	            	{
            	                    "sExtends":     "csv",
            	                    "sButtonText": "Save",
            	                    "sCharSet": "utf8",
            	                	}
            	            ]
          	      } 
 	              
              });
			  
			  $("#sumbit_report").click(function(e) {
              	 $('#report_select_form').attr('action', "${action}/accountReport/");
            	 $('#report_select_form').attr('method', "post");
            	 $('#report_select_form').attr('accept-charset', "UTF-8");
            	 showProgressModal('#wait_modal');
            	 $('#report_select_form').submit();
			  });
				
              /*Activate Chart Modal*/
              $('#chartPie').click(function(e){
            	  var myObjArray = [];
            	  var totalCount = 0;
            	  var length = parseInt(mapLength);
            	  
            	  for (var i = 0; i < length; i++) {
                	  var currentCount = $('#countRecord'+i).html();
            		  totalCount = totalCount+ parseInt(currentCount);
            		  myObjArray.push({ name: $('#groupName'+i).text(), count: $('#countRecord'+i).text() });
            	  }
            	  if(totalCount > 0) {
                	  drawGoogleChart(myObjArray, 700, 500,  document.getElementById('chartModalContent'), false, totalCount);
                	  drawGoogleChart(myObjArray, 700, 500,  document.getElementById('barModalContent'), true, totalCount);
                      $('#chartModal').modal('show');                  
                  }            	  
              }); 

		  }); //end of document.ready
		  
	  </script>		  
</head>
<body>
		<!-- Wrap all page content here -->  
<div id="wrap">			
<jsp:include page="common/menu.jsp" />
	<!-- Begin page content -->
	<div class="container-fluid">
<!-- 		<h1 class="page-header">Отчеты.</h1> -->
		<div class="alert alert-info">
			
			<form:form id="report_select_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="${action}" 
								commandName="reportSelectionCommand" method="post" accept-charset="UTF-8">

				<!--Report 1 part 1-->
				<div class="row" style="margin:-15px">
	
					<!--Sidebar content-->
					<div class="col-sm-4 col-md-3 col-lg-3">
	
						<div class="col-sm-12 well lform">
	
							<div class="row">
	
								<div class="col-sm-12">
									<c:set var="isdisabled" value="false" />
									<c:if test="${userModel.role.id != 1}">
										<c:set var="isdisabled" value="true" />
									</c:if>									

									<div class="form-group">
										<label>Компания</label>
										<form:select id="stevidorSelection" path="stevidorId" cssClass="form-control col-sm-12" disabled="${isdisabled}">
											<c:forEach items="${reportSelectionCommand.stevidorMap}" var="stevidor">
												<form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
											</c:forEach>
										</form:select>
									</div>		
									<div class="form-group">
										<label>Группа</label>
										<form:select id="groupSelect" path="groupId" cssClass="form-control col-sm-12">
											<form:option value="0" >Все группы</form:option>
											<c:forEach items="${reportSelectionCommand.groupMap}" var="group">
												<form:option value="${group.key}" label="${group.value.name}" />
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
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-group pull-right">
								
									<!--  Кнопочка сформировать отчет -->
									<button id="sumbit_report" class="btn btn-primary">Сформировать</button>
								</div>	
							</div>
						</div>	
					</div>
				</div>
					<!-- End of Sidebar content-->
	
					<div class="col-sm-8 col-md-9 col-lg-9">
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
	
	
						<div id="printHeader">
						<!-- Таблица отчета -->
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">
											<h3 class="page-header">Отчет "Список Механизмов"</h3>
									</td>
								</tr>
							</tbody>
						</table>
						<table id="machine_table" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">Составитель отчета: <span class="report_header">${userModel.firstName} ${userModel.lastName}</span></td>
									<td class="nowrap" rowspan="5" valign="bottom" id="table_Actions">
									    <%--
	                     	 			<a href="#" class="btn btn-warning pull-right" id="chartPie" style="height:25px; font-size:12px; text-decoration:none;">
	                     	 				 Диаграмма<i class="fa fa-bar-chart-o" style="padding-left: 15px"></i>
	                      			    </a>
	                      			     --%>
									</td>
								</tr>
								<tr>
									<td class="nowrap">Компания: <span id="title_company" class="report_header">${reportSelectionCommand.companyName}</span></td>
								</tr>
								<tr>
									<td class="nowrap">Группа: <span id="title_group" class="report_header">${reportSelectionCommand.groupName}</span></td>
								</tr>
							</tbody>
						</table>
						</div>
						<table id="group_report_table" class="table table-bordered">
							<thead class= "tablehead">
								<tr>
									<th class="nowrap">Модель</th>
									<th class="nowrap">Характеристики</th>
									<th class="nowrap">Производитель</th>
									<th class="nowrap">Инвентарный номер</th>
									<th class="nowrap">Дата ввода</th>
									<th class="nowrap">Заводской №</th>
									<th class="nowrap">Место установки</th>
								</tr>
							</thead>
							<tbody>
					            <c:forEach items="${reportSelectionCommand.accountReportMap}" var="accountReport" varStatus="loop">
									<tr>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">
											<span id="groupName${loop.index}"><c:out value="${accountReport.key[0]}"/></span>
											<br>
											<span style="font-weight: normal; float:left;" >
												Всего по группе: <span id="countRecord${loop.index}"><c:out value="${accountReport.key[1]}"/></span>
											</span>
										</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
										<td class="nowrap" style="background-color:#DDEDCC; font-weight: bold;">&nbsp;</td>
									</tr>
									<c:forEach items="${accountReport.value}" var="machine">
										<tr>
											<td class="nowrap"><c:out value="${machine.machineModel.name}"/></td>
											<td class="nowrap"><c:out value="${machine.machineModel.details}"/></td>
											<td class="nowrap"><c:out value="${machine.machineModel.manufacturer.nameRus}"/></td>
											<td class="nowrap"><c:out value="${machine.inventoryNumb}"/></td>
											<td class="nowrap"><c:out value="${machine.startDate}"/></td>
											<td class="nowrap"><c:out value="${machine.factoryNumb}"/></td>
											<td class="nowrap"><c:out value="${machine.location}"/></td>
										</tr>
									</c:forEach>					            
				                </c:forEach>						
							</tbody>
						</table>
	
					</div>
				</div> <!--End of Report 1-->
			</form:form>
	
		</div>
	</div>
</div>
<!-- Closing div tag for wrap -->

	<!--  Chart Modal -->
	<div id="chartModal" class="modal modal-wide fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрыть</span></button>
	        <h3 class="modal-title page-header" id="myModalLabel">Диаграмма <strong></strong></h3>
	      </div>
	      <div class="modal-body">
	        <div class="col-sm-6">
	            	<div id="chartModalContent"></div>
	        </div>
	        <div class="col-sm-6">
					<div id="barModalContent"></div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="cancelbtn" data-dismiss="modal">Закрыть</button>
	      </div>
	    </div>
	  </div>
	</div>


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

<jsp:include page="common/footer.jsp" />
</body>
</html>