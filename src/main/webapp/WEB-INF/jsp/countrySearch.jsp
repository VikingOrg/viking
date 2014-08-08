<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Стран</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#country_table').dataTable( {
   	           "columnDefs": [
          		               {
          		                   "targets": [ 0,2 ],
          		                   "orderable": false
          		               },
          		           ],
                	           "scrollX": true,
                	           "sDom": '<"#tableActions"T>t<"#source"l>ip',
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
                
            } );
   
        </script>
		
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">      
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container"> 
		 
								
		<form:form id="country_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="countrySearch" commandName="countrySearchCommand" method="post" accept-charset="UTF-8">
		   <div class="row">
		   		
				<!--Sidebar content-->
					<div id = "limit_width" class="col-sm-3">
			
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
							<div class="row" style="padding-right:10px">	
		                    <!--  Операции с данными в таблице -->
		                    <div class="col-sm-12">
			                    <div class="form-group">
		                            <a href="<c:url value="countryEdit/new/"/>" class="btn btn-primary pull-right" title="Ввод нового">Добавить</a><span class="pull-right">&nbsp;</span>
		                            <a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
	                            </div>
	                        </div>
							</div>
						</div>
						
					</div>
				<!-- End of Sidebar content-->	
				
				
					<div id = "#max_width" class="col-sm-9">
				
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
								
								<!-- Таблица со списком стран -->
								<h3 class="page-header">
									Список стран
									</h3>
				                    <table id="country_table" class="table table-bordered table-striped">
				                    
				                          <thead>
				                              <tr>
					                              <th class="column-check nowrap">&nbsp;</th>
					                              <th class="nowrap">Страна (RUS)</th>
					                              <th class="hidden-sm hidden-xs nowrap">Страна (ENG)</th>
					                              <th class="hidden-sm hidden-xs nowrap">Примечания</th>
				                              </tr>
				                          </thead>
				                          <tbody>
				                          	<c:forEach var="country" varStatus="loop" items="${countrySearchCommand.countryList}" >
				                          	<c:if test="${country.archived != '1'}" >
					                            <tr>
					                                <td class="column-check nowrap">
					                                	<form:checkbox path="countryList[${loop.index}].archived" value="Y"></form:checkbox>
						                              	<%-- <c:if test="${system.localConfig}" >
						                              		<span class="alert-danger">
						                              			<c:out value="(${country.countryId})"/>
						                              		</span>
						                              	</c:if>	 --%>			                                	
					                                </td>
						                         	<td class="nowrap">
						                         		<a href="<c:url value="countryEdit/edit/${country.countryId}"/>"><c:out value="${country.nameRus}"/></a>
						                         	</td>
					                              <td class="hidden-sm hidden-xs"><c:out value="${country.nameEn}"/></td>
					                              <td class="hidden-sm hidden-xs"><c:out value="${country.countryNote}"/></td>
					                            </tr>
					                        </c:if>    
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
					        <a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
					        <button type="submit" class="btn btn-primary">Удалить</button>
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