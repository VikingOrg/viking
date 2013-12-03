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
					<tbody>
                    	<tr>
			<td WIDTH=303 HEIGHT=23 ALIGN=LEFT>РАСПРЕДЕЛЕНИЕ ТЕХНИКИ ПОРТА ВЫБОРГСКИЙ ПО ГОДАМ</td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
			<td WIDTH=104 ALIGN=LEFT><BR></td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
			<td ALIGN=LEFT><BR></td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=CENTER><B>НАИМЕНОВАНИЕ</B></td>
			<td ALIGN=CENTER><B>ДО 1960</B></td>
			<td ALIGN=CENTER SDVAL="1960" SDNUM="1049;"><B>1960</B></td>
			<td ALIGN=CENTER SDVAL="1970" SDNUM="1049;"><B>1970</B></td>
			<td ALIGN=CENTER SDVAL="1980" SDNUM="1049;"><B>1980</B></td>
			<td ALIGN=CENTER SDVAL="1990" SDNUM="1049;"><B>1990</B></td>
			<td ALIGN=CENTER SDVAL="2000" SDNUM="1049;"><B>2000</B></td>
			<td ALIGN=CENTER SDVAL="2010" SDNUM="1049;"><B>2010</B></td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Портальный кран</B></td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="1" SDNUM="1049;">1</td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Полупортальный кран</B></td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
			<td ALIGN=CENTER SDVAL="7" SDNUM="1049;">7</td>
			<td ALIGN=CENTER SDVAL="1" SDNUM="1049;">1</td>
			<td ALIGN=CENTER SDVAL="1" SDNUM="1049;">1</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Пневмоколесный кран</B></td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Автомобильный кран</B></td>
			<td ALIGN=CENTER SDVAL="1" SDNUM="1049;">1</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="10" SDNUM="1049;">10</td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Железнодорожный кран</B></td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="4" SDNUM="1049;">4</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
			<td ALIGN=CENTER SDVAL="7" SDNUM="1049;">7</td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Мобильный кран</B></td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="4" SDNUM="1049;">4</td>
			<td ALIGN=CENTER SDVAL="4" SDNUM="1049;">4</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Гусеничный кран</B></td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="10" SDNUM="1049;">10</td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="4" SDNUM="1049;">4</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="8" SDNUM="1049;">8</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=LEFT VALIGN=MIDDLE><B>Плавучий кран</B></td>
			<td ALIGN=CENTER SDVAL="1" SDNUM="1049;">1</td>
			<td ALIGN=CENTER SDVAL="2" SDNUM="1049;">2</td>
			<td ALIGN=CENTER SDVAL="10" SDNUM="1049;">10</td>
			<td ALIGN=CENTER SDVAL="3" SDNUM="1049;">3</td>
			<td ALIGN=CENTER SDVAL="0" SDNUM="1049;">0</td>
			<td ALIGN=CENTER SDVAL="5" SDNUM="1049;">5</td>
			<td ALIGN=CENTER SDVAL="6" SDNUM="1049;">6</td>
		</tr>
		<tr>
			<td HEIGHT=23 ALIGN=CENTER><B>ВСЕГО</B></td>
			<td ALIGN=CENTER SDVAL="9" SDNUM="1049;"><B>9</B></td>
			<td ALIGN=CENTER SDVAL="27" SDNUM="1049;"><B>27</B></td>
			<td ALIGN=CENTER SDVAL="47" SDNUM="1049;"><B>47</B></td>
			<td ALIGN=CENTER SDVAL="31" SDNUM="1049;"><B>31</B></td>
			<td ALIGN=CENTER SDVAL="22" SDNUM="1049;"><B>22</B></td>
			<td ALIGN=CENTER SDVAL="13" SDNUM="1049;"><B>13</B></td>
			<td ALIGN=CENTER SDVAL="37" SDNUM="1049;"><B>37</B></td>
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