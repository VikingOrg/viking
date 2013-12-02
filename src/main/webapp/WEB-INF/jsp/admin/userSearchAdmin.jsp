<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Оборудование</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#user_table').dataTable( {
                    "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sUrl": "static/js/ru_RU.txt"
                     }                    
                } );
            } );
        </script>		  
	</head>

	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<jsp:include page="../common/menu.jsp" />
			<!-- Begin page content -->
	  		<div class="container">
	  			<form:form id="user_search_form" action="userSearchAdmin" commandName="userSearchCommand" method="post" accept-charset="UTF-8">
				<div class="masthead">
				    <div class="container">
				        <div class="row">
				        <div class="col col-md-6">
				        <h4 class="text-muted page-header">СПИСОК ПОЛЬЗОВАТЕЛЕЙ СИСТЕМЫ<br></h4></div></div>
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
		                    <label class="form-label">КОМПАНИЯ</label>
		                    <select class="form-control" style="margin: 5px">
		                    <option>1-ая Стивидорная</option>
		                    <option>2-ая Стивидорная</option>
		                    <option>3-ая Стивидорная</option>
		                    </select>
		                    <hr>
		                    <div class="input-group" style="margin: 5px">
		                    <label class="form-label">ФАМИЛИЯ</label>
		                        <input class="form-control" placeholder="Поиск" title="Введите для поиска по Наименованию" type="text">
		                    <label class="form-label">ИМЯ</label>
		                        <input class="form-control" placeholder="Поиск" title="Введите для поиска по Наименованию" type="text">    
		                        <div class="form-actions" style="margin: 5px">
		                            <button type="submit" class="btn btn-primary">НАЙТИ</button>
		                        </div>
		                    </div>
		                 </div>
		                <div class="col col-md-9  col-xs-8">
		                    <!--Body content-->
		                    <div class="btn-group" style="margin: 5px">
		                    <a href="#" class="btn btn-default" title="Ввод нового">&nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
		                    <a href="#" class="btn btn-default" title="Удалить">&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
		                </div>
		                    <div class="table-container">
		                    
		                    <table id="user_table" class="table table-striped table-bordered">
		                          <thead>
		                            <tr>
		                              <th><input type="checkbox"></th>
		                              <th>ФИО<span class="caret"></span></th>
		                              <th>Должность</th>
		                              <th>Роль</th>
		                              <th>E-mail</th>
		                              <th>Компания</th>
		                              <th>Порт</th>
		                              <th>Страна</th>
		                              <th>Примечания</th>
		                            </tr>
		                          </thead>
		                          <tbody>
								       <c:forEach var="user"  items="${userSearchCommand.userList}" >
					                       <tr>
					                       		<td><input type="checkbox"></td>
					                         	<td class="nowrap">
					                         		<a href="<c:url value="userEditAdmin?userId=${user.userId}"/>">Edit</a>&nbsp;
					                         		<a data-toggle="modal" href="#myModal">Edit(Modal)</a>&nbsp;
					                         		<c:out value="${user.firstName} ${user.lastName} ${user.middleInitial}"/>
					                         	</td>
					                         	<td class="nowrap"><c:out value="${user.occupationOther}"/></td>
					                         	<td class="nowrap"><c:out value="${user.role.role}"/></td>
					                         	<td class="nowrap"><c:out value="${user.userEmail}"/></td>
					                         	<td class="nowrap">1-я Стивидорная</td>
				                              	<td class="nowrap">С-Петербургский</td>
				                              	<td class="nowrap">Россия</td>
				                              	<td class="nowrap">Примечаю</td>
					                       </tr>
										</c:forEach>                              
		                          </tbody>
		                    </table>
		                    </div>
		                </div>
	                
		            </div>
		        </div>
		        </form:form>
		    </div>    
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
		
		
		  <!-- Modal -->
		  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">×</button>	
		          <h4 class="modal-title">Добавить Нового Пользователя</h4>
		        </div>
		        <div class="modal-body">
					 <!-- The async form to send and replace the modals content with its response -->
					<form id="ratting-form" class="contact" data-async data-target="#rating-modal" action="/userSearchAdmin" method="POST">
					<fieldset>
		               <div class="input-group" style="margin: 5px">
		                   <label class="form-label">Фамилия</label>
		                   <input class="form-control" placeholder="Фамилия" title="" type="text">
		                   <label class="form-label">Имя</label>
		                   <input class="form-control" placeholder="Имя" title="" type="text">
		                   <label class="form-label">Возраст</label>
		                   <input class="form-control" placeholder="Возраст" title="" type="text">
		                   <label class="form-label">Дата рождения</label>
		                   <input class="form-control" placeholder="Дата Рождения" title="" type="text">    
		                       
		                  </div>			
					</fieldset>
					</form>
		        </div>
		        <div class="modal-footer">
				    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				    <button form="ratting-form" class="btn btn-primary" type="submit">Save changes</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
	</body>
</html>

