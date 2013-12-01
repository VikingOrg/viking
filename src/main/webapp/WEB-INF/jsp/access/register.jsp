<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="ru">
	<head>
	    <title>Регистрация</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta name="viewport" content="width=device-width">
	    <meta name="author" content="Viking Inc.">
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
		  <form:form id="registration" action="register" commandName="registrationCommand" method="post" accept-charset="UTF-8">

		    <div class="container">
		      <div class="masthead">
		        <div class="container">
		          <div class="col-md-10 col-md-offset-1">
		          
		            <h4 class="text-muted page-header">ЗАПОЛНИТЕ ПОЛЯ ФОРМЫ РЕГИСТРАЦИИ</h4>
		          </div>
		        </div>
		      </div>
		      <div class="row">
		        <div class="col-md-4 col-md-offset-1 col-xs-6">
		          <div class="form-group">
		            <div class="controls">
		            	<label class="form-label">ФАМИЛИЯ</label>
		            	<form:input path="user.lastName" cssClass="form-control" title="Введите свою фамилию"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ИМЯ</label>
		                <form:input path="user.firstName" cssClass="form-control" title="Введите своё имя"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ОТЧЕСТВО</label>
		            	<form:input path="user.middleInitial" cssClass="form-control" title="Введите своё отчество"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		            <label class="form-label">E-MAIL</label>
		              <form:input path="user.userEmail" type="email" cssClass="form-control"title="Укажите свой e-mail в качестве логина"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ПАРОЛЬ</label>
		              <form:input path="user.password" type="password" cssClass="form-control" title="Укажите пароль для входа"/>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		            <label class="form-label">ПОВТОРИТЕ ПАРОЛЬ</label>
		            	<form:input path="pswordCheck" type="password" cssClass="form-control" title="Повторно укажите пароль"/>
		            </div>
		          </div>
		          <div class="checkbox">
		            <label>
		              <input type="checkbox" value="true">Я СОГЛАСЕН С УСЛОВИЯМИ ПОЛЬЗОВАНИЯ *</label>
		          </div>
		        </div>
		        <div class="col-md-4 col-md-offset-1 col-xs-6">
		          <label class="form-label">ПОРТ</label>
					<form:select path="user.portId" cssClass="form-control">
					    <form:options items="${registrationCommand.userPort}" />
					</form:select>		          
		          <p>&nbsp;</p>
		          <label class="form-label">КОМПАНИЯ</label>
					<form:select path="user.stevedorId" cssClass="form-control">
					    <form:options items="${registrationCommand.userStevedor}" />
					</form:select>
		          <p>&nbsp;</p>
		          <%-- <label class="form-label">ДОЛЖНОСТЬ</label>
					<form:select path="user.occupationId" cssClass="form-control">
					    <form:options items="${registrationCommand.userOccupation}" />
					</form:select>
		          <p>&nbsp;</p> --%>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ПОДРАЗДЕЛЕНИЕ</label>
<%-- 		              <form:input path="user.occupationDivision" type="text" cssClass="form-control" title="Подразделение"/> --%>
		            </div>
		          </div>
		          <div class="form-group">
		            <div class="controls">
		                <label class="form-label">ДОЛЖНОСТЬ</label>
		              <form:input path="user.occupationOther" type="text" cssClass="form-control" title="Должность"/>
		            </div>
		          </div>		          
		          
		        </div>
		      </div>
		      
		    </div>

		    <div class="container">
		      <div class="row">
		        <div class="col-md-4 col-md-offset-1">
		          <div class="form-actions">
		            <button type="submit" class="btn btn-primary data-toggle="modal" data-target="#userRegistered">ОТПРАВИТЬ &raquo;</button>
		            <button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="login"/>';" 
		            	value="Klick">ОТМЕНИТЬ &raquo;</button>
		          </div>
		          	<div class="row text-left">
		            	<p>&nbsp;</p>
		            	<a href="#">* УСЛОВИЯ ПОЛЬЗОВАНИЯ</a>
		            </div>
		        </div>
		      </div>
		    </div>
		  	<div class="modal fade" id="userRegistered" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		      <div class="modal-dialog">
		        <div class="modal-content">
		          <div class="modal-header alert alert-success">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		            <h4 class="modal-title" id="myModalLabel">&nbsp;</h4>
		          </div>
		          <div class="modal-body text-center">
		          <h3>УЧЕТНАЯ ЗАПИСЬ УСПЕШНО СОЗДАНА!</h3>
		          <p>В течение суток на E-Mail будет выслано подтверждение о регистрации</p>
		          </div>
		          <div class="modal-footer">
		            <button type="button" class="btn btn-primary" data-dismiss="modal">ОК</button>
		          </div>
		        </div><!-- /.modal-content -->
		      </div><!-- /.modal-dialog -->
		    </div><!-- /.modal -->
		  </form:form>
		  </div>
	  	</div><!-- End of wrapper-->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>