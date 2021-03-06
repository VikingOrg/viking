<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Редактирование данных пользователя</title>

        <jsp:include page="../common/headCoreElements.jsp" />
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

		<script>
		  $(document).ready(function() {
				$("#submit_avatar").click( function(e) {
					e.preventDefault();
 				    var formData = new FormData();
					formData.append('file', $('#lefile')[0].files[0]);
					formData.append("name", "name");
					$.ajax({
					       url: '${pageContext.request.contextPath}/fileController/avatar/${registrationCommand.user.userId}',
					       data: formData,
					       async: false,
					       contentType: false,
					       processData: false,
					       cache: false,
					       type: 'POST',
					       success: function(response) {
						       var newFileName = response[0].fileName;
					    	   $("#userImg").attr("src", "${pageContext.request.contextPath}/fileController/getUserImg/"+newFileName+"?timestamp=" + new Date().getTime());
					          alert('Успешно загружен!');
					       },
			               error: errorHandler = function() {
			                    alert("Файл успешно загрузился в черную дыру!");
			               },					       
					     });    return false;    
				});		  
		  });
	      
		</script>
		  
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">         
			        	<div class="form-group">
			            	<label class="form-label">Роль в системе</label>
							<form:select path="userRole" cssClass="form-control" tabindex="1">
							   <form:option value="3" label="Гость"/>
							   <form:option value="2" label="Пользователь"/>
							   <form:option value="1" label="Администратор"/>
							</form:select>			            	
			          	</div>
			</sec:authorize>     
					     <v:input path="user.lastName" label="Фамилия" required="true" title="Введите свою фамилию" tabindex="2"/>
					     <v:input path="user.firstName" label="Имя" required="true" title="Введите своё имя" tabindex="3"/>
						 <v:input path="user.middleInitial" label="Отчество" title="Введите своё отчество" tabindex="4"/>
						 <v:input path="user.userEmail" type="email" label="E-Mail" title="Укажите свой e-mail в качестве логина" tabindex="5"/>
			          
			          	 <c:if test="${registrationCommand.formType != 'E'}"> 
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
						 </c:if>
			          <c:if test="${registrationCommand.user.userId == userModel.userId}">
				          	<div class="form-group">
	 				            <div class="panel panel-default" style="margin-left: -15px; margin-right: -15px">
		                    		<div class="panel-heading">
										<label class="form-label">Изменить пароль.</label>
									</div>
									<div  class="panel-body">
										<v:input id="password" path="oldPassword" type="password" label="Старый Пароль" autocomplete="off"/>
										<v:input id="password" path="newPassword" type="password" label="Новый Пароль" autocomplete="off"/>
										<v:input id="password" path="newPasswordCheck" type="password" label="Повторите Новый Пароль" autocomplete="off"/>
					        		</div>
				        		</div>
				        	</div>			          
			          </c:if>
			          
			        </div>
			        <div class="col-sm-4 col-sm-offset-1">
				          
	    <sec:authorize access="hasRole('ROLE_ADMIN')">  
				          <label class="form-label">Компания</label>
							<form:select path="user.stevidorId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userStevidor}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.name}" />
				                </c:forEach>								
							</form:select>
				          <p>&nbsp;</p>
		</sec:authorize>
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
				        <%-- 
				        
			          	<div class="form-group">
 				            <div class="panel panel-default" style="margin-left: -15px; margin-right: -15px">
	                    		<div class="panel-heading">
									<label class="form-label">Загрузить аватар.</label>
								</div>
								<div  class="panel-body">
									<div class="input-append">
										<table>
										  <tr>
										    <td>
												<img alt="" id="userImg" src="<spring:url value="/fileController/getUserImg/${registrationCommand.user.img}" htmlEscape="true"/>"/>
										    </td>
										    <td class="nowrap">
										       <label>Выбрать файл для загрузки:</label><br>
										       <input id="lefile" type="file" style="display:none">
											    
											    <a class="col-sm-3 btn btn-primary" onclick="$('input[id=lefile]').click();">Открыть</a>
											    <div class="col-sm-7">
											    	<input id="photoCover" class="form-control" type="text">
											    </div>
											    <div class="col-sm-2">
											    	<input id="submit_avatar" type="submit" value="Загрузить" class="btn btn-primary"/>
											    </div>
										    </td>
										  </tr>
										</table>
									</div>
									<script type="text/javascript">
										$('input[id=lefile]').change(function() {
										$('#photoCover').val($(this).val());
										});
									</script>							       
 							        
				        		</div>
			        		</div>
			        	</div>	--%> 
			        						          
			        </div>
			      </div>
				
		    <div class="container">
		      <div class="row">
		        <div class="col-sm-10 col-sm-offset-1">
		          <div class="form-actions">
		          </br></br></br>
		            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Копировать</button> -->
		            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmSave">Сохранить</button>
		            
					<c:if test="${userModel.role.id != 1}">
						<a type="button" class="cancelbtn" onclick="window.location.href = '<c:url value="/home"/>';">Вернуться</a>
					</c:if>				            
					<c:if test="${userModel.role.id == 1}">
						<a type="button" class="cancelbtn" onclick="window.location.href = '<c:url value="/userSearchAdmin"/>';">Вернуться</a>
					</c:if>				            
		            	
		          </div>
		        </div>
		      </div>
		    </div>

			    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
			<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-body" align="center">
			        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</h4>
			      </div>
			      <div class="modal-footer">
			        <a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
			        <button type="submit" class="btn btn-primary">Сохранить</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->			    	
		
			</form:form>    
			</div> <!-- End of Main Container -->	
	</div> <!-- Closing div tag for wrap -->
		    <jsp:include page="../common/footer.jsp" />
</html>

