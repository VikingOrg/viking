
<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Стивидоров</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"/>
		<style type="text/css" title="currentStyle">
			@import "static/css/ColVis.css";
		</style>
		  <style type="text/css">
			table {
                margin: 1em 0;
                clear: both;
            }
			th {
            text-align: center;
            white-space:nowrap;
          }
          	td {
            white-space:nowrap;
          }
        </style>
		

		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.js"></script>
	    <script type="text/javascript" src="ttp://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/ColVis.js"></script>
		
		
		<script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
            	$('#stevidor_table').dataTable( {
                	           "sDom": 'C<"clear">lrtip',
                } );

            } );

    
        </script>
      
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