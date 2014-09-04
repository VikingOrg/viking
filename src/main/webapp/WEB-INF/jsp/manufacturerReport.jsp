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
<title>Отчет по количеству Механизмов разных Производителей</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="//www.google.com/jsapi"></script>
		
		<spring:url var = "action" value='/reportSelection'/> 

		<script>
		  var jsonData={};
		  $(document).ready(function() {
			  oTable = $('#account_report_table').dataTable({
            	  "bJQueryUI": true,
            	  "sPaginationType": "full_numbers",                  
            	  "sDom": '<"#tableActions"T>t<"#source"l>ip',
                  "oLanguage": {
                      "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                  },
                  "aoColumns": [
                                 { "mDataProp": "manufacturerId" },
                                 { "mDataProp": "name" },
                                 { "mDataProp": "count" },
                                 { "mDataProp": "math" }
                               ],                       
                  "fnInitComplete": function(oSettings) {
                	   $("#tableActions").appendTo("#table_Actions");
                	   $('select[name="account_report_table_length"]').appendTo("#table_length");
                	   $('select[name="account_report_table_length"]').addClass("form-control");
                	   getReport();
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

              $('#submitReport').click(function(e) {
            		e.preventDefault();
            		getReport();
              });

              /*Activate Chart Modal*/
              $('#chartPie').click(function(e){
            	  drawGoogleChart(jsonData, 700, 500,  document.getElementById('chartModalContent'), false);
            	  drawGoogleChart(jsonData, 700, 500,  document.getElementById('barModalContent'), true);
                  $('#chartModal').modal('show');                  
              });    	
              			
		  }); // end of document.ready

		  function getReport(){
      		$('#divErrorMessage').attr("class","alert alert-danger hide");
    		showProgressModal('#wait_modal');
    		oTable.fnClearTable();
    		var pageData =  $("#report_select_form").serialize();
  		    $.getJSON("${pageContext.request.contextPath}/reportSelection/getManufacturerReport/", pageData, function (data) {
	  			if (data.length != 0 ) {
	  				jsonData = data;
	  				oTable.fnAddData(data);
	  			}
	  			setReportTitle();
	  			closeProgressModal('#wait_modal');
			}).fail( function(d, textStatus, error) {
	  	        console.error("getJSON failed, status: " + textStatus + ", error: "+error);
	  	        closeProgressModal('#wait_modal');
	  	        $('#divErrorMessage').attr("class","alert alert-danger show");
  	        });			  
		  }
		  
		  function setReportTitle() {
			   $('#title_company').html($("#stevidorSelect option:selected").text());
			   $('#title_group').html($("#groupSelect option:selected").text());
			   $('#title_model').html($("#modelSelect option:selected").text());
			   $('#title_year').html($("#releaseStartYearSelect option:selected").text()+"-"+$("#releaseEndYearSelect option:selected").text());
		  }

		  /*google lib should be loaded along the page..*/	
		  google.load('visualization', '1.0', {'packages':['corechart']});
		  
		  /*Get chart to draw.*/
		  function drawGoogleChart(chartData, width, height, htmlElement, isBarChart) {
			chartData = chartData.sort(function(obj1, obj2) {
				return obj2.count - obj1.count;
			});
	       	var totalCount = 0;
            $.each(chartData, function (i, e) {
            	  totalCount = totalCount + e.count;
            });			  
			  
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	        /*Getting max number of iterations*/
	        var maxIteration = 7;
	        if (chartData.length < 8) {
	        	maxIteration = chartData.length; 
		    }
		    var usedCount = 0;
	        for (var i = 0; i < maxIteration; i++) {
		        data.addRows([
		        	          [chartData[i].name, chartData[i].count],
		        	        ]);
		        usedCount = usedCount + chartData[i].count;	        
    	    }
	        /*Others*/
	        var others = totalCount - usedCount;
	        data.addRows([
	        	          ['Остальные', others]
	        	        ]);	  

	        if(!isBarChart) {
	        	 // Set chart options
		        var options = {
				  'title':'Общее кол-во:'+totalCount,
				  'is3D':true,
				  'colors':['#3366cc','#dc3912', '#ff9900','#109618', '#990099','#0099c6', '#dd4477','#66aa00'],
				  'chartArea':{left:0,top:0,width:'70%',height:'100%'},
				  'width':'500',
				  'height':'400',
				  'pieSliceTextStyle':{color: 'black'},
				  'backgroundColor':'none',
				};
		        // Instantiate and draw our chart, passing in some options.
		        var chart = new google.visualization.PieChart(htmlElement);
		        chart.draw(data, options);
		    } else {
		    	 // Set chart options
		        var options = {
				  'title':'Общее кол-во:'+totalCount,
				  'colors':['red','blue','red','blue','red','blue','red','blue'],
				  'chartArea':{left:300,top:0,width:'100%',height:'90%'},
				  'width':'500',
				  'height':'400',
				};
		    	var chart = new google.visualization.BarChart(htmlElement);
		    	chart.draw(data, options);
			}
	      }
						  
	  </script>
		  
</head>
<body>
		<!-- Wrap all page content here -->  
<div id="wrap">			
<jsp:include page="common/menu.jsp" />
	<!-- Begin page content -->
	<div class="container-fluid">
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
										<label>Кол.строк:</label>
										<div id="table_length"></div>					
									</div>
								</div>
	
							</div>
							
						</div>
						
						
						<!--  Кнопочка сформировать отчет -->
						<div class="col-sm-12 well lform">
							<div class="row">
								<div class="col-sm-12">
									<div class="btn-group pull-right">
										<!--  Кнопочка сформировать отчет -->
										<!--  <button id="" class="btn cancelbtn"><span class="glyphicon glyphicon-refresh"></span> </button> -->
										<button id="submitReport" class="btn btn-primary">Сформировать</button>
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
										<h3 class="page-header">Отчет 03 "Кол-во Механизмов разных Производителей"</h3>
									</td>
								</tr>
							</tbody>
						</table>
						<table id="machine_table" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">Составитель отчета: <span class="report_header">${userModel.firstName} ${userModel.lastName}</span></td>
									<td class="nowrap" rowspan="5" valign="bottom" id="table_Actions">
	                     	 			<a href="#" class="btn btn-warning pull-right" id="chartPie" style="height:25px; font-size:12px; text-decoration:none;">
	                     	 				 Диаграмма<i class="fa fa-bar-chart-o" style="padding-left: 15px"></i>
	                      			    </a>									
									</td>
								</tr>
								<tr>
									<td class="nowrap">Компания:<span id="title_company" class="report_header">Все компании</span></td>
								</tr>
								<tr>
									<td class="nowrap">Группа:<span id="title_group" class="report_header">Все группы</span></td>
								</tr>
								<tr>
									<td class="nowrap">Модель:<span id="title_model" class="report_header">Все модели</span></td>
								</tr>
								<tr>
									<td class="nowrap">Год выпуска:<span id="title_year" class="report_header">Все года</span></td>
								</tr>
							</tbody>
						</table>
						</div>
						
						<table id="account_report_table" class="table table-striped table-bordered"
							title="Распределение ПТО по Производителям"  
				    		summary="pieDescription" 
				    		data-attc-createChart="false"
				    		data-attc-colDescription="pieDescription" 
				    		data-attc-colValues="pieValues" 
				    		data-attc-location="groupReportPie" 
				    		data-attc-hideTable="false" 
				    		data-attc-type="pie"
				    		data-attc-controls='{"showHide":false,"create":false,"chartType":false}'>
							<thead class= "tablehead">
								<tr>
									<th class="column-check">&nbsp;№</th>
									<th class="nowrap">Производитель&nbsp;&nbsp;</th>
									<th class="nowrap">Кол-во&nbsp;&nbsp;</th>
									<th class="nowrap" style="width:20%">Проц.</th>
								</tr>
							</thead>
							
							<tbody>
								<%--
				            	<c:forEach items="${reportSelectionCommand.manufacturerReportLsit}" var="manufacturerReport" varStatus="loop">
									<tr>
										<td class="column-check nowrap"><c:out value="${manufacturerReport.manufacturerId}"/></td>
										<td class="nowrap" id="pieDescription"><c:out value="${manufacturerReport.name}"/></td>
										<td class="nowrap" id="pieValues"><c:out value="${manufacturerReport.count}"/></td>
									</tr>
						        </c:forEach>
						         --%>
							</tbody>
						</table>
	
					</div>
				</div> <!--End of Report 1-->
				
			</form:form>
	
		</div>
	</div>
</div>
	<!--  Chart Modal -->
	<div id="chartModal" class="modal modal-wide fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрыть</span></button>
	        <h3 class="modal-title page-header" id="myModalLabel">Диаграмма <strong>"Кол-во Механизмов в Компаниях-операторах"</strong></h3>
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
<!-- Closing div tag for wrap -->
<jsp:include page="common/progressModal.jsp" />
<jsp:include page="common/footer.jsp" />
</body>
</html>