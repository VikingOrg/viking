<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Компаний-операторов</title>
		<jsp:include page="common/headCoreElements.jsp" />
		
		<script type="text/javascript">
        $(document).ready(function() {
        	var oTable = $('#stevidor_table').dataTable( {
        		"sDom": '<"#tableActions"T>t<"#source"l>ip',
        		"bJQueryUI": true,
        		"sPaginationType": "full_numbers",          
 	            "scrollX": true,
        		"columnDefs": [
        		               {
        		                   "targets": [ 0,4 ],
        		                   "orderable": false
        		               },
        		               {
        		                   "targets": [ 0,4 ],
        		                   "visible": true
        		               }
        		           ],
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
                 "fnInitComplete": function(oSettings) {
              	   $('select[name="stevidor_table_length"]').appendTo("#table_length");
              	   $('select[name="stevidor_table_length"]').addClass("form-control");
           	   	   $("#tableActions").appendTo("#table_Actions");
	              },                 
            } );


            $('#dataTableSearch').on('input', function(event) {
            	
            	oTable.fnFilter( $(this).val());
            });
               		 
            $('#countrySelect').change(function() {
            	oTable.fnFilter( $(this).val(), 3);
            });
            $('#portSelect').change(function() {
            	oTable.fnFilter( $(this).val(), 2);
            });

//             $('#selectAll').click(function (e) {
//                 $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
//             });
            $("#dataTableSearch").focus();
            $('#dataTableSearch').keypress(function (ev) {
                var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                if (keycode == '13') {
                	ev.preventDefault();
                	return false;
                    //fnc.call(this, ev);
                }
            });
        } );
   
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	       
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container-fluid"> 
		 
			<form:form id="stevidor_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" 
				 						commandName="stevidorSearchCommand" method="post" accept-charset="UTF-8">
		   <div class="row">
		   		
				<!--Sidebar content-->
					<div class="col-sm-4 col-md-3 col-lg-3">
			
						<div class="col-sm-12 well lform">
			
							<div class="row">
									
									<div class="col-sm-12">
										<div class="form-group">
											<label>Страна</label>
											<form:select id="countrySelect" path="countryId" cssClass="form-control col-sm-12">
												<form:option value="">Все Страны</form:option>
								                <c:forEach items="${stevidorSearchCommand.userCountry}" var="country">
								                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
								                </c:forEach>
											</form:select>
										</div>	
										<div class="form-group">
											<label>Порт</label>
											<form:select id="portSelect" path="portId" cssClass="form-control col-sm-12">
												<form:option value="">Все Порты</form:option>
								                <c:forEach items="${stevidorSearchCommand.userPort}" var="port">
								                    <form:option value="${port.value.name}" label="${port.value.name}" />
								                </c:forEach>							
											</form:select>
										</div>
										<div class="form-group">
						                    <label>Поиск</label>
						                        <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text"/>
						                </div>
								        
										<div class="form-group">
												<label>Кол.строк:</label>
												<div id="table_length"></div>					
										</div>
								    </div>				
							</div> 
						</div>
						<div class="col-sm-12 well lform">
							<div class="row">	
							  <!--  Операции с данными в таблице -->
				                 <div class="col-sm-12">
			                            <a href="<c:url value="stevidorEdit"/>" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a><span class="pull-right">&nbsp;</span>
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
								<div class="alert alert-success show"><spring:message code="${message}" />
									<button type="button" class="close" data-dismiss="alert">&times;</button>
								</div>			
								</c:if>
								<c:if test="${not empty error}"> 
									<div class="alert alert-danger show"><spring:message code="${error}" />
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>			
								</c:if>									
								
								<!-- Таблица со списком стивидоров -->
								<table id="company_header" class="table_report_header">
								<tbody>
									<tr>
										<td class="nowrap">
											<h3 class="page-header">Список компаний-операторов</h3>
										</td>
										
										<td class="nowrap" id="table_Actions"></td>
									</tr>
								</tbody>
							</table>
				                    <table id="stevidor_table" class="table table-bordered table-striped">
				                          <thead>
				                              <tr>
					                              <th class="column-check nowrap">№</th>
					                              <th class="nowrap">Компания-оператор&nbsp;&nbsp;</th>
			                              		  <th class="nowrap">Порт&nbsp;&nbsp;</th>
					                              <th class="hidden-sm hidden-xs nowrap">Страна&nbsp;&nbsp;</th>
					                              <th class="">Примечания</th>
				                              </tr>
				                          </thead>
				                          <tbody>
				                          	<c:forEach var="stevidor" varStatus="loop" items="${stevidorSearchCommand.stevidorList}" >
					                            <tr>
					                            	<td class="column-check nowrap" width= "20px">
					                                	<%--<form:checkbox path="stevidorList[${loop.index}].archived" value="Y"></form:checkbox> --%>
					                                	${stevidor.stevidorId}
						                              <%-- 	<c:if test="${system.localConfig}" >
						                              		<span class="alert-danger">
						                              			<c:out value="(${stevidor.stevidorId})"/>
						                              		</span>
						                              	</c:if>	 --%>			                                	
					                                </td>
						                         	<td class="nowrap">
						                         		<a href="<c:url value="stevidorEdit?stevidorId=${stevidor.stevidorId}"/>"><c:out value="${stevidor.fullName}"/></a>
						                         	</td>
						                            <td><c:out value="${stevidor.port.name}"/></td>
					                                <td class="hidden-sm hidden-xs nowrap"><c:out value="${stevidor.port.country.nameRus}"/></td>
					                                <td class=""><c:out value="${stevidor.stevidorNote}"/></td>
					                            </tr>
				                            </c:forEach>
				                          </tbody>
				                    </table>
				        
					
				                             
				                  <!-- // end of table content -->
						
					</div>
				
			</div>
			
			 <!-- 		Модальное окно подтверждения удаления данных -->
					<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body" align="center">
					        <h4>ПОДТВЕРДИТЕ УДАЛЕНИЕ ДАННЫХ</h4>
					      </div>
					      <div class="modal-footer">
					        <a type="button" class="cancelbtn" data-dismiss="modal">ОТМЕНА</a>
					        <button type="submit" class="btn btn-primary">УДАЛИТЬ</button>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
		
		</form:form>
		</div>	
	</div> <!-- Closing div tag for wrap -->
		   <jsp:include page="common/footer.jsp" />
		
		
	</body>
</html>