<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование стивидора</title>
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
			          <div class="col-md-10 col-md-offset-1">
			            <h4 class="text-muted page-header">ЗАПОЛНИТЕ ПОЖАЛУЙСТА ПОЛЯ</h4>
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">НАИМЕНОВАНИЕ</label>
			              <input type="text" class="form-control" name="name" title="Введите наименование">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ПОЛНОЕ НАИМЕНОВАНИЕ</label>
			              <input type="text" class="form-control" name="full-name" title="Введите полное наименование">
			            </div>
			          </div>
			        </div>
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        <label class="form-label">СТРАНА</label>
			          <select class="form-control" name="country">
			            <option>Россия</option>
			            <option>Украина</option>
			            <option>Латвия</option>
			          </select>
			          <p>&nbsp;</p>
			        <label class="form-label">ПОРТ</label>
			          <select class="form-control" name="port">
			            <option>Санкт-Петербург</option>
			            <option>Высоцк</option>
			            <option>Приморский</option>
			          </select>
			          <p>&nbsp;</p>  
			            <div class="form-group">
			            <div class="controls">
			                <label class="form-label">ПРИМЕЧАНИЯ</label>
			              <input type="text" class="form-control" name="comments" title="Комментарии">
			            </div>
			            </div>
			        </div>
			      </div>
			    </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1">
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary">СОХРАНИТЬ &raquo;</button>
			            <button type="button" class="btn">ОТМЕНА &raquo;</button>
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