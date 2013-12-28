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
	    <title>Таблица моделей подъемно-транспортного оборудования</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/bootstrap.min.css"/>"/>
	    <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/core.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/dataTables.bootstrap.csstic"/>">
        
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
        <script type="text/javascript" src="<c:url value="/static/js/ajax-form.js"/>" ></script>
        <script type="text/javascript">
	        $(document).ready(function() {
	        	var oTable = $('#modelSearchTable').dataTable( {
	                "sDom": "<'row'<'col-xs-6'T><'col-xs-6'>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
	                "sPaginationType": "bootstrap",
	                "bProcessing": true,
	                "iDisplayLength": 15,
	                "oLanguage": {
                        "sUrl": "static/js/dataTable_ru_RU.txt"
                     } 
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

                $(".modal-wide").on("show.bs.modal", function() {
                	  var height = $(window).height() - 200;
                	  $(this).find(".modal-body").css("max-height", height);
                	});
            } );
    
        </script>
        <style type="text/css">
			.filter_select {
				padding-top: 10px;
			}
			th {
	            text-align: center;
	            white-space:nowrap;
	            background-color: blue;
	            color: white;
	          }
	          	td {
	            white-space:nowrap;
	          }
		
			.modal.modal-wide .modal-dialog {
			  width: 90%;
			}
			.modal-wide .modal-body {
			  overflow-y: auto;
			}
			.modal-dialog {
			  padding-top: 15%;
			}
        </style>
	</head>
	<body style="">
		<!-- Wrap all page content here -->
		<div id="wrap">
			<jsp:include page="common/menu.jsp" />
			<!-- Begin page content -->
		    <div class="container">
			    <form:form id="machine_search_form" action="modelSearch" commandName="modelSearchCommand" method="post" accept-charset="UTF-8">   
			            <div class="masthead">
			                <div class="container">
			                    <div class="row">
			                    <div class="col-md-10 col-md-offset-1">
			                    <h4 class="text-muted page-header">МОДЕЛИ ПОДЪЕМНО-ТРАНСПОРТНОГО ОБОРУДОВАНИЯ<br></h4></div></div>
			                </div>
			            </div>
			        
			        <div class="container">
			            <div class="row">
			                 <div class="col col-sm-4 col-md-3">
			                     <!--Sidebar content-->
			                    <h4>Фильтр&nbsp;<span class="glyphicon glyphicon-list"></span></h4>
								<div class="filter_select">
				                    <label class="form-label">ГРУППА</label>
									<form:select id="groupSelect" path="groupId" cssClass="form-control">
									    <form:option value="">Не установлен</form:option>
						                <c:forEach items="${modelSearchCommand.groupMap}" var="group">
						                    <form:option value="${group.key}" label="(${group.key})${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>
						        <div class="filter_select">
		  				            <label class="form-label">ПРОИЗВОДИТЕЛЬ</label>
									<form:select id="manufacturerSelect" path="manufacturerId" cssClass="form-control" title="Выборка по производителю">
									    <form:option value="">Не выбран</form:option>
						                <c:forEach items="${modelSearchCommand.manufacturerMap}" var="manufacturer">
						                    <form:option value="${manufacturer.value.name}" label="${manufacturer.value.name}" />
						                </c:forEach>								
									</form:select>
					        	</div>
					        	<div class="filter_select">
					        		<label class="form-label">СТРАНА</label>
									<form:select id="countrySelect" path="countryId" cssClass="form-control">
										<form:option value="">Не установлен</form:option>
						                <c:forEach items="${modelSearchCommand.countryMap}" var="country">
						                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
						                </c:forEach>
									</form:select>
								</div>				                    
			                    
			                    <hr>
			                    <div class="input-group" style="margin: 5px">
								    <label class="form-label">ПОИСК</label>
								    <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text">  
			                        <br><br>
			                    </div>
			                 </div>
			                <div class="col col-sm-8 col-md-9">
			                    <!--Body content-->
			                    
			                    <!--  Вывод сообщений и предупреждений  -->
	<!-- 		                    Операции с данными в таблице -->
			                    <div class="btn-group" style="margin: 5px">
		                            <a href="http://localhost:8080/viking/machineEdit" class="btn btn-primary" title="Ввод нового">Добавить &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
		                            <a href="http://localhost:8080/viking/machineSearch#" class="btn btn-primary" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
	                            </div>
	                            
<!-- 							Таблица со списком машин -->
			                <div class="table-container">
			                    <div>
                                    <table id="modelSearchTable" class="table table-striped table-bordered dataTable">
			                          <thead>
			                              <tr>
                                            <th>&nbsp;</th>
                                            <th>Группа&nbsp;&nbsp;</th>
                                            <th>Модель&nbsp;&nbsp;</th>
                                            <th>Производитель&nbsp;&nbsp;</th>
                                            <th>Страна производства&nbsp;&nbsp;</th>
                                            <th>Примечания</th>
                                            <th  class="hide">group Id&nbsp;&nbsp;</th>
                                          </tr>
			                          </thead>
        			                  <tbody>
	        			                  <c:forEach var="machineModel" varStatus="loop" items="${modelSearchCommand.machineModelList}" >
		        			                  <c:if test="${machineModel.archived != 'Y'}" >
		                                          <tr>
						                             <td>
						                             	<form:checkbox path="machineModelList[${loop.index}].archived" value="Y"></form:checkbox>
						                              	<c:if test="${system.localConfig}" >
						                              		<span class="alert-danger">
						                              			<c:out value="(${machineModel.modelId})"/>
						                              		</span>
						                              	</c:if>						                             	
						                             </td>
						                             <td>&nbsp;
						                         		<a href="#" rel="tableRowEdit" data-param1="${machineModel.modelId}">
						                         			&nbsp;<span class="glyphicon glyphicon-pencil" title="Редактировать"></span>
						                         		</a>
						                         		<a href="#" rel="tableRowCopy" data-param1="${machineModel.modelId}">
						                         			&nbsp;<span class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;
						                         		</a>
		                                               <c:out value="${machineModel.group.name}"/>
						                             </td>
							                         <td><c:out value="${machineModel.name}"/></td>
						                             <td><c:out value="${machineModel.manufacturer.name}"/></td>
						                             <td><c:out value="${machineModel.manufacturer.country}"/></td>
						                             <td><c:out value="${machineModel.note}"/></td>
						                             <td  class="hide"><c:out value="${machineModel.group.groupId}"/></td>											   
						                        </tr> 
		        			                  </c:if>
	        			                  </c:forEach>
				                        </tbody>
    			                    </table>
    			                   </div>
			                   </div>
			            </div>
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
					        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
					        <button type="submit" class="btn btn-danger">УДАЛИТЬ</button>
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

					
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
			<div id="footer">
			  <div class="container">
			   <jsp:include page="common/footer.jsp" />
			  </div>
			</div>
	

		  		
</body>
    
</html>