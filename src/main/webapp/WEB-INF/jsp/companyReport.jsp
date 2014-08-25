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
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="//www.google.com/jsapi"></script>
		
		
		<spring:url var = "action" value='/reportSelection'/> 
		<script>
		  $(document).ready(function() {

              oTable = $('#company_report_table').dataTable({
            	  "bJQueryUI": true,
            	  "sPaginationType": "full_numbers",
            	  "sDom": '<"#tableActions"T>t<"#source"l>ip',
            	  "responsive": false,
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                   },
                   "aoColumns": [
                                 { "mDataProp": "stevidorId" },
                                 { "mDataProp": "name" },
                                 { "mDataProp": "count" }
                               ],                   
                  "fnInitComplete": function(oSettings) {
                	   $("#tableActions").appendTo("#table_Actions");
                	   $('select[name="company_report_table_length"]').appendTo("#table_length");
                	   $('select[name="company_report_table_length"]').removeClass( "form-control input-sm" ).addClass("form-control");
                	  /*  var rowCount = $('#company_report_table tr').length;	    
                	   if(rowCount > 2) { 
                		   $("#table_length").addClass("col-sm-8");*/
                		   $("#company_pie").removeClass("hidden");
                		   $("#data_table_elements").removeClass("hidden");            		    
                	  /*  } else {
                		   $("#table_length").addClass("col-sm-8 hidden");
                		   $("#company_pie").addClass("hidden");
                		   $("#data_table_elements").addClass("hidden");
                	   } */
                	   $("div.toolbar").html('<b>Custom tool bar! Text/images etc.</b>');
                	   
	              },
                  tableTools: {
             			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
             		 	"aButtons": [
               	                "copy",
               	             	{
               	                    "sExtends": "print",
               	                    
               	                    "sMessage": "<div class=container-fluid style=margin-left:35px><h3 class=page-header>Кол-во Механизмов в Компаниях-операторах</h3>"+
               	                    "</br>"+
                   	                "Составитель отчета: "+
               	                    "</br>"+
               	                    "Группа:"+
               	                    "</br>"+
               	                    "Модель: "+
            	                    "</br>"+
            	                    "Год выпуска:"+
            	                    "</br>"+
            	                    "Производитель:"+
            	                    "</br></div>",
            	                    
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

              //oTable.fnAdjustColumnSizing();

              $("#submit_report").click(function(e) {
              		e.preventDefault();
              		$('#divErrorMessage').attr("class","alert alert-danger hide");
              		showProgressModal('#wait_modal');
              		oTable.fnClearTable();
              		var pageData =  $("#report_select_form").serialize();
            		$.getJSON("${pageContext.request.contextPath}/reportSelection/getCompanyReport/", pageData, function (data) {
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
                	 	
		  }); //end of document.ready

		   function setReportTitle() {
			   //$('#title_group').html($('#groupSelect').children(':selected'));manufacturerId
			   $('#title_group').html($("#groupSelect option:selected").text());
			   $('#title_model').html($("#modelSelect option:selected").text());
			   $('#title_year').html($("#releaseStartYearSelect option:selected").text()+"-"+$("#releaseEndYearSelect option:selected").text());
			   $('#title_manufacturer').html($("#manufacturerSelect option:selected").text());
			}			

		      // Load the Visualization API and the piechart package.
		      google.load('visualization', '1.0', {'packages':['corechart']});

		      // Set a callback to run when the Google Visualization API is loaded.
		      google.setOnLoadCallback(drawChart);

		      // Callback that creates and populates a data table,
		      // instantiates the pie chart, passes in the data and
		      // draws it.
		      function drawChart() {

		        // Create the data table.
		        var data = new google.visualization.DataTable();
		        data.addColumn('string', 'Topping');
		        data.addColumn('number', 'Slices');
		        data.addRows([
		          ['Mushrooms', 3],
		          ['Onions', 1],
		          ['Olives', 1],
		          ['Zucchini', 1],
		          ['Pepperoni', 2]
		        ]);

		        // Set chart options
		        var options = {
				  'legend':'bottom',
				  'title':'Общее кол-во:',
				  'is3D':true,
				  'width':300,
				  'height':300,
				  'backgroundColor':'none',
				};

		        // Instantiate and draw our chart, passing in some options.
		        var chart = new google.visualization.PieChart(document.getElementById('companyReportChart'));
		        chart.draw(data, options);

		        
		      }  
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

									<div class="form-group">
										<label>Компания</label>
										<div class="multiple_select">
											<span class="checkbox nowrap">
												<form:checkbox path="stevidorSelection" value="0" cssClass="newCheckbox"/>Все компании<br/>
											</span>	
										
											<c:forEach var="stevidor" items="${reportSelectionCommand.stevidorMap}">
											    <span class="checkbox nowrap">
											    	<form:checkbox path="stevidorSelection" value="${stevidor.key}" cssClass="newCheckbox"/>(${stevidor.value.stevidorId}) ${stevidor.value.fullName}<br/>
											    </span>
											</c:forEach>
										</div>
									</div>							
<%--
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
--%>																
									<div class="form-group">
										<label>Группа</label>
											<form:select id="groupSelect" path="groupId" cssClass="form-control col-sm-12">
												<form:option value="0" >Все группы</form:option>
												<c:forEach items="${reportSelectionCommand.groupMap}" var="group">
													<form:option value="${group.key}" label="${group.value.name}" />
												</c:forEach>
											</form:select>
									</div>
						        	<div class="form-group">
					                    <label>Модель</label>
											<form:select id="modelSelect" path="modelId" cssClass="form-control col-sm-12">
												<form:option value="0">Все модели</form:option>
								                <c:forEach items="${reportSelectionCommand.machineModelMap}" var="model">
								                    <form:option value="${model.key}" label="${model.value.name}" />
								                </c:forEach>									
											</form:select>
						        	</div>
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
							<div class="row">
								<div class="col-sm-12">
									<div class="btn-group pull-right">
										<!--  Кнопочка сформировать отчет -->
										<button id="" class="btn cancelbtn" title="Сброс"><i class="fa fa-refresh"></i></button>
										<button id="submit_report" class="btn btn-primary">Сформировать</button>
									</div>	
								</div>
							</div>	
						</div>				 
						
						<div id="company_pie" class="col-sm-12 well lform" style="padding:0px;">
							<div class="row" style="padding-left: 0px;margin:0px 0px 0 0">
								<div class="button-group pull-left">
										<button class="chartselect-pie" title="Круговая"><i class="fa fa-adjust"></i></button>
										<button class="chartselect-bar" title="Столбцы"><i class="fa fa-bar-chart-o"></i></button>
								</div>
								<!-- <div class="col-sm-4" style="padding: 2px 0 0 2px;">
									<select class="form-control">
									  <option>Круговая</option>
									  <option>Столбцы</option>
									</select>
								</div> -->
								<div class="col-sm-2 pull-right" style="padding-right: 0px;">
										<button class="unfoldbtn" data-toggle="modal" data-target="#unfoldChart" title="Развернуть"><i class="fa fa-external-link"></i></button>
								</div>
							</div>
							<%-- <span>Всего механизмов:</span><c:out value="${reportSelectionCommand.totalMachineCount}"/>	 --%>
							<div id="companyReportChart"></div>
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
						<div id="divErrorMessage" class="alert alert-danger hide">
							<span id="errorMessage">Произошла ошибка во время формирования отчета!</span>
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
							
						<!-- Таблица отчета -->
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">
										<h3 class="page-header">Отчет 01 "Кол-во Механизмов в Компаниях-операторах"</h3>
									</td>
									
								</tr>
							</tbody>
						</table>
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">Составитель отчета: <span class="report_header">${userModel.firstName} ${userModel.lastName}</span></td>
									<td class="nowrap" rowspan="5" valign="bottom" id="table_Actions"></td>
								</tr>
								<tr>
									<td class="nowrap">Группа: <span id="title_group" class="report_header">Все группы.</span></td>
								</tr>
								<tr>
									<td class="nowrap">Модель: <span id="title_model" class="report_header">Все модели.</span></td>
								</tr>
								<tr>
									<td class="nowrap">Год выпуска: <span id="title_year" class="report_header">Все года</span></td>
								</tr>
								<tr>
									<td class="nowrap">Производитель: <span id="title_manufacturer" class="report_header">Все производители</span></td>
								</tr>
							</tbody>
						</table>
						<!-- <div class="mygrid-wrapper-div">  -->
						<table id="company_report_table" class="table table-striped table-bordered">
							<thead class="tablehead">
								<tr>
									<th class="column-check">№</th>
									<th class="nowrap">Компания&nbsp;&nbsp;</th>
									<th class="nowrap">Кол-во&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<%--
				            	<c:forEach items="${reportSelectionCommand.companyReportList}" var="companyReport" varStatus="loop">
									<tr>
										<td class="nowrap"><c:out value="${companyReport.stevidorId}"/></td>
										<td class="nowrap"><c:out value="${companyReport.name}"/></td>
										<td class="nowrap"><c:out value="${companyReport.count}"/></td>
									</tr>
						        </c:forEach>
 								--%>
			        
							</tbody>
						</table>
					<!-- 	</div>  -->
					</div>
				</div> <!--End of Report 1-->
				<!-- 		Модальное окно ожидания загрузки данных -->
				<jsp:include page="common/progressModal.jsp" />
				
					<!--   Модальное окно  разворачивания диаграммы-->
					<div class="modal fade" id="#unfoldChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					        <h4 class="modal-title" id="myModalLabel">Кол-во Механизмов в Компаниях-операторах</h4>
					      </div>
					      <div class="modal-body">
					        <div id="companyReportChart"></div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="cancelbtn" data-dismiss="modal">Закрыть</button>
					      </div>
					    </div>
					  </div>
					</div>
			</form:form>
	
		</div>
	</div>
</div>
<!-- Closing div tag for wrap -->

		
<jsp:include page="common/footer.jsp" />
</body>
</html>
