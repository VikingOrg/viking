<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Редактирование Механизмов</title>
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
				<form:form id="machine_edit_form" action="machineEdit" commandName="machineEditCommand" method="post" accept-charset="UTF-8">
			    <div class="container">
			      <div class="masthead">
			        <div class="container">
			          <div class="col-md-10 col-md-offset-1">
			      		<c:choose>
					      <c:when test="${registrationCommand.formType=='E'}">
					      	<h4 class="text-muted page-header">РЕДАКТИРОВАНИЕ МЕХАНИЗМА<br></h4>
					      </c:when>
					      <c:when test="${registrationCommand.formType=='C'}">
					      	<h4 class="text-muted page-header">КОПИРОВАНИЕ МЕХАНИЗМА<br></h4>
					      </c:when>					      
					      <c:otherwise>
							<h4 class="text-muted page-header">ДОБАВЛЕНИЕ МЕХАНИЗМА<br></h4>
					      </c:otherwise>
						</c:choose>
						
						<c:if test="${not empty error}"> 
							<div class="alert alert-danger show"><spring:message code="${error}" />
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>			
						</c:if>
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        
			          <spring:bind path="machine.model.name">
				        <div class="form-group ${status.error ? 'has-error' : ''}">
				        	<div class="controls">
					            <label class="form-label">НАИМЕНОВАНИЕ(Модели)</label>
					            <form:input path="machine.model.name" id="model_name" cssClass="form-control" title="Модель"/>
					            <form:errors for="model_name" class="control-label" path="machine.model.name"/>
				            </div>
				        </div>
				      </spring:bind>

			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ХАРАКТЕРИСТИКИ МОДЕЛИ</label>
			              <input type="email" class="form-control" name="details" title="Укажите характеристики модели">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			                <label class="form-label">ИНВЕНТАРНЫЙ №</label>
			              <input type="text" class="form-control" name="reg_number" title="Введите инвентарный номер">
			            </div>
			          </div>

			            <div class="form-group">
				            <div class="controls">
				            <label class="form-label">ДАТА ВВОДА ВЭКСПЛУАТАЦИЮ</label>
				              <input type="email" class="form-control" name="begin_date" title="Укажите дату ввода в эксплуатацию">
				            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			                <label class="form-label">КОНТРАКТ №</label>
			              <input type="password" class="form-control" title="Укажите документ ввода в эксплуатацию" name="doc">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ТРАНС №</label>
			              <input type="password" class="form-control" name="tranc" title="Укажите TRANC">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">ЗАВОДСКОЙ №</label>
			              <input type="password" class="form-control" name="serial" title="Укажите заводской номер">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">НОМЕНКЛАТУРНЫЙ №</label>
			              <input type="password" class="form-control" name="serial" title="Укажите заводской номер">
			            </div>
			          </div>
			          <div class="form-group">
			            <div class="controls">
			            <label class="form-label">РЕГИСТРАЦИОННЫЙ №</label>
			              <input type="password" class="form-control" name="serial" title="Укажите заводской номер">
			            </div>
			          </div>
			          
			        </div>
			        <div class="col-md-4 col-md-offset-1 col-xs-6">
			        	<div class="form-group">
				          <label class="form-label">ГРУППА</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>1-я Стивидорная</option>
				            <option>2-я Стивидорная</option>
				            <option>3-я Стивидорная</option>
				          </select>
			        	</div>
		        		
			        	<div class="form-group">
				          <label class="form-label">КОМПАНИЯ(Собственник)</label>
				          <select class="form-control" name="stevidor">
				          	<option>Выбрать</option>
				            <option>1-я Стивидорная</option>
				            <option>2-я Стивидорная</option>
				            <option>3-я Стивидорная</option>
				          </select>
			        	</div>			        		
			        	<div class="form-group">
				          <label class="form-label">ПРОИЗВОДИТЕЛЬ(Оборудования)</label>
				          <select class="form-control" name="manufacturer">
				          	<option>Выбрать</option>
				            <option>TOYOTA</option>
				            <option>LIEBHERR</option>
				            <option>HUYSTER</option>
				          </select>
			        	</div>			        		
			        	<div class="form-group">
			                <label class="form-label">ГОД ПРОИЗВОДСТВА</label>
			                <select class="form-control" name="prod_year">
				          		<option>Выбрать</option>
				                <option>1950</option>
				                <option>1960</option>
				                <option>1970</option>
			                </select>
			        	
			        	</div>			        		
			          	<div class="form-group">
			                <div class="controls">
			                  <label class="form-label">МЕСТО УСТАНОВКИ</label>
			                  <input type="password" class="form-control" title="Укажите место установки" name="location">
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
			            <button type="button" class="btn btn-default">ОТМЕНА &raquo;</button>
			          </div>
			        </div>
			      </div>
			    </div>
			</form:form>		
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>