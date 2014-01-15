<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<html lang="ru">
	<head>
	    <title>Регистрационная форма</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta name="viewport" content="width=device-width">
	    <meta name="author" content="Viking Inc.">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	    <script src="static/js/jqBootstrapValidation.js"></script>
	    <script type="text/javascript" src="static/js/jquery.complexify.js"></script>

		<script>
		  $(function () { $("input,select,textarea").jqBootstrapValidation(); } );
		</script>	
		<script type="text/javascript">
		$(document).ready(function() {
		    $(function () {
		        $("#password").complexify({}, function (valid, complexity) {
		            if (!valid) {
		                $('#progress').css({'width':complexity + '%'}).removeClass('progressbarValid').addClass('progressbarInvalid');
		            } else {
		                $('#progress').css({'width':complexity + '%'}).removeClass('progressbarInvalid').addClass('progressbarValid');
		            }
		            $('#complexity').html(Math.round(complexity) + '%');
		        });
		    });
		    
        } );	    
		</script>



<style type="text/css">
    #progressbar {
        width:350px;
        height:48px;
        display:block;
        border-left:1px solid #ccc;
        border-right:1px solid #ccc;
        border-top:1px solid #ccc;
        border-top-right-radius: 8px;
        border-top-left-radius: 8px;
        overflow:hidden;
        background-color: white;
    }

    #progress {
        display:block;
        height:100px;
        width:0%;
    }

    .progressbarValid {
        background-color:green;
        background-image: -o-linear-gradient(-90deg, #8AD702 0%, #389100 100%);
      background-image: -moz-linear-gradient(-90deg, #8AD702 0%, #389100 100%);
      background-image: -webkit-linear-gradient(-90deg, #8AD702 0%, #389100 100%);
      background-image: -ms-linear-gradient(-90deg, #8AD702 0%, #389100 100%);
      background-image: linear-gradient(-90deg, #8AD702 0%, #389100 100%);
    }

    .progressbarInvalid {
        background-color:red;
        background-image: -o-linear-gradient(-90deg, #F94046 0%, #92080B 100%);
      background-image: -moz-linear-gradient(-90deg, #F94046 0%, #92080B 100%);
      background-image: -webkit-linear-gradient(-90deg, #F94046 0%, #92080B 100%);
      background-image: -ms-linear-gradient(-90deg, #F94046 0%, #92080B 100%);
      background-image: linear-gradient(-90deg, #F94046 0%, #92080B 100%);
    }

    #status {
        height:100px;
        width:350px;
        border:1px solid #ccc;
        border-bottom-right-radius: 8px;
        border-bottom-left-radius: 8px;
        background-color: white;
    }

    #complexityLabel {
        width:100%;
        text-align:center;
        margin-top:8px;
        font-size:20px;
        line-height:20px;
    }

    #complexity {
        width:100%;
        text-align:center;
        font-family:"Helvetica Neue", "Helvetica", Arial, sans-serif;
        font-weight:bold;
        font-size:40px;
        line-height:40px;
        margin-top:8px;
    }
.input-recaptcha {
width:50px;

.btn-group-custom .btn {
  border-right-width: 0;
}

.btn-group-custom .btn:hover {
  border-right-width: 1px;
}
.btn-group-custom .btn:hover + .btn{
  border-left-width: 0;
}

}
</style>			
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
   		  <!-- Begin page content -->
		  <div class="container">
		  <spring:url var = "action" value='/register'/>
		  <form:form id="registration" action="${action}" commandName="registrationCommand" method="post" accept-charset="UTF-8">
		    <div class="container">
		      <div class="masthead">
		        <div class="container">
		          <div class="col-md-10 col-md-offset-1">
		            <h4 class="text-muted page-header">ЗАПОЛНИТЕ ПОЛЯ ФОРМЫ РЕГИСТРАЦИИ</h4>
		            
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
					<v:input path="user.lastName" label="ФАМИЛИЯ" required="true" title="Введите свою фамилию"/>
					<v:input path="user.firstName" label="ИМЯ" required="true" title="Введите своё имя"/>
					<v:input path="user.middleInitial" label="ОТЧЕСТВО" title="Введите своё отчество"/>
					<v:input path="user.userEmail" type="email" label="E-MAIL" title="Укажите свой e-mail в качестве логина"/>		
					<v:input id="password" path="user.password" type="password" label="ПАРОЛЬ" title="Укажите пароль для входа"/>
				    <div id="progressbar"><div id="progress"></div></div>

					<div class="form-group">
					    <div id="status">
					        <div id="complexity">0%</div>
					        <div id="complexityLabel">Индекс Сложности</div>
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
		  			<div class="form-group">
			            <div class="controls">
				        	<label class="form-label">СТРАНА</label>
							<form:select path="user.countryId" cssClass="form-control"> 
				                <c:forEach items="${registrationCommand.userCountry}" var="country">
				                    <form:option value="${country.key}" label="${country.value.nameRus}" />
				                </c:forEach>
							</form:select>
			            </div>
		          	</div>      
					
			        <div class="form-group">
			        	<div class="controls">
				        	<label class="form-label">ПОРТ</label>
							<form:select path="user.portId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userPort}" var="port">
				                    <form:option value="${port.key}" label="${port.value.name}" />
				                </c:forEach>							
							</form:select>	
			            </div>
			        </div>

			        <div class="form-group">
			        	<div class="controls">
				        	<label class="form-label">КОМПАНИЯ</label>
							<form:select path="user.stevidorId" cssClass="form-control">
				                <c:forEach items="${registrationCommand.userStevidor}" var="stevidor">
				                    <form:option value="${stevidor.key}" label="${stevidor.value.name}" />
				                </c:forEach>								
							</form:select>			        	
			        	</div>
			        </div>		          

		          <div class="form-group">
		            <div class="controls">
		              <label class="form-label">ПОДРАЗДЕЛЕНИЕ</label>
 		              <form:input path="user.division" type="text" cssClass="form-control" title="Подразделение"/>
		            </div>
		          </div>
		          <div class="form-group">
		          
		            <div class="controls">
		                <label class="form-label">ДОЛЖНОСТЬ</label>
		              <form:input path="user.occupation" type="text" cssClass="form-control" title="Должность"/>
		            </div>
		          </div>
		          		          
		          	 <script type="text/javascript">
					     var RecaptchaOptions = {
					        theme : 'custom',
					        custom_theme_widget: 'recaptcha_widget'
					     };
					</script>        
                      
                      <div id="recaptcha_widget" style="display:none">

                        <div class="form-group">
                            <label class="form-label">ПРОВЕРКА РЕГИСТРАЦИИ</label>
                            <div class="controls">
                                <a id="recaptcha_image" href="#" class="thumbnail"></a>
                                <div class="recaptcha_only_if_incorrect_sol" style="color:red">Incorrect please try again</div>
                            </div>
                        </div>

                        <div class="form-group">
                              <label class="recaptcha_only_if_image control-label">Впечатайте текст с изображения:</label>
                              <label class="recaptcha_only_if_audio control-label">Введите цифры, которые вы услышали:</label>

								<div class="controls">
									<spring:bind path="recaptcha_response_field">
									    <div class="input-group ${status.error ? 'has-error' : '' }">
										    <div class="input-group input-group-sm ">
									            	<form:input 
										            	id="recaptcha_response_field" 
										            	path="recaptcha_response_field" 
										            	cssClass="form-control"
										            	type="text"
										            	title="Впечатайте текст с картинки"
										            	style="width: 250px;"
										            	placeholder="Впечатайте текст с картинки"/>										    
										        <span class="input-group-btn btn-group-custom">

												
												    <a class="btn btn-default btn-sm" href="javascript:Recaptcha.reload()"><span class="glyphicon glyphicon-refresh"></span></a>
												    <a class="btn btn-default btn-sm recaptcha_only_if_image" href="javascript:Recaptcha.switch_type('audio')"><span class="glyphicon glyphicon-headphones"></span></a>
												    <a class="btn btn-default btn-sm recaptcha_only_if_audio"  href="javascript:Recaptcha.switch_type('image')"><span class="glyphicon glyphicon-picture"></span></a>
												    <a class="btn btn-default btn-sm" href="javascript:Recaptcha.showhelp()"><span class="glyphicon glyphicon-question-sign"></span></a>
												</span>
										    </div>
										    <form:errors path="recaptcha_response_field" cssClass="control-label error"/>
								    	</div>
								    </spring:bind>								    
                              </div>
                              
                        </div>

                    </div>

					<script type="text/javascript" src="https://www.google.com/recaptcha/api/challenge?k=6LcPCO0SAAAAAJyY9a_7lV8-t1CYfhjPc6C45fat"></script>
					<noscript>
						<iframe src="<?php echo $recaptcha_noscript_url; ?>"
							height="330" width="500" frameborder="0">
						</iframe><br>
						<textarea name="recaptcha_challenge_field" rows="4" cols="40">
						</textarea>
						<input type="hidden" name="recaptcha_response_field" value="manual_challenge">
					</noscript>
		          
		        </div>
		      </div>
		      
		    </div>

		    <div class="container">
		      <div class="row">
		        <div class="col-md-4 col-md-offset-1">
		          <div class="form-actions">
		          	<button type="submit" class="btn btn-primary">ОТПРАВИТЬ &raquo;</button>
		            <button type="button" class="btn btn-default" 
		            	onclick="window.location.href = '<c:url value="login"/>';" 
		            	value="Klick">ОТМЕНИТЬ &raquo;</button>
		          </div>
		          	<div class="row text-left">
		            	<p>&nbsp;</p>
		            	<a href="<c:url value="static/html/rules.html"/>">* УСЛОВИЯ ПОЛЬЗОВАНИЯ</a>
		            </div>
		        </div>
		      </div>
		    </div>
		    
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