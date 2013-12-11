<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Титул</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="static/css/page.css">
		<link rel="stylesheet" type="text/css" href="static/css/table.css">

		<script type="text/javascript" src="static/js/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#stevedor_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               null,
                	               { "bSortable": false },
                	           ],
                    "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sUrl": "static/js/ru_RU.txt"
                     }                    
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 8);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 7);
                });

                $('#selectAll').click(function (e) {
                    $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
                });
                
            } );

    
        </script>
        <style type="text/css">
			.dataTables_filter {
			     display: none;
			}
        </style>
		
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
	        <div class="container">
	        	<form:form id="stevedor_search_form" action="stevidorSearch" commandName="stevidorSearchCommand" method="post" accept-charset="UTF-8">
	        	<div class="masthead">
			        <div class="container">
			            <div class="row">
			                    <h4 class="text-muted page-header">СПИСОК СТИВИДОРНЫХ КОМПАНИЙ<br></h4>
			            </div>
			        </div>
		        </div>
		        
			        <div class="container-fluid">
			            <div class="row-fluid">
			                 <div class="col col-md-3 col-xs-4">
			                     <!--Sidebar content-->
			                    <h4>Фильтр&nbsp;<span class="glyphicon glyphicon-list"></span></h4>
			                    
					        	<label class="form-label">СТРАНА</label>
								<form:select id="countrySelect" path="countryId" cssClass="form-control">
									<form:option value="">Не установлен</form:option>
					                <c:forEach items="${stevidorSearchCommand.userCountry}" var="country">
					                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
					                </c:forEach>
								</form:select>
					          	<p>&nbsp;</p>
						          <label class="form-label">ПОРТ</label>
									<form:select id="portSelect" path="portId" cssClass="form-control">
										<form:option value="">Не установлен</form:option>
						                <c:forEach items="${stevidorSearchCommand.userPort}" var="port">
						                    <form:option value="${port.value.name}" label="${port.value.name}" />
						                </c:forEach>							
									</form:select>		          
						          <p>&nbsp;</p>
			                    
			                    
			                    <hr>
			                    <label class="form-label">ПОИСК</label>
			                    <div class="input-group" style="margin: 5px">
			                        <input class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text">
			                    </div>
			                 </div>
			                <div class="col col-md-9 col-xs-8">
			                    <!--Body content-->
			                    
			                    <!--                             Вывод сообщений и предупреждений -->
							<div class="alert alert-success show">Изменения внесены
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							</div>
							<div class="alert alert-danger show">Ошибка сохранения данных
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							</div>
							<div class="alert alert-warning show">Не выбрано ни одной строки
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							</div>
							
								<!-- 		                    Операции с данными в таблице -->
		                    <div class="btn-group" style="margin: 5px">
                            <a href="<c:url value="userEditAdmin"/>" class="btn btn-primary" title="Ввод нового">Добавить &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
                            <a href="#" class="btn btn-primary" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
                            </div>
                            

<!-- 							Таблица со списком пользователей -->
			                <div class="table-container">
			                    <table id="stevedor_table" class="table table-striped table-bordered">
			                          <thead>
			                              <tr>
			                              <th><input type="checkbox" id="selectAll"></th>
			                              <th>Наименование&nbsp;&nbsp;</th>
			                              <th>Порт&nbsp;&nbsp;</th>
			                              <th>Страна&nbsp;&nbsp;</th>
			                              <th>Примечания&nbsp;&nbsp;</th>
			                              </tr>
			                          </thead>
			                          <tbody>
			                          	<c:forEach var="stevedor"  items="${stevidorSearchCommand.stevedorList}" >
				                            <tr>
				                              <td><input type="checkbox"></td>
					                         	<td class="nowrap">
					                         		<a href="<c:url value="stevidorEdit?stevedorId=${stevedor.stevedorId}"/>">&nbsp;<span class="glyphicon glyphicon-pencil" title="Редактировать"></span></a>
					                         		<a href="<c:url value="stevidorEdit?stevedorId=${stevedor.stevedorId}&copy=true"/>">&nbsp;<span class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;</a>
					                         		<c:out value="${stevedor.name}"/>
					                         	</td>
					                         					                              
				                              <td><c:out value="${stevedor.portName}"/></td>
				                              <td><c:out value="${stevedor.countryName}"/></td>
				                              <td><c:out value="${stevedor.stevedorNote}"/></td>
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
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title">ВНИМАНИЕ!</h4>
					      </div>
					      <div class="modal-body">
					        <p>ПОДТВЕРДИТЕ УДАЛЕНИЕ ДАННЫХ</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
					        <button type="submit" class="btn btn-danger">УДАЛИТЬ</button>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
					
				</form:form>
		    </div> <!-- End Main Container -->
		</div> <!-- Wrapper end -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>