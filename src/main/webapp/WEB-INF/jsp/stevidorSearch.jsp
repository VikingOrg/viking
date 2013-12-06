<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Титул</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="static/css/page.css">
		<link rel="stylesheet" type="text/css" href="static/css/table.css">
	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		
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
                    "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sUrl": "static/js/ru_RU.txt"
                     }                    
                } );


                /* $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 8);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 7);
                });
                $('#stevedorSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 6);
                }); */
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
			                    <select class="form-control" style="margin: 5px">
			                    <option>Россия</option>
			                    <option>Украина</option>
			                    <option>Латвия</option>
			                    </select>
			                    <label class="form-label">ПОРТ</label>
			                    <select class="form-control" style="margin: 5px">
			                    <option>С-Петербургский</option>
			                    <option>Высоцкий</option>
			                    <option>Находкинский</option>
			                    </select>
			                    <hr>
			                    <label class="form-label">НАИМЕНОВАНИЕ</label>
			                    <div class="input-group" style="margin: 5px">
			                        <input class="form-control" placeholder="Поиск" title="Введите для поиска по всем полям" type="text">
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
			                    <table class="table table-bordered">
			                          <thead>
			                              <tr>
			                              <th><input type="checkbox"></th>
			                              <th>Порт
			                                <span class="caret"></span>
			                              </th>
			                              <th>Наименование</th>
			                              <th>Страна</th>
			                              <th>Примечания</th>
			                            </tr>
			                          </thead>
			                          <tbody>
			                            <tr>
			                              <td><input type="checkbox"></td>
			                              <td>Порт 1</td>
				                          <td class="nowrap">
				                         		<a href="<c:url value="stevidorEdit?stevidorId=1"/>">Edit</a>&nbsp;
				                         		<c:out value="1-я Стивидорная"/>
				                          </td>                              
			                              <td>Россия</td>
			                              <td>Балтика</td>
			                            </tr>
			                          </tbody>
			                    </table>
			                   </div>
			                </div>
			            </div>
			        </div>

		    </div> <!-- End Main Container -->
		</div> <!-- Wrapper end -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>