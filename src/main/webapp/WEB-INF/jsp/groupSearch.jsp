<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Групп Механизмов</title>
		<jsp:include page="common/headCoreElements.jsp" />
		
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
	                	   $('select[name="group_table_length"]').appendTo("#table_length");
	                	   $('select[name="group_table_length"]').addClass("form-control");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });


                $("a[rel^='tableRowEdit']").click(function(e){

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
                   		 
            } );

        	function closingModal(groupId){
        		$('#groupEditModal').modal('hide');
        		$('#'+groupId).addClass( "success" );
            }
    
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
	<div class="container">
	
		<form:form id="group_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="groupSearch"
			commandName="groupCommand" method="post" accept-charset="UTF-8">
			<div class="row">
	
				<!--Sidebar content-->
				<div id = "limit_width" class="col-sm-4">
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
				<!-- End of Sidebar content-->
				<div id = "#max_width" class="col-sm-8">
	
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
	
	
					<!-- Таблица со списком Групп Механизмов -->
					<h3 class="page-header">Список Групп Механизмов</h3>
					<table id="group_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check nowrap">№&nbsp;</th>
								<th class="nowrap">Группа&nbsp;&nbsp;</th>
								<th class="nowrap">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="group" varStatus="loop" items="${groupCommand.groupList}">
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


<div id="groupEditModal" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div id="groupEditModalContent" class="modal-content">
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->			
	

</body>
</html>