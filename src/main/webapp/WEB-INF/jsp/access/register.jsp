<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Регистрация</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" media="screen" href="resources/css/core.css"/>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>

	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
	    <div class="container">
	      <div class="masthead">
	        <div class="container">
	          <div class="col-md-10 col-md-offset-1">
	            <h4 class="text-muted page-header">ЗАПОЛНИТЕ ПОЖАЛУЙСТА ПОЛЯ</h4>
	          </div>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-md-4 col-md-offset-1">
	          <section>
	            <section>
	              <div class="form-group">
	                <label class="control-label">ИМЯ</label>
	                <div class="controls">
	                  <input type="text" class="form-control" name="name">
	                </div>
	              </div>
	            </section>
	          </section>
	          <div class="form-group">
	            <label class="control-label">ФАМИЛИЯ</label>
	            <div class="controls">
	              <input type="text" class="form-control" name="surname">
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 col-md-offset-1">
	          <label class="form-label">ПОРТ</label>
	          <select class="form-control" name="port">
	            <option>Порт 1</option>
	            <option>Порт 2</option>
	            <option>Порт 3</option>
	          </select>
	          <p>&nbsp;</p>
	          <label class="form-label">ДОЛЖНОСТЬ</label>
	          <select class="form-control" name="position">
	            <option>Инженер</option>
	            <option>Механик</option>
	            <option>Директор</option>
	          </select>
	          <p>&nbsp;</p>
	        </div>
	      </div>
	      <div class="row">
	        <div class="col-md-4 col-md-offset-1">
	          <section>
	            <section>
	              <div class="form-group">
	                <label class="control-label">E-MAIL</label>
	                <div class="controls">
	                  <input type="email" class="form-control" name="email">
	                </div>
	              </div>
	            </section>
	          </section>
	          <div class="form-group">
	            <label class="control-label">ПАРОЛЬ</label>
	            <div class="controls">
	              <input type="password" class="form-control" name="password">
	              <div class="checkbox">
	                <label>
	                  <input type="checkbox" value="true">Я СОГЛАСЕН С УСЛОВИЯМИ ПОЛЬЗОВАНИЯ</label>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 col-md-offset-1">
	          <section>
	            <section>
	              <h6>&nbsp;</h6>
	            </section>
	          </section>
	        </div>
	      </div>
	    </div>
	    <div class="container">
	      <div class="row">
	        <div class="col-md-2 col-md-offset-1">
	          <p><a class="btn btn-primary" href="#">ОТПРАВИТЬ &raquo;</a></p>
	        </div>
	        <div class="col-md-2 col-md-offset-1">
	          <p><a class="btn btn-default" href="#">ОТМЕНА &raquo;</a></p>
	        </div>
	      </div>
	    </div>
				
	  </div>
		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>