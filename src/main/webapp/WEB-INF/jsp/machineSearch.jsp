<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Таблица подъемно-транспортного оборудования</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="static/css/page.css">
		<link rel="stylesheet" type="text/css" href="static/css/table.css">
		<link rel="stylesheet" type="text/css" href="static/css/ColVis.css">

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/ColVis.js"></script>

        <script type="text/javascript">
	        $(document).ready(function() {
	        	var oTable = $('#machine_table').dataTable( {
	        		"bProcessing": true,
	            	"aoColumns": [
               	               { "bSortable": false },
               	               null,
               	               null,
               	               null,
               	            { "bSortable": false },
               	               null,
               	            	null,
               	               { "bSortable": false },
               	        	    { "bSortable": false },
               	      		   { "bSortable": false },
               	     			 { "bSortable": false },
               	   				{ "bSortable": false },
               	               null,
               	            	{ "bSortable": false },
               	               null,
               	            	null,
		               	       { "bSortable": false },
		               	 	   { "bSortable": false },
				               { "bSortable": false },
				               { "bSortable": false }
               	           ],
               	        "sDom": 'C<"clear">lfrtip',
	                "sPaginationType": "bootstrap"
                
	            } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 14);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 13);
                });
                $('#stevidorSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 3);
                });
                $('#groupSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 1);
                });                
                $('#selectAll').click(function (e) {
                    $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
                });
				$('#resetButton').click(function(r) {
					var oTable = $('#stevidor_table').dataTable();
					  // Re-draw the table 
					  oTable.fnDraw();
					});
                
            } );

    
        </script>
        <style type="text/css">
			.dataTables_filter {
			     display: none;
			}
			.filter_select {
				padding-top: 10px;
			}
			th {
            text-align: center;
            white-space:nowrap;
          }
          	td {
            white-space:nowrap;
          }
        </style>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="common/menu.jsp" />
			<!-- Begin page content -->
		    <div class="container">
				<form:form id="machine_search_form" action="machineSearch" commandName="machineSearchCommand" method="post" accept-charset="UTF-8">
			       <div class="container">
			            <div class="masthead">
			                <div class="container">
			                    <div class="row">
			                    <div class="col col-md-6">
			                    <h4 class="text-muted page-header">ПОДЪЕМНО-ТРАНСПОРТНОЕ ОБОРУДОВАНИЕ<br></h4></div></div>
			                </div>
			            </div>
			        
			        <div class="container-fluid">
			            <div class="row-fluid">
			                 <div class="col col-sm-4 col-md-3">
			                     <!--Sidebar content-->
			                    <h4>Фильтр&nbsp;<span class="glyphicon glyphicon-list"></span></h4>
			                    
								<div class="filter_select">
					        	<label class="form-label">СТРАНА</label>
								<form:select id="countrySelect" path="countryId" cssClass="form-control">
									<form:option value="">Не установлен</form:option>
					                <c:forEach items="${machineSearchCommand.userCountry}" var="country">
					                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
					                </c:forEach>
								</form:select>
					          	</div>	
								<div class="filter_select">
						          <label class="form-label">ПОРТ</label>
									<form:select id="portSelect" path="portId" cssClass="form-control">
										<form:option value="">Не установлен</form:option>
						                <c:forEach items="${machineSearchCommand.userPort}" var="port">
						                    <form:option value="${port.value.name}" label="${port.value.name}" />
						                </c:forEach>							
									</form:select>		          
						          </div>	
								<div class="filter_select">
						          <label class="form-label">КОМПАНИЯ</label>
									<form:select id="stevidorSelect" path="stevidorId" cssClass="form-control">
									    <form:option value="">Не установлен</form:option>
						                <c:forEach items="${machineSearchCommand.userStevidor}" var="stevidor">
						                    <form:option value="${stevidor.value.fullName}" label="${stevidor.value.fullName}" />
						                </c:forEach>								
									</form:select>
						          </div>	
								<div class="filter_select">
				                    <label class="form-label">ГРУППА</label>
									<form:select id="groupSelect" path="groupId" cssClass="form-control">
									    <form:option value="">Не установлен</form:option>
						                <c:forEach items="${machineSearchCommand.groupMap}" var="group">
						                    <form:option value="${group.value.name}" label="${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>	
								<div class="filter_select">
			                    
			                    <label class="form-label">ГОД ВЫПУСКА</label>
			                    <select class="form-control" title="Выборка по году выпуска">
			                    <option>Не установлен</option>
			                    <option>1960</option>
			                    <option>1970</option>
			                    <option>1980</option>
			                    </select>
			                    </div>	
			                    
			                    <div class="filter_select">
			                    <label class="form-label">ПРОИЗВОДИТЕЛЬ</label>
			                    <select class="form-control" title="Выборка по производителю">
			                    <option>Не установлен</option>
			                    <option>Кранбау-Эберсвальде</option>
			                    <option>Ганц</option>
			                    <option>СММ</option>
			                    </select>
			                    </div>	
			                    
			                    <div class="filter_select">
			                    <label class="form-label">МОДЕЛЬ</label>
			                    <select class="form-control" title="Выборка по модели">
			                    <option>Не установлен</option>
			                    <option>Альбатрос 10/20т</option>
			                    <option>Кондор 16/20/32т</option>
			                    <option>Сокол 16/20/32т</option>
			                    </select>
			                    </div>	
			                    <div class="filter_select">
									<form:button class="btn btn-primary" id="resetButton">СБРОС&nbsp;<span class="glyphicon glyphicon-refresh" title="Сброс настроек фильтра"></span></form:button>
						        </div>
			                    <hr>
			                    <div class="input-group" style="margin: 5px">
								    <label class="form-label">ПОИСК</label>
								    <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text"/>  
			                        <br><br>
			                    </div>
			                 </div>
			                <div class="col col-sm-8 col-md-9">
			                    <!--Body content-->
			                    
			                    <!--  Вывод сообщений и предупреждений  -->
								<c:if test="${not empty message}"> 
									<div class="alert alert-success show"><spring:message code="${message}" />
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>			
								</c:if>
								
	<!-- 		                    Операции с данными в таблице -->
			                    <div class="btn-group" style="margin: 5px">
		                            <a href="<c:url value="machineEdit"/>" class="btn btn-primary" title="Ввод нового">Добавить &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
		                            <a href="#" class="btn btn-primary" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
	                            </div>
	                            
	                            
	                            
<!-- 							Таблица со списком машин -->
			                <div class="table-container">
			                    <table id="machine_table" class="table table-striped table-bordered">
			                          <thead>
			                              <tr>
				                              <th><input type="checkbox" id="selectAll"></th>
				                              <th>Группа(machine.model.group.name)&nbsp;&nbsp;</th>
				                              <th>Модель(machine.model.name)&nbsp;&nbsp;</th>
				                              <th>Компания(machine.stevidor.fullName)&nbsp;&nbsp;</th>
				                              <th>Характеристики(machine.model.details)&nbsp;&nbsp;</th>
				                              <th>Производитель&nbsp;&nbsp;</th>
				                              <th>Год выпуска&nbsp;&nbsp;</th>
				                              <th>Дата ввода в эксплуатацию</th>
				                              <th>Контракт №</th>
				                              <th>Инвентарный №</th>
				                              <th>Транс №</th>
				                              <th>Заводской №</th>
				                              <th>Страна призводства&nbsp;&nbsp;</th>
				                              <th>Место установки</th>
				                              <th>Порт&nbsp;&nbsp;</th>
				                              <th>Страна&nbsp;&nbsp;</th>
				                              <th>Номенклатурный №</th>
				                              <th>Регистрационный №</th>
				                              <th>Примечания</th>
				                              <th>Описание Машины</th>
			                              </tr>
			                          </thead>
			                          <tbody>
			                          	<c:forEach var="machine"  items="${machineSearchCommand.machineList}" >
				                            <tr>
				                              <td>
				                              	<input type="checkbox">
				                              	<c:out value="(${machine.machineId})"/>
				                              </td>
				                              <td>
					                         		<a href="<c:url value="machineEdit?machineId=${machine.machineId}"/>">&nbsp;<span class="glyphicon glyphicon-pencil" title="Редактировать"></span></a>
					                         		<a href="<c:url value="machineEdit?machineId=${machine.machineId}&copy=true"/>">&nbsp;<span class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;</a>
				                              		<c:out value="${machine.model.group.name}"/>
				                              </td>
					                          <td>
					                         		<c:out value="${machine.model.name}"/>
					                          </td>
				                              <td><c:out value="${machine.stevidor.fullName}"/></td>
				                              <td><c:out value="${machine.model.details}"/></td>
				                              <td><c:out value="${machine.model.manufacturer.name}"/></td>
				                              <td><c:out value="${machine.releaseYear}"/></td>
				                              <td><spring:eval expression="machine.startDate" /></td>
				                              <td>№<c:out value="${machine.doc}"/></td>
				                              <td><c:out value="${machine.inventoryNumb}"/></td>
				                              <td><c:out value="${machine.transNumb}"/></td>
				                              <td><c:out value="${machine.factoryNumb}"/></td>
				                              <td></td>
				                              <td><c:out value="${machine.location}"/></td>
				                              <td><c:out value="${machine.stevidor.port.name}"/></td>
				                              <td><c:out value="${machine.stevidor.port.country.nameRus}"/></td>
				                              <td></td>
				                              <td></td>
				                              <td><c:out value="${machine.note}"/></td>
				                              <td><c:out value="${machine.name}"/></td>
											   
				                            </tr>
			                            </c:forEach>
			                          </tbody>
			                    </table>
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
					
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>