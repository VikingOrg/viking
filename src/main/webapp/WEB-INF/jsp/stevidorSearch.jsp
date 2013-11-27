<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Титул</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
	        <div class="container">
		        <div class="container">
		            <div class="row">
		                    <h4 class="text-muted page-header">СПИСОК СТИВИДОРНЫХ КОМПАНИЙ<br></h4>
		            </div>
		        
		        <div class="container">
		            <div class="row">
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
		                        <input class="form-control" placeholder="Поиск" title="Введите для поиска по Наименованию" type="text">
		                        <div class="form-actions" style="margin: 5px">
		                            <button type="submit" class="btn btn-primary">НАЙТИ</button>
		                        </div>
		                    </div>
		                 </div>
		                <div class="col col-md-9 col-xs-8">
		                    <!--Body content-->
		                    <div class="btn-group" style="margin: 5px">
		                    <a href="#" class="btn btn-default" title="Ввод нового">&nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
		                    <a href="#" class="btn btn-default" title="Удалить">&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
		                </div>
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