<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Редактирование данных пользователя</title>
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    
	    <!--[if lt IE 9]>
			<script type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js.response.min.js"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/dataTables.tableTools.js" ></script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	        
		   <jsp:include page="../common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container">
			<spring:url var = "action" value='/userEditAdmin'/>
	  		<form:form id="userEditAdmin" action="${action}" commandName="registrationCommand" method="post" accept-charset="UTF-8">
			        <div class="row">
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${registrationCommand.formType=='E'}">
					      	<h3 class="page-header">Редактирование данных пользователя</h3>
					      </c:when>
					      <c:when test="${registrationCommand.formType=='C'}">
					      	<h3 class="page-header">Копирование данных пользователя</h3>
					      </c:when>					      
					      <c:otherwise>
							<h3 class="page-header">Добавление пользователя</h3>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>
						</div>									          
			          </div>
			      <div class="row">
			        <div class="col-sm-4 col-sm-offset-1">
			        	<div class="form-group">
			            	<label class="form-label">Роль в системе</label>
							<form:select path="userRole" cssClass="form-control">
							   <form:option value="3" label="Не зарегистрирован"/>
							   <form:option value="2" label="Пользователь"/>
							   <form:option value="1" label="Администратор"/>
							</form:select>			            	
			          	</div>
				     
				     <v:input path="user.lastName" label="Фамилия" required="true" title="Введите свою фамилию"/>
				     <v:input path="user.firstName" label="Имя" required="true" title="Введите своё имя"/>
					 <v:input path="user.middleInitial" label="Отчество" title="Введите своё отчество"/>
					 <v:input path="user.userEmail" type="email" label="E-Mail" title="Укажите свой e-mail в качестве логина"/>
			          
			          <div class="form-group">
			            <div class="controls">
			                <label class="form-label">Пароль</label>
			                <form:input path="user.password" type="password" cssClass="form-control" title="Укажите пароль для входа"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">Повторите пароль</label>
			            	<form:input path="pswordCheck" type="password" cssClass="form-control" title="Повторно укажите пароль"/>
			            </div>
			          </div>
			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
			        	<label class="form-label">Страна</label>
						<form:select path="user.countryId" cssClass="form-control"> 
			                <c:forEach items="${registrationCommand.userCountry}" var="country">
			                    <form:option value="${country.key}" label="${country.value.nameRus}" />
			                </c:forEach>
						</form:select>
			          	<p>&nbsp;</p>
				          <label class="form-label">Порт</label>
							<form:select path="user.portId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userPort}" var="port">
				                    <form:option value="${port.key}" label="${port.value.name}" />
				                </c:forEach>							
							</form:select>		          
				          <p>&nbsp;</p>
				          <label class="form-label">Компания</label>
							<form:select path="user.stevidorId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userStevidor}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.fullName}" />
				                </c:forEach>								
							</form:select>
				          <p>&nbsp;</p>

			           <div class="form-group">
			            <div class="controls">
			              <label class="form-label">Подразделение</label>
	 		              <form:input path="user.division" type="text" cssClass="form-control" title="Подразделение"/>
			            </div>
			          	</div>
			          <div class="form-group">
			            <label class="form-label">Должность</label>
			            <div class="controls">
			                <form:input path="user.occupation" cssClass="form-control" title="Должность"/>
			            </div>
			          </div>
			          <div class="form-group">
			            <label class="form-label">Примечания</label>
			            <div class="controls">
			            	<form:textarea path="user.userNote" rows="3" cssClass="form-control"/>
			            </div>
			          </div>
			        </div>
			      </div>
				
		    <div class="container">
		      <div class="row">
		        <div class="col-sm-10 col-sm-offset-1">
		          <div class="form-actions">
		            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Копировать</button>
		            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
		            <a type="button" class="cancelbtn" 
		            	onclick="window.location.href = '<c:url value="/userSearchAdmin"/>';" 
		            	value="Klick">Вернуться</a>
		          </div>
		        </div>
		      </div>
		    </div>
		    	
		
			</form:form>    
			</div> <!-- End of Main Container -->	
	</div> <!-- Closing div tag for wrap -->
		    <jsp:include page="../common/footer.jsp" />

	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="../../static/css/core.css"/>

	    <script type="text/javascript" src="../../static/js.response.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="../../static/js/ajax-form.js" ></script>

	</body>
</html>

