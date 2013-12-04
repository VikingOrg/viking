<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Редактирование данных пользователя</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>	
	</head>

	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<jsp:include page="../common/menu.jsp" />
			<!-- Begin page content -->
	  		<div class="container">
	  		<form:form id="registration" action="userEditAdmin" commandName="registrationCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
			      <div class="masthead">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${registrationCommand.editForm}">
					      	<h4 class="text-muted page-header">РЕДАКТИРОВАНИЕ ДАННЫХ ПОЛЬЗОВАТЕЛЯ<br></h4>
					      </c:when>
					      <c:otherwise>
							<h4 class="text-muted page-header">ДОБАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯ<br></h4>
					      </c:otherwise>
						</c:choose>			          
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        	<div class="form-group">
			            	<label class="form-label">РОЛЬ В СИСТЕМЕ</label>
							<form:select path="userRole" cssClass="form-control">
							   <form:option value="3" label="НЕ ЗАРЕГИСТРИРОВАН"/>
							   <form:option value="2" label="ПОЛЬЗОВАТЕЛЬ"/>
							   <form:option value="1" label="АДМИНИСТРАТОР"/>
							</form:select>			            	
			          	</div>
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
			            	<form:input path="user.userEmail" type="email" cssClass="form-control" title="Укажите свой e-mail в качестве логина"/>
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
			        </div>
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        <label class="form-label">СТРАНА</label>
			          <select class="form-control" name="port">
			          	<option>Выберите</option>
			            <option>Россия</option>
			            <option>Украина</option>
			            <option>Латвия</option>
			          </select>
			          <p>&nbsp;</p>
			          <label class="form-label">ПОРТ</label>
			          <select class="form-control" name="port">
			          	<option>Выберите</option>
			            <option>Порт 1</option>
			            <option>Порт 2</option>
			            <option>Порт 3</option>
			          </select>
			          <p>&nbsp;</p>
			          <label class="form-label">КОМПАНИЯ</label>
			          <select class="form-control" name="stevedor">
			          	<option>Выберите</option>
			            <option>1-я Стивидорная</option>
			            <option>2-я Стивидорная</option>
			            <option>3-я Стивидорная</option>
			          </select>
			          <p>&nbsp;</p>
			           <div class="form-group">
			            <div class="controls">
			              <label class="form-label">ПОДРАЗДЕЛЕНИЕ</label>
	 		              <form:input path="user.division" type="text" cssClass="form-control" title="Подразделение"/>
			            </div>
			          	</div>
			          <div class="form-group">
			            <label class="form-label">ДОЛЖНОСТЬ</label>
			            <div class="controls">
			                <form:input path="user.occupation" cssClass="form-control"title="Должность"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <label class="form-label">ПРИМЕЧАНИЯ</label>
			            <div class="controls">
			                <textarea class="form-control" name="comments" title="Примечания" rows="3">
			                </textarea>
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
		            <button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="userSearchAdmin"/>';" 
		            	value="Klick">ВЕРНУТЬСЯ &raquo;</button>
		          </div>
		        </div>
		      </div>
		    </div>
			</form:form>    
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="../common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>

