<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>


<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Механизмы (устройства)</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>	    
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<jsp:include page="common/menu.jsp" />
			 <!-- Begin page content -->
	        <div class="container">
	            <div class="masthead">
	                <div class="container">
	                    <div class="row"><div class="col col-md-6"><h4 class="text-muted page-header">ПОДЪЕМНО-ТРАНСПОРТНОЕ ОБОРУДОВАНИЕ<br></h4></div></div>
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
		                    </select>
		                    <select class="form-control" style="margin: 5px">
		                    <option>Стивидор</option>
		                    <option>1-ая Стивидорная</option>
		                    <option>2-ая Стивидорная</option>
		                    <option>3-ая Стивидорная</option>
		                    </select>
		                    <select class="form-control" style="margin: 5px">
		                    <option>Группа</option>
		                    <option>Портальные краны</option>
		                    <option>2-ая Стивидорная</option>
		                    <option>3-ая Стивидорная</option>
		                    </select>
		                    <select class="form-control" style="margin: 5px">
		                    <option>Год выпуска</option>
		                    <option>1960</option>
		                    <option>1970</option>
		                    <option>1980</option>
		                    </select>
		                    <hr>
		                    <div class="input-group" style="margin: 5px">
		                        <input class="form-control" placeholder="Поиск" type="text">
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
		                              <th>Наименование&nbsp;<span class="caret"></span></th>
		                              <th>Модель
		                              </th>
		                              <th>Страна
		                              </th>
		                              <th>Количество</th>
		                            </tr>
		                          </thead>
		                          <tbody>
		                            <tr>
		                              <td>1</td>
		                              <td>Портальный кран АЛЬБАТРОС&nbsp; 10/20тн</td>
		                              <td>Колея 15,3м</td>
		                              <td>Россия</td>
		                              <td>2</td>
		                            </tr>
		                            <tr>
		                              <td>2</td>
		                              <td>Портальный кран АЛЬБАТРОС&nbsp; 10/20тн</td>
		                              <td>Колея 20,7м</td>
		                              <td>Россия</td>
		                              <td>1</td>
		                            </tr>
		                             <tr>
		                              <td>3</td>
		                              <td>Портальный кран ГАНЦ 5/6тн,30m 10/20тн</td>
		                              <td>Колея 30м</td>
		                              <td>Россия</td>
		                              <td>1</td>
		                            </tr>
		                            <tr>
		                              <td>4</td>
		                              <td>Портальный кран ГАНЦ 5/6тн, 10/20тн</td>
		                              <td>Колея 18,3м</td>
		                              <td>Россия</td>
		                              <td>3</td>
		                            </tr>
		                            <tr>
		                              <td>5</td>
		                              <td>Портальный кран ГАНЦ 5/6тн, 10/20тн</td>
		                              <td>Колея 15,3м</td>
		                              <td>Россия</td>
		                              <td>1</td>
		                            </tr>
		                            <tr>
		                              <td>6</td>
		                              <td>Портальный кран АЛЬБАТРОС&nbsp; 10/20тн</td>
		                              <td>Колея 15,3м</td>
		                              <td>Россия</td>
		                              <td>2</td>
		                            </tr>
		                            <tr>
		                              <td>7</td>
		                              <td>Портальный кран АЛЬБАТРОС&nbsp; 10/20тн</td>
		                              <td>Колея 20,7м</td>
		                              <td>Россия</td>
		                              <td>1</td>
		                            </tr>
		                             <tr>
		                              <td>8</td>
		                              <td>Портальный кран ГАНЦ 5/6тн,30m 10/20тн</td>
		                              <td>Колея 30м</td>
		                              <td>Россия</td>
		                              <td>1</td>
		                            </tr>
		                            <tr>
		                              <td>9</td>
		                              <td>Портальный кран ГАНЦ 5/6тн, 10/20тн</td>
		                              <td>Колея 18,3м</td>
		                              <td>Россия</td>
		                              <td>3</td>
		                            </tr>
		                            <tr>
		                              <td>10</td>
		                              <td>Портальный кран ГАНЦ 5/6тн, 10/20тн</td>
		                              <td>Колея 15,3м</td>
		                              <td>Россия</td>
		                              <td>1</td>
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

		</div> <!-- End Of Wrapper -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>