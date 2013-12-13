<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Таблица подъемно-транспортного оборудования</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		<jsp:include page="common/menu.jsp" />
			<!-- Begin page content -->
		    <div class="container">

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
                 <div class="col col-md-3 col-xs-4">
                     <!--Sidebar content-->
                    <h4>Фильтр&nbsp;<span class="glyphicon glyphicon-list"></span></h4>
                    <label class="form-label">СТРАНА</label>
                    <select class="form-control" style="margin: 5px" title="Выборка по странам">
                    <option>Россия</option>
                    <option>Украина</option>
                    <option>Латвия</option>
                    </select>
                    <label class="form-label">ПОРТ</label>
                    <select class="form-control" style="margin: 5px" title="Выборка по Порту размещения">
                    <option>С-Петербургский</option>
                    <option>Высоцкий</option>
                    <option>Находкинский</option>
                    </select>
                    <label class="form-label">КОМПАНИЯ</label>
                    <select class="form-control" style="margin: 5px" title="Выборка по собственнику">
                    <option>1-ая Стивидорная</option>
                    <option>2-ая Стивидорная</option>
                    <option>3-ая Стивидорная</option>
                    </select>
                    <label class="form-label">ГРУППА</label>
                    <select class="form-control" style="margin: 5px" title="Выборка по группе механизмов">
                    <option>Портальные краны</option>
                    <option>Автомобильные краны</option>
                    <option>Железнодорожные краны</option>
                    </select>
                    <label class="form-label">ГОД ВЫПУСКА</label>
                    <select class="form-control" style="margin: 5px" title="Выборка по году выпуска">
                    <option>1950</option>
                    <option>1960</option>
                    <option>1970</option>
                    <option>1980</option>
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
                <div class="col col-md-9  col-xs-8">
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
                              <th>Наименование&nbsp;<span class="caret"></span></th>
                              <th>Производитель</th>
                              <th>Модель</th>
                              <th>Кол-во</th>
                              <th>Год выпуска</th>
                              <th>Дата ввода в эксплуатацию</th>
                              <th>Документ ввода в эксплуатацию</th>
                              <th>Инв. номер</th>
                              <th>TRANC</th>
                              <th>Зав. номер</th>
                              <th>Место установк</th>
                              <th>Группа</th>
                              <th>Компания</th>
                              <th>Порт</th>
                              <th>Страна</th>
                              <th>Примечания</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td><input type="checkbox"></td>
                              <td class="nowrap">
	                         		<a href="<c:url value="deviceEdit?deviceId=1"/>">Edit</a>&nbsp;
	                         		<c:out value="Портальный кран АЛЬБАТРОС&nbsp; 10/20тн"/>                              
                              </td>
                              <td class="nowrap">Kranbau</td>
                              <td class="nowrap">Колея 15,3м</td>
                              <td class="nowrap">2</td>
                              <td class="nowrap">1960</td>
                              <td class="nowrap">01.04.1999</td>
                              <td class="nowrap">№123</td>
                              <td class="nowrap">87087134</td>
                              <td class="nowrap">-193248-10923</td>
                              <td class="nowrap">98798999</td>
                              <td class="nowrap">1-ый причал</td>
                              <td class="nowrap">Портальные краны</td>
                              <td class="nowrap">1-я Стивидорная</td>
                              <td class="nowrap">С-Петербургский</td>
                              <td class="nowrap">Россия</td>
                              <td class="nowrap">Работает хорошо</td>
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


					
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>