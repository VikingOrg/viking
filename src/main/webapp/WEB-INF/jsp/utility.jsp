<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>УЖАС</title>
<link href="<c:url value="/static/css/flot.css"/>" rel="stylesheet" type="text/css">
	<style type="text/css">

	.demo-container {
		position: relative;
		height: 400px;
	}

	#placeholder {
		width: 550px;
	}

	#menu {
		position: absolute;
		top: 20px;
		left: 625px;
		bottom: 20px;
		right: 20px;
		width: 200px;
	}

	#menu button {
		display: inline-block;
		width: 200px;
		padding: 3px 0 2px 0;
		margin-bottom: 4px;
		background: #eee;
		border: 1px solid #999;
		border-radius: 2px;
		font-size: 16px;
		-o-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
		-ms-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
		-moz-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
		-webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
		box-shadow: 0 1px 2px rgba(0,0,0,0.15);
		cursor: pointer;
	}
	</style>
	
		<jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
		
	
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#group_table').dataTable( {
        	        "bJQueryUI": true,
        	        "sDom": '<"#tableActions"T><r>t<"#source"l><"F"ip>',
        	        "sPaginationType": "full_numbers",
        	        "bProcessing": true,
        	        "responsive": false,
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
                    	   $("#tableActions").appendTo("#table_Actions");
	                	   $('select[name="group_table_length"]').appendTo("#table_length");
	                	   $('select[name="group_table_length"]').addClass("form-control");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });

                $('#closeFilters').on('click', function(e) {
                    e.preventDefault();

                    //$('#toggleOne').animate({
                    //    "width": "0%"
                    //}, "slow", function() {
                        // Hide when width animation finishes
                   //     $(this).hide();
                   //     $('#toggleTwo').toggleClass('col-sm-12 col-sm-8')
                   // });
                    
                    //$('#toggleOne').toggleClass('col-sm-0 col-sm-4');
                    //$('#toggleTwo').toggleClass('col-sm-12 col-sm-8');

                                        
                    //var $lefty = $('#toggleOne');
                    //$lefty.animate({
                    //  left: parseInt($lefty.css('left'),10) == 0 ?
                    //    -$lefty.outerWidth() :
                    //    0
                    //});
                    //$('#toggleOne').animate({width: 'toggle'});                    
                    //$('#toggleTwo').toggleClass('col-sm-12 col-sm-8')

                });
                   		 
            }); //end of document.ready

           
        </script>
        
	</head>
	
	<body>
	
	<!-- Wrap all page content here -->  
	<div id="wrap">	
	
	<jsp:include page="common/menu.jsp" />

    <!----- Begin page content ------>
	<div class="container-fluid">
	
		<form:form id="group_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="groupSearch"
			commandName="utilityCommand" method="post" accept-charset="UTF-8">
			<div class="row">
	
				<!--Sidebar content-->
				<div id="toggleOne" class="col-sm-4 col-md-3 col-lg-3">
					<div class="col-sm-12 well lform">
						<div class="row">
							<div class="col-sm-12">
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
							<div class="row" style="margin-left:-25px; margin-right:-25px;">	
							<!--  Операции с данными в таблице -->
								<div class="col-sm-12">
									<div class="form-group">
										<a id="addNewGroup" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>Добавить</a>
										<span class="pull-right">&nbsp;</span>
										<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
									</div>
								</div>
							</div>
					</div>
				</div>
				<!-- End of Sidebar content--><!-- End of Sidebar content--><!-- End of Sidebar content--><!-- End of Sidebar content-->
				
				<div id="toggleTwo" class="col-sm-8 col-md-9 col-lg-9">
	
					<!-- Start table content -->
					<!-- Таблица со списком Групп Механизмов -->
					
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap"><span class="report_header">
										<h3 class="page-header">Список Ужасных Утилит!</h3>
										</span></td>
									<td class="nowrap hidden-xs" valign="bottom" id="table_Actions"></td>
								</tr>
							</tbody>
						</table>					
					<table id="group_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check nowrap">№&nbsp;</th>
								<th class="nowrap">Группа&nbsp;&nbsp;</th>
								<th class="nowrap">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="group" varStatus="loop" items="${utilityCommand.groupList}">
								<tr id="${group.groupId}">
									<td class="column-check nowrap">
										<c:out value="${group.groupId}"/>
										<%--<form:checkbox path="groupList[${loop.index}].archived" value="Y"></form:checkbox> --%>
									</td>
									<td class="nowrap">
										<a href="#" rel="tableRowEdit" data-param1="${group.groupId}">
							            	<span id="name${group.groupId}"><c:out value="${group.name}"/></span>
							            </a>
									</td>
									<td class="nowrap">
										<span id="note${group.groupId}"><c:out value="${group.groupNote}"/></span>
									</td>
								</tr>
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