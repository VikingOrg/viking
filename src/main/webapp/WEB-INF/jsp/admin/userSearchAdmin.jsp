<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Список пользователей системы</title>
		<jsp:include page="../common/headCoreElements.jsp" />
				
        <script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#user_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               null,
                	               null,
                	               { "bSortable": false },
                	               null,
                	               null,
                	               null,
                	               { "bSortable": false },
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
                                   "sUrl": "static/js/dataTable_ru_RU.txt"
                                },
                                "fnInitComplete": function(oSettings) {
                                   $('select[name="user_table_length"]').appendTo("#table_length");
          	                	   $('select[name="user_table_length"]').addClass("form-control");
                           	   	   $("#tableActions").appendTo("#table_Actions");
               	              },                     
                } );

            	// Highlight every second row
            	//oTable.$('tr:odd').css('backgroundColor', 'blue');
            	  
                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 8);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 7);
                });
                $('#stevidorSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 6);
                });

                $("a[rel^='userTableRowEdit_']").click(function(e){
                    e.preventDefault();
                	$('#user_search_form').attr('action', "userEditAdmin/edit/"+this.dataset['param1']);
                	$('#user_search_form').attr('method', "get");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                });
                
                $("a[rel^='userTableRowCopy_']").click(function(e){
                    e.preventDefault();
                	$('#user_search_form').attr('action', "userEditAdmin/copy/"+this.dataset['param1']);
                	$('#user_search_form').attr('method', "get");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                });
                $("#submitDelete").click(function(e) {
                	e.preventDefault();
                	$('#user_search_form').attr('action', "userSearchAdmin/delete/");
                	$('#user_search_form').attr('method', "post");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                 });
                $("#submitNewUser").click(function(e) {
                	e.preventDefault();
                	$('#user_search_form').attr('action', "userEditAdmin/new/");
                	$('#user_search_form').attr('method', "get");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                 });                
            } );

    
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	       
		   <jsp:include page="../common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container"> 
		 
	  			<form:form id="user_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="userSearchAdmin" commandName="userSearchCommand" method="post" accept-charset="UTF-8">
		   <div class="row">
		   		
				<!--Sidebar content-->
					<div id = "limit_width" class="col-sm-4">
			
						<div class="col-sm-12 well lform">
			
							<div class="row">
									
								<div class="col-sm-12">
									<div class="form-group">
						        	<label>Страна</label>
										<form:select id="countrySelect" path="countryId" cssClass="form-control col-sm-12">
											<form:option value="">Все Страны</form:option>
							                <c:forEach items="${userSearchCommand.userCountry}" var="country">
							                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
							                </c:forEach>
										</form:select>
									</div>	
									<div class="form-group">
										<label>Порт</label>
										<form:select id="portSelect" path="portId" cssClass="form-control col-sm-12">
											<form:option value="">Все Порты</form:option>
							                <c:forEach items="${userSearchCommand.userPort}" var="port">
							                    <form:option value="${port.value.name}" label="${port.value.name}" />
							                </c:forEach>							
										</form:select>
									</div>	
									<div class="form-group">	          
							          <label>Компания</label>
										<form:select id="stevidorSelect" path="stevidorId" cssClass="form-control">
										    <form:option value="">Все Компании</form:option>
							                <c:forEach items="${userSearchCommand.userStevidor}" var="stevidor">
							                    <form:option value="${stevidor.value.fullName}" label="${stevidor.value.fullName}" />
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
							<div class="row" style="margin-left:-25px; margin-right:-25px;">
								<!--  Операции с данными в таблице -->
				                    <div class="col-sm-12">
										<div class="form-group">
				                            <a id="submitNewUser" href="<c:url value="/userEditAdmin"/>" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>Добавить</a><span class="pull-right">&nbsp;</span>
				                            <a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
			                            </div>
									</div>
							</div>
						</div>
					</div>
				<!-- End of Sidebar content-->	 
				
		                <div class="col-sm-8">
		                    <!--Body content-->
		                    
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
                            

<!-- 							Таблица со списком пользователей -->
							<h3 class="page-header">Список пользователей
								</h3>
		                    
			                    <table id="user_table" class="table table-striped table-bordered">
			                          <thead>
			                            <tr>
			                              <th class="column-check nowrap">&nbsp;</th>
			                              <th class="nowrap">ФИО&nbsp;&nbsp;</th>
			                              <th class="hide">Подразделение&nbsp;&nbsp;</th>
			                              <th class="hide">Должность&nbsp;&nbsp;</th>
			                              <th class="hidden-sm hidden-xs hidden-md nowrap">Роль&nbsp;&nbsp;</th>
			                              <th class="hide">E-mail&nbsp;&nbsp;</th>
			                              <th class="nowrap">Компания&nbsp;&nbsp;</th>
			                              <th class="hidden-sm hidden-xs hidden-md nowrap">Порт&nbsp;&nbsp;</th>
			                              <th class="hide">Страна&nbsp;&nbsp;</th>
			                              <th class="hidden-sm hidden-xs hidden-md nowrap">Примечания&nbsp;&nbsp;</th>
			                            </tr>
			                          </thead>
			                          <tbody>
									       <c:forEach var="user" varStatus="loop" items="${userSearchCommand.userList}" >
										   <c:if test="${user.archived != 'Y'}" > 
						                       <tr>
						                       		<td class="column-check nowrap">
						                       			<form:checkbox path="userList[${loop.index}].archived" value="Y"></form:checkbox>
						                              	<c:if test="${system.localConfig}" >
						                              		<span class="badge">
						                              			<c:out value="(${user.userId})"/>
						                              		</span>
						                              	</c:if>							                       			
						                       		</td>
						                         	<td class="nowrap">
						                         		<a href="#" rel="userTableRowEdit_${loop.index}" data-param1="${user.userId}">
						                         			&nbsp;<c:out value="${user.lastName} ${user.firstName} ${user.middleInitial}"/>
						                         		</a>
						                         		
						                         	</td>
						                         	<td class="hide"><c:out value="${user.division}"/></td>
						                         	<td class="hide"><c:out value="${user.occupation}"/></td>
						                         	<td class="hidden-sm hidden-xs hidden-md nowrap"><c:out value="${user.role.role}"/></td>
						                         	<td class="hide"><c:out value="${user.userEmail}"/></td>
						                         	<td class="nowrap"><c:out value="${user.stevidor.fullName}"/></td>
					                              	<td class="hidden-sm hidden-xs hidden-md nowrap"><c:out value="${user.port.name}"/></td>
					                              	<td class="hide"><c:out value="${user.country.nameRus}"/></td>
					                              	<td class="hidden-sm hidden-xs hidden-md nowrap"><c:out value="${user.userNote}"/></td>
						                       </tr>
						                    </c:if>   
											</c:forEach>                              
			                          </tbody>
			                    </table>
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
					        <button id="submitDelete" type="button" class="btn btn-primary">Удалить</button>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
		        
		        </form:form>
		    </div> 	
	</div> <!-- Closing div tag for wrap -->
		   <jsp:include page="../common/footer.jsp" />


	</body>
</html>

