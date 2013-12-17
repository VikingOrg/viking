<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Стивидоров</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="static/css/page.css">
		<link rel="stylesheet" type="text/css" href="static/css/table.css">
		<style type="text/css" title="currentStyle">
			@import "static/css/ColVis.css";
		</style>

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.js"></script>
	    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/ColVis.js"></script>
		
		
		<script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
            	$('#stevidor_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               null,
                	               { "bSortable": false },
                	           ],
                	           "sDom": 'C<"clear">lrtip',
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sUrl": "static/js/ru_RU.txt"
                     }                    
                } );

            } );

    
        </script>
        <style type="text/css">
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
	<body class="">
        <div class="container-fluid">
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
                    <option>Выбрать</option>
                    <option>Россия</option>
                    <option>Украина</option>
                    <option>Латвия</option>
                    </select>
                    <label class="form-label">ПОРТ</label>
                    <select class="form-control" style="margin: 5px">
                    <option>Выбрать</option>
                    <option>С-Петербург</option>
                    <option>Высоцкий</option>
                    <option>Находкинский</option>
                    </select>
                    <hr>
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
                            <a href="#" class="btn btn-primary" title="Ввод нового">Новый &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
                            <a href="#" class="btn btn-primary" title="Удалить">Копия &nbsp;<span class="glyphicon glyphicon-fullscreen"></span>&nbsp;</a>
                            <a href="#" class="btn btn-primary" title="Удалить">Удалить &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
                </div>
                <div class="table-container">
                    <table class="table table-bordered" id="stevidor_table">
                          <thead>
                              <tr>
                              <th><input type="checkbox"></th>
                              <th>Стивидорная компания</th>
							  <th>Порт</th>
                              <th>Страна</th>
                              <th>Примечания</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td><input type="checkbox"></td>
                              <td>Петролеспорт</td>
                              <td>С-Петербург</td>
                              <td>Россия</td>
                              <td> </td>
                            </tr>
                            <tr>
                              <td><input type="checkbox"></td>
                              <td>Морпорт С-Петербург</td>
                              <td>С-Петербург</td>
                              <td>Россия</td>
                              <td></td>
                            </tr>
                            
                          </tbody>
                    </table>
                    </div>
                    </div>
            </div>
        </div>
    </div>




</body>
</html>