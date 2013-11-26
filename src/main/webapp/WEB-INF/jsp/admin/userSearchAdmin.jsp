<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Список Пользователей Системы</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>	 
	</head>

	<body>
		<!-- Wrap all page content here -->
		<form:form action="userSearchAdmin" commandName="UserSearchCommand" method="post" accept-charset="UTF-8">
		<div id="wrap">
		<jsp:include page="../common/menu.jsp" />
		  
		<!-- Begin page content -->
		<div class="container">
			<div class="container">
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
				            <label class="form-label">НАЙТИ</label>
				            <div class="input-group" style="margin: 5px">
				                <input class="form-control" placeholder="Поиск" type="text">
				                <span class="input-group-btn">
				                <button class="btn btn-default" type="button">&nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;</button>
				                </span>
				            </div>
				         </div>
				        <div class="col col-md-9  col-xs-8">
				            <!--Body content-->
				            <div class="btn-group" style="margin: 5px">
				             <a href="#" class="btn btn-default" title="Ввод нового">&nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
				             <a href="#" class="btn btn-default" title="Редактировать">&nbsp;<span class="glyphicon glyphicon-pencil"></span>&nbsp;</a>
				             
				             <a href="#" class="btn btn-default" title="Удалить">&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
				         </div>
				             <div class="table-responsive">
					             <div class="panel panel-default">
					             <table class="table table-striped" cellpadding="0" cellspacing="0" width="100%">
					                   <thead>
					                       <tr>
					                       <th>ID&nbsp;
					                       </th>
					                       <th>ФИО&nbsp;<span class="caret"></span></th>
					                       <th>Должность</th>
					                       <th>Роль</th>
					                     </tr>
					                   </thead>
					                   <tbody>
									       <c:forEach var="user"  items="${userSearchCommand.userList}" >
						                        <tr>
						                          <td><c:out value="${user.userId}"/></td>
						                          <td><c:out value="${user.firstName} ${user.lastName} ${user.middleInitial}"/><br></td>
						                          <td><c:out value="${user.occupationOther}"/></td>
						                          <td><c:out value="${user.role.role}"/></td>
						                        </tr>
											</c:forEach>
					                  </tbody>
					                </table>
					                
					                </div>
				                </div>
				                <div class="container">
				                    <div class="row">
				                        <div class="col col-md-12 text-center"> 
				                            <ul class="pagination">
				                            <li><a href="#">Назад</a>
				                            </li>
				                            <li><a href="#">1</a>
				                            </li>
				                            <li><a href="#">2</a>
				                            </li>
				                            <li><a href="#">3</a>
				                            </li>
				                            <li><a href="#">4</a>
				                            </li>
				                            <li><a href="#">5</a>
				                            </li>
				                            <li><a href="#">Следующая</a>
				                            </li>
				                            </ul>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
		  
		  			  
			</div>
		</div>

		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
		
		</form:form>
	</body>
</html>

