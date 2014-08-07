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
		<script type="text/javascript">
	        $(document).ready(function() {
	        	oTable = $('#modelSearchTable').dataTable( {
	        		"sDom": '<"#tableActions"T>t<"#source"l>ip',
	                "bJQueryUI": true,
	    			"scrollX" : true,
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
                	   $("#source").appendTo("#table_length");
            		   $("#table_length").addClass("col-sm-8");
                	   $("#tableActions").appendTo("#table_Actions");
	              },
	            } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#groupSelect').change(function() {
                    group = $(this).val();
                    if(group==''){
                    	oTable.fnFilter(group, 6);
                    } else {
                    	oTable.fnFilter( "^"+group+"$", 6 , true);
                    }
                });
                $('#manufacturerSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 3);
                });
                
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 4);
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
                
                $("a[rel^='tableRowCopy']").click(function(e){
                    e.preventDefault();
                	$('#user_search_form').attr('action', "machineModel/copy/"+this.dataset['param1']);
                	$('#user_search_form').attr('method', "get");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                });
                $("#submitDelete").click(function(e) {
                	e.preventDefault();
                	$('#user_search_form').attr('action', "machineModel/delete/");
                	$('#user_search_form').attr('method', "post");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                 });
                $("#submitNewModel").click(function(e) {
                	e.preventDefault();
                	$('#user_search_form').attr('action', "machineModel/new/");
                	$('#user_search_form').attr('method', "get");
                	$('#user_search_form').attr('accept-charset', "UTF-8");
                	$('#user_search_form').submit();
                 });                 

                $(".modal-wide").on("show.bs.modal", function() {
                	  var height = $(window).height() - 200;
                	  $(this).find(".modal-body").css("max-height", height);
                });
            } );
               
        	function closingModal(machineModelId){
        		$('#machineModelModal').modal('hide');
        		//$('#'+machineModelId).removeClass("odd even");
        		$('#'+machineModelId).addClass( "success" );
        		//var myClass = $('#'+machineModelId).attr('class');        		
        		//alert("classes = " + myClass);
            }
            
        </script>	
		<style type="text/css">
			#limit_width{
				max-width:400px !important;
			}
			#max_width{
			    width:100% !important;
			}
		</style>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container">
			    <form:form id="machine_search_form" action="modelSearch" class="form-horizontal mini" style="margin-bottom: 0px;" 
			    commandName="modelSearchCommand" method="post" accept-charset="UTF-8">   
		<div class="row">

			<!--Sidebar content-->
			<div id = "limit_width" class="col-sm-3">

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
										<label class="col-sm-4 control-label">Кол.строк:</label>
										<div id="table_length"></div>					
								</div>
			               </div>
					</div>
				</div>
								<!--  Операции с данными в таблице -->
				<div class="col-sm-12 well lform">
					<div class="row" style="padding-right:10px">
						<div class="col-sm-12">
							<div class="form-group">
								<a href="<c:url value="machineEdit"/>"
									class="btn btn-primary pull-right" title="Ввод нового">Добавить</a><span
									class="pull-right">&nbsp;</span> 
									<a href="#"
									class="btn btn-primary pull-right" title="Удалить"
									data-toggle="modal" data-target="#confirmDelete">Удалить</a>
							</div>	
						</div>
					</div>	
				</div>		
			</div>
			<!-- End of Sidebar content-->

			<div class="col-sm-9">
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
	                            
<!-- 							Таблица со списком машин -->
				<h3 class="page-header">Модели Машин</h3>
                                    <table id="modelSearchTable" class="table table-striped table-bordered">
			                          <thead>
			                              <tr>
                                            <th class="nowrap column-check" width= "20px">&nbsp;</th>
                                            <th class="nowrap">Модель&nbsp;&nbsp;</th>
                                            <th class="hidden-sm hidden-xs hidden-md nowrap">Группа&nbsp;&nbsp;</th>
                                            <th class="nowrap">Производитель&nbsp;&nbsp;</th>
                                            <th class="hidden-sm hidden-xs hidden-md nowrap">Страна производства&nbsp;&nbsp;</th>
                                            <th class="nowrap">Примечания</th>
                                            <th  class="hide">group Id&nbsp;&nbsp;</th>
                                          </tr>
			                          </thead>
        			                  <tbody>
	        			                  <c:forEach var="machineModel" varStatus="loop" items="${modelSearchCommand.machineModelList}" >
		        			                  <c:if test="${machineModel.archived != '1'}" >
		                                          <tr id="${machineModel.modelId}">
						                             <td class="nowrap column-check" width= "20px">
						                             	<form:checkbox path="machineModelList[${loop.index}].archived" value="Y"></form:checkbox>
						                              	<c:if test="${system.localConfig}" >
						                              		<span class="badge">
						                              			<c:out value="(${machineModel.modelId})"/>
						                              		</span>
						                              	</c:if>						                             	
						                             </td>
							                         <td class="nowrap">
						                         	 	<a href="#" rel="tableRowEdit" data-param1="${machineModel.modelId}">
							                         <span id="name${machineModel.modelId}"><c:out value="${machineModel.name}"/></span></a></td>
						                             <td class="hidden-sm hidden-xs hidden-md nowrap"><c:out value="${machineModel.group.name}"/></td>
						                             <td class="nowrap"><span id="manafacturer${machineModel.modelId}"><c:out value="${machineModel.manufacturer.nameRus}"/></span></td>
						                             <td class="hidden-sm hidden-xs hidden-md nowrap"><span id="country${machineModel.modelId}"><c:out value="${machineModel.manufacturer.country.nameRus}"/></span></td>
						                             <td class="nowrap"><span id="note${machineModel.modelId}"><c:out value="${machineModel.note}"/></span></td>
						                             <td class="hide"><c:out value="${machineModel.group.groupId}"/></td>											   
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
							<button type="submit" class="btn btn-primary">Удалить</button>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
					
			</form:form>
				<div id="machineModelModal" class="modal modal-wide fade">
				  <div class="modal-dialog">
				    <div id="machineModelModalContent" class="modal-content">
				    
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />	
</body>
    
</html>