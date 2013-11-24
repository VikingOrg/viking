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
	            <div class="masthead">
	                <div class="container">
	                    <h4 class="text-muted page-header">СПИСОК СТИВИДОРНЫХ КОМПАНИЙ<br></h4>
	                </div>
	            </div>
	        
		        <div class="container-fluid">
		            <div class="row-fluid">
		                 <div class="col col-md-2">
		                     <!--Sidebar content-->
		                    <h4>Фильтр&nbsp;<span class="glyphicon glyphicon-list"></span></h4>
		                    
		                    <select class="form-control" style="margin: 5px">
		                    <option>Страна</option>
		                    <option>Россия</option>
		                    <option>Украина</option>
		                    <option>Латвия</option>
		                    </select>
		                    <select class="form-control" style="margin: 5px">
		                    <option>Порт</option>
		                    <option>С-Петербургский</option>
		                    <option>Высоцкий</option>
		                    <option>Находкинский</option>
		                    </select><hr>
		                    <div class="input-group" style="margin: 5px">
		                        <input type="text" class="form-control" placeholder="Поиск">
		                        <span class="input-group-btn">
		                        <button class="btn btn-default" type="button">&nbsp;<span class="glyphicon glyphicon-search"></span>&nbsp;</button>
		                        </span>
		                    </div>
		                 </div>
		                <div class="col col-md-10">
		                    <!--Body content-->
		                    <div class="btn-group" style="margin: 5px">
		                    <a href="#" class="btn btn-default" title="Ввод нового">&nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
		                    <a href="#" class="btn btn-default" title="Редактировать">&nbsp;<span class="glyphicon glyphicon-pencil"></span>&nbsp;</a>
		                    <a href="#" class="btn btn-default" title="Сохранить">&nbsp;<span class="glyphicon glyphicon-ok"></span>&nbsp;</a>
		                    <a href="#" class="btn btn-default" title="Удалить">&nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
		                </div>
		                <div class="table-responsive">
		                    <table class="table table-striped" cellpadding="0" cellspacing="0" width="100%">
		                          <thead>
		                              <tr>
		                              <th>ID&nbsp;
		                              </th>
		                              <th>Порт&nbsp;
		                                <span class="caret"></span>
		                              </th>
		                              <th>Наименование
		                              </th>
		                              <th>Страна&nbsp;
		                              </th>
		                              <th>Примечания</th>
		                            </tr>
		                          </thead>
		                          <tbody>
		                            <tr>
		                              <td>1</td>
		                              <td>Порт 1</td>
		                              <td>1-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Балтика</td>
		                            </tr>
		                            <tr>
		                              <td>2</td>
		                              <td>Порт 2</td>
		                              <td>2-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>3</td>
		                              <td>Порт 3</td>
		                              <td>3-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>4</td>
		                              <td>Порт 4</td>
		                              <td>4-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>5</td>
		                              <td>Порт 5</td>
		                              <td>5-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>6</td>
		                              <td>Порт 6</td>
		                              <td>6-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>7</td>
		                              <td>Порт 7</td>
		                              <td>7-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>8</td>
		                              <td>Порт 8</td>
		                              <td>8-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>9</td>
		                              <td>Порт 9</td>
		                              <td>9-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                            <tr>
		                              <td>10</td>
		                              <td>Порт 10</td>
		                              <td>10-я Стивидорная</td>
		                              <td>Россия</td>
		                              <td>Северное море</td>
		                            </tr>
		                          </tbody>
		                    </table>
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

		</div> <!-- Wrapper end -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>