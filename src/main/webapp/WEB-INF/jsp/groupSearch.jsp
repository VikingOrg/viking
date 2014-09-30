<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Групп Механизмов</title>
		<jsp:include page="common/headCoreElements.jsp" />
        
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
    				  
            	var oTable = $('#group_table').dataTable( {
       	           "columnDefs": [
                		               {
                		                   "targets": [ 0 ],
                		                   "visible": false
                		               },
                	],
        	        "bJQueryUI": false,
        	        "sDom": '<"#tableActions"T><r>t<"#source"l><"F"ip>',
        	        "sPaginationType": "full_numbers",
        	        "responsive": false,
        	        "bSort": false,
                	tableTools: {
             			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
             		 	"aButtons": [
               	                "copy",
               	             	{
               	                    "sExtends":     "print",
                  	                 "sInfo": "</br>"+
                   	                 "</br>"+
                   	                 "Нажмите ESC для выхода из режима ПЕЧАТИ.",
               	                    "bHeader": true,
               	                	},
               	            	{
               	                    "sExtends":     "csv",
               	                    "sButtonText": "Save",
               	                    "bHeader": true,
               	                	}
               	            ]
             	   },
                    "oLanguage": {
                        "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                     },
                     "fnInitComplete": function(oSettings) {
	                	   $('select[name="group_table_length"]').appendTo("#table_length");
	                	   $('select[name="group_table_length"]').addClass("form-control");
                   	   	   $("#tableActions").appendTo("#table_Actions");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });


                $("a[rel^='tableRowEdit']").click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/group/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#groupEditModalContent").html(response.responseText);
                            $('#groupEditModal').modal('show');
                            
                        }
                    });
                });

                $('#addNewGroup').click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/group/createNew/', {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#groupEditModalContent").html(response.responseText);
                            $('#groupEditModal').modal('show');
                        }
                    });
                });

                $("#dataTableSearch").focus();
                $('#dataTableSearch').keypress(function (ev) {
                    var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                    if (keycode == '13') {
                    	ev.preventDefault();
                    	return false;
                        //fnc.call(this, ev);
                    }
                });        

    			$("#changesFrom").datepicker({
    					dateFormat: "dd.mm.yy", firstDay: 1, dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ],
    				 	monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],		
    				  	onSelect: function(dataPickerDate) {
    				  	    $.fn.dataTableExt.afnFiltering.push(
    				  	        function(oSettings, aData, iDataIndex) {
    				  	           var tableDate = aData[3].substring(6,10) + aData[3].substring(3,5)+ aData[3].substring(0,2);
    	        	  	           var fromDate  = dataPickerDate.substring(6,10) + dataPickerDate.substring(3,5)+ dataPickerDate.substring(0,2);
    	        	  	           if (tableDate >= fromDate) {
    				  	        	 return true;
    					  	       }
    				  	           return false;
    				  	        }

    				  	    );
    				  	    //Update table
    				  	     oTable.fnDraw();
    				  	     //Deleting the filtering function if we need the original table later.
    				  	    $.fn.dataTableExt.afnFiltering.pop();
    				  }
    			});                         		 
            } ); //end of document.ready

        	function closingModal(groupId, successMsg){
        		$('#groupEditModal').modal('hide');
        		$('#'+groupId).addClass( "success" );
        		$(this).attr("class","newclass");
        		$('#success_alert').attr("class","alert alert-success");
        		$("#success_alert_message").html(successMsg);
            }
            
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
	<div class="container-fluid">
	
		<form:form id="group_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="groupSearch"
			commandName="groupCommand" method="post" accept-charset="UTF-8">
			<div class="row">
	
				<!--Sidebar content-->
				<div class="col-sm-4 col-md-3 col-lg-3">
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
			 
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							
								<div class="form-group">
				                    <label>Внесенные изменения</label>
				                    <div class="input-group pull-right">
										<span class="date-range-label">С</span>
										<input class="date-range" type="text" id="changesFrom" data-date-format="dd.mm.yyyy" placeholder="01.01.2014">
									</div>
	                    		</div>	
							</sec:authorize>
							</div>
						</div>
					</div>
					<div class="col-sm-12 well lform">
							<div class="row" style="margin-left:-25px; margin-right:-25px;">	
							<!--  Операции с данными в таблице -->
								<div class="col-sm-12">
										<a id="addNewGroup" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
										<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
								</div>
							</div>
					</div>
				</div>
				<!-- End of Sidebar content-->
				<div class="col-sm-8 col-md-9 col-lg-9">
	
					<!-- Start table content -->
	
					<!--  Вывод сообщений и предупреждений  -->
					<c:if test="${not empty message}">
						<div id="success" class="alert alert-success show">
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
					
					<div id="success_alert" class="alert alert-success hidden">
						<span id="success_alert_message"></span>
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
	
					<!-- Таблица со списком Групп Механизмов -->
					<table id="company_header" class="table_report_header">
						<tbody>
							<tr>
								<td class="nowrap">
									<h3 class="page-header">Список Групп Механизмов</h3>
								</td>
								<td class="nowrap" id="table_Actions"></td>
							</tr>
						</tbody>
					</table>
					<table id="group_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check">№&nbsp;</th>
								<th class="">Группа&nbsp;&nbsp;</th>
								<th class="">Примечания&nbsp;&nbsp;</th>
								<th class="">Посл. изм.</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="group" varStatus="loop" items="${groupCommand.groupList}">
								<tr id="${group.groupId}">
									<td class="column-check">
										<c:out value="${group.groupId}"/>
										<%--<form:checkbox path="groupList[${loop.index}].archived" value="Y"></form:checkbox> --%>
									</td>
									<td class="">
										<a href="#" rel="tableRowEdit" data-param1="${group.groupId}">
							            	<span id="name${group.groupId}"><c:out value="${group.name}"/></span>
							            </a>
									</td>
									<td class="">
										<span id="note${group.groupId}"><c:out value="${group.groupNote}"/></span>
									</td>
		                         	<td class="">
		                         		<spring:eval expression="group.updateDate" />
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


<div id="groupEditModal" class="modal modal-wide fade" tabindex="-1">
  <div class="modal-dialog">
    <div id="groupEditModalContent" class="modal-content">
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->			
	

</body>
</html>