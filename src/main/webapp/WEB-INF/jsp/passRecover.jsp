<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Восстановление пароля.</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<!-- Begin page content -->
		    <div class="container">

			    <div class="container">
			      <div class="masthead">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			            <h4 class="text-muted page-header">ЗАПРОС НА ВОССТАНОВЛЕНИЕ ПАРОЛЯ<br></h4>
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ИМЯ</label>
			              <input class="form-control" name="name" title="Введите наименование" type="text">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ФАМИЛИЯ</label>
			              <input class="form-control" name="full-name" title="Введите полное наименование" type="text">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">E-MAIL</label>
			              <input type="email" class="form-control" name="email" title="Укажите свой e-mail">
			            </div>
			          </div>
			        </div>
			        
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        <label class="form-label">ПОРТ</label>
			          <select class="form-control" name="port">
			            <option>Санкт-Петербург</option>
			            <option>Высоцк</option>
			            <option>Приморский</option>
			          </select>
			          <p>&nbsp;</p> 
			        <label class="form-label">КОМПАНИЯ</label>
			          <select class="form-control" name="company">
			            <option>1-я Стивидорная</option>
			            <option>2-я Стивидорная</option>
			            <option>3-я Стивидорная</option>
			          </select>
			          <p>&nbsp;</p>
			        </div>
			      </div>
			    
			      </div>
			    <div class="container">
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1">
			          <div class="form-actions">
			            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmSend">ОТПРАВИТЬ »</button>
			            <button type="button" class="btn btn-default" 
			            	onclick="window.location.href = '<c:url value="login"/>';" 
			            	value="Klick">ОТМЕНИТЬ &raquo;
			            </button>
			          </div>
			        </div>
			      </div>
			    </div>
				<!-- 		Модальное окно подтверждения запроса восстановления пароля -->
					<div class="modal" id="confirmSend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title">ВНИМАНИЕ!</h4>
					      </div>
					      <div class="modal-body" align="center">
					        <h3>ЗАПРОС НА ВОССТАНОВЛЕНИЕ ПАРОЛЯ ПРИНЯТ!</h3>
					        <h5>В течение суток на ваш E-Mail будет выслана ссылка на форму смены пароля</h5>
					      </div>
					      <div class="modal-footer">
					        <a href="<c:url value="login" />" class="btn btn-primary" type="submit" class="btn btn-primary">ОК</a>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->	
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>