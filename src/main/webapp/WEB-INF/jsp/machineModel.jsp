<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Таблица Моделей Машин</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
    	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
		
		<script type="text/javascript">
	        $(document).ready(function() {
	        	oTable = $('#modelSearchTable').dataTable( {
	        		"sDom": '<"#tableActions"T>t<"#source"l>ip',
	                "bJQueryUI": true,
	    			"scrollX" : true,
	    			"columnDefs": [
	          		               {
	          		                   "targets": [ 0 ],
	          		                   "visible": true
	          		               },
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
	                	   $('select[name="modelSearchTable_length"]').appendTo("#table_length");
	                	   $('select[name="modelSearchTable_length"]').addClass("form-control");
                   	   	   $("#tableActions").appendTo("#table_Actions");
	 	              },
	            } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                }); 
                  		 
                $('#groupSelect').change(function() {
                    group = $(this).val();
                    if(group==''){
                    	oTable.fnFilter(group, 7);
                    } else {
                    	oTable.fnFilter( "^"+group+"$", 7 , true);
                    }
                });
                $('#manufacturerSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 4);
                });
                
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 5);
                });

                $("a[rel^='tableRowEdit']").click(function(e){

                    $.ajax('${pageContext.request.contextPath}/machineModel/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#machineModelModalContent").html(response.responseText);
                            $('#machineModelModal').modal('show');
                            
                        }
                    });
                });

                $('#addNewModel').click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/machineModel/createNew/', {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#machineModelModalContent").html(response.responseText);
                            $('#machineModelModal').modal('show');
                        }
                    });
                });
                                    
            } ); //end of document.ready 
               
            
        	function closingModal(modelId, successMsg, groupId){
        		$('#machineModelModal').modal('hide');
        		$('#'+modelId).addClass( "success" );

        		$('#success_alert').attr("class","alert alert-success");
        		$("#success_alert_message").html(successMsg);
        		
            }
            
        </script>	
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container-fluid">
    <form:form id="machine_search_form" action="modelSearch" class="form-horizontal mini" style="margin-bottom: 0px;" 
    commandName="modelSearchCommand" method="post" accept-charset="UTF-8">   
		<div class="row">

			<!--Sidebar content-->
			<div class="col-sm-4 col-md-3 col-lg-3">

				<div class="col-sm-12 well lform">

					<div class="row">

						<div class="col-sm-12">
								<div class="form-group">
				                    <label>Группа</label>
									<form:select id="groupSelect" path="groupId" cssClass="form-control">
									    <form:option value="">Все группы</form:option>
						                <c:forEach items="${modelSearchCommand.groupMap}" var="group">
						                    <form:option value="${group.key}" label="(${group.key})${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>
						        <div class="form-group">
				                    <label>Производитель</label>
									<form:select id="manufacturerSelect" path="manufacturerId" cssClass="form-control" title="Выборка по производителю">
									    <form:option value="">Все производители</form:option>
						                <c:forEach items="${modelSearchCommand.manufacturerMap}" var="manufacturer">
						                    <form:option value="${manufacturer.value.nameRus}" label="${manufacturer.value.nameRus}" />
						                </c:forEach>								
									</form:select>
					        	</div>
					        	<div class="form-group">
				                    <label>Страна</label>
									<form:select id="countrySelect" path="countryId" cssClass="form-control">
										<form:option value="">Все страны</form:option>
						                <c:forEach items="${modelSearchCommand.countryMap}" var="country">
						                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
						                </c:forEach>
									</form:select>
								</div>	
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
								<div class="form-group">
				                    <label>Тип записей</label>
									<select id="" class="form-control" title="Выборка по типу записи">
										<option value="">Все типы</option>
										<option value="0">Активные</option>
										<option value="1">Удаленные</option>
									</select>	                    
                    </div>
			               </div>
					</div>
				</div>
				
				<!--  Операции с данными в таблице КНОПОЧКИ -->
				<div class="col-sm-12 well lform">
					<div class="row">
						<div class="col-sm-12">
								<a id="addNewModel" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
								<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
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
				<div id="success_alert" class="alert alert-success hidden">
					<span id="success_alert_message"></span>
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>

				<table id="company_header" class="table_report_header">
					<tbody>
						<tr>
							<td class="nowrap">
								<h3 class="page-header">Список Моделей</h3>
							</td>
							<td class="nowrap" id="table_Actions"></td>
						</tr>
					</tbody>
				</table>
				
				<!-- Таблица со списком машин -->									
                 <table id="modelSearchTable" class="table table-striped table-bordered">
                   <thead>
                       <tr>
                         <th class="column-check">&nbsp;</th>
                         <th class="">Модель&nbsp;&nbsp;</th>
                         <th class="">Характ. Модели</th>                         
                         <th class="">Группа</th>
                         <th class="">Производитель&nbsp;&nbsp;</th>
                         <th class="hidden-sm hidden-xs hidden-md nowrap">Страна</th>
                         <th class="">Примечания</th>
                         <th class="">group Id</th>
                       </tr>
                   </thead>
	               <tbody>
	                  <c:forEach var="machineModel" varStatus="loop" items="${modelSearchCommand.machineModelList}" >
                         <tr id="${machineModel.modelId}">
	                         <td class="column-check">
	                         	<form:checkbox path="machineModelList[${loop.index}].archived" value="Y"></form:checkbox>
	                          	<c:if test="${system.localConfig}" >
	                          		<span class="badge">
	                          			<c:out value="(${machineModel.modelId})"/>
	                          		</span>
	                          	</c:if>						                             	
	                         </td>
	                      	 <td class="">
	                     	 	<a href="#" rel="tableRowEdit" data-param1="${machineModel.modelId}">
	                      			<span id="name${machineModel.modelId}"><c:out value="${machineModel.name}"/></span></a>
	                      	 </td>
	                      	 <td class=""><span id="details${machineModel.modelId}"><c:out value="${machineModel.details}"/></span></td>
	                         <td class="hidden-sm hidden-xs hidden-md "><c:out value="${machineModel.group.name}"/></td>
	                         <td class="">
	                         	<span id="manafacturer${machineModel.modelId}">
	                         		<c:if test="${machineModel.manufacturer.countryId == 4}" >
	                         			<c:out value="${machineModel.manufacturer.nameRus}"/>
	                         		</c:if>
	                         		<c:if test="${machineModel.manufacturer.countryId != 4}" >
	                         			<c:out value="${machineModel.manufacturer.nameRus}"/> (<c:out value="${machineModel.manufacturer.nameEn}"/>)
	                         		</c:if>
	                         	</span>
	                         </td>
	                         <td class="hidden-sm hidden-xs hidden-md "><span id="country${machineModel.modelId}"><c:out value="${machineModel.manufacturer.country.nameRus}"/></span></td>
	                         <td class=""><span id="note${machineModel.modelId}"><c:out value="${machineModel.note}"/></span></td>
	                         <td class=""><c:out value="${machineModel.group.groupId}"/></td>											   
                 	     </tr> 
	          	        </c:forEach>
                   </tbody>
          		</table>
    		</div>
        </div>
	</form:form>
			
		<div id="machineModelModal" class="modal modal-wide fade">
		  <div class="modal-dialog">
		    <div id="machineModelModalContent" class="modal-content">
		    
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
				
				
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
</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />	
</body>
    
</html>