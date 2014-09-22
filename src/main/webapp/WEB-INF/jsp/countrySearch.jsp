<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Стран</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
	    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>

		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#country_table').dataTable( {
			   	           "columnDefs": [
			          		               {
			          		                   "targets": [ 0 ],
			          		                   "visible": true
			          		               },
          		           ],          
            	            "scrollX": true,
                	        "sDom": '<"#tableActions"T>t<"#source"l>ip',
                   	        "sPaginationType": "full_numbers",
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
         	                	   $('select[name="country_table_length"]').appendTo("#table_length");
         	                	   $('select[name="country_table_length"]').addClass("form-control");
                           	   	   $("#tableActions").appendTo("#table_Actions");
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

                /*Edit logic below.*/
                $("a[rel^='tableRowEdit']").click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/country/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#editModalContent").html(response.responseText);

                            $('#editModal').modal('show');
                            
                        }
                    });
                });

                $('#addNew').click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/country/createNew/', {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#editModalContent").html(response.responseText);
                            $('#editModal').modal('show');
                        }
                    });
                });

                $('#editModal').on('shown.bs.modal', function() {
                    //$('#loginForm').bootstrapValidator('resetForm', true);
                    // Focus on the username field
                    //$('#loginForm').find('[name="username"]').focus();
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
                
            } ); //end of document.ready

            function closingModal(groupId, successMsg){
        		$('#editModal').modal('hide');
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
		  
			<form:form id="country_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="countrySearch" commandName="countryCommand" method="post" accept-charset="UTF-8">
			   <div class="row">
				    <!--Sidebar content-->
					<div class="col-sm-4 col-md-3 col-lg-3">
						<div class="col-sm-12 well lform">
							<div class="row">
								<div class="col-sm-12">	
									<div class="form-group">
					                    <label>Поиск</label>
					                    <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text"/>
								    </div>
								</div>
							 </div>
							 
							<div class="form-group">
									<label>Кол.строк:</label>
									<div id="table_length"></div>					
							</div>
						</div>
						<div class="col-sm-12 well lform">
							<div class="row">	
			                    <!--  Операции с данными в таблице -->
			                    <div class="col-sm-12">
			                            <a id="addNew" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
			                            <a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
		                        </div>
							</div>
						</div>
					</div>
				    <!-- End of Sidebar content-->	
				
					<div class="col-sm-8 col-md-9 col-lg-9">
		                    
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
						
						<!-- Таблица со списком стран -->
						<table id="company_header" class="table_report_header">
							<tbody>
								<tr>
									<td class="nowrap">
										<h3 class="page-header">Список стран</h3>
									</td>
									
									<td class="nowrap" id="table_Actions"></td>
								</tr>
							</tbody>
						</table>
	                    <table id="country_table" class="table table-bordered table-striped">
	                    	 <thead>
	                              <tr>
		                              <th class="column-check">&nbsp;</th>
		                              <th class="nowrap">Страна (RUS)</th>
		                              <th class="hidden-sm hidden-xs nowrap">Страна (ENG)</th>
		                              <th class="hidden-sm hidden-xs nowrap">Примечания</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                          	<c:forEach var="country" varStatus="loop" items="${countryCommand.countryList}" >
		                            <tr id="${country.countryId}">
		                            	<td class="column-check">
		                                	<form:checkbox path="countryList[${loop.index}].archived" value="Y"></form:checkbox>
			                              	<%-- <c:if test="${system.localConfig}" >
			                              		<span class="alert-danger">
			                              			<c:out value="(${country.countryId})"/>
			                              		</span>
			                              	</c:if>	 --%>			                                	
		                                </td>
			                         	<td class="nowrap">
			                         		<a href="#" rel="tableRowEdit" data-param1="${country.countryId}">
			                         			<span id="countryNameRus${country.countryId}"><c:out value="${country.nameRus}"/></span>
			                         		</a>
			                         	</td>
		                              	<td class="hidden-sm hidden-xs">
		                              		<span id="countryNameEn${country.countryId}"><c:out value="${country.nameEn}"/></span>
		                              	</td>
		                              	<td class="hidden-sm hidden-xs">
		                              		<span id="countryNote${country.countryId}"><c:out value="${country.countryNote}"/></span>
		                              	</td>
		                            </tr>
	                            </c:forEach>
	                          </tbody>
	                    </table>
	                    <!-- // end of table content -->
						
					</div>
					
				</div>
			
			</form:form>
		</div>
			
	</div> <!-- Closing div tag for wrap -->
	
<jsp:include page="common/footer.jsp" />

<div id="editModal" class="modal modal-wide fade" tabindex="-1">
  <div class="modal-dialog">
    <div id="editModalContent" class="modal-content">
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->			
		
	</body>
</html>