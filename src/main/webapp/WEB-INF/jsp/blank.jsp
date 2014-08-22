<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Страница не найдена</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="shortcut icon" type="image/png" href="<c:url value="favicon.ico"/>"/>
	    <!-- Bootstrap -->
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/real_estate.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/theme.css"/>"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/core.css"/>"/>
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
			<!-- Begin page content -->
		    <div class="container">
				<div class="panel  panel-success" style="margin-top: 50px;">
			      <div class="panel-heading" style="background-color:#DDEDCC;">
					    <h2>Система не может обработать Ваш запрос!</h2>
			      </div>
				  <div class="panel-body">
				    <p><h4>Извините, но на Ваш запрос система показала код ошибки (
						<c:if test="${not empty status}">
								<b>Response Status:</b> ${status}
								<c:if test="${error}">(${error})</c:if>
						</c:if>			
								).</h4>
					</p>
					<p>Если ошибка повторится, обратитесь в службу поддержки.</p>
				
					<p>Служба поддержки может попросить Вас выслать им 'код' этой страницы.<br> Для получения кода, нужно после нажатия 
					на правую кнопку мыши, выбрать View Page Source. Затем скопировать код и выслать в службу потдержки с кратким описанием 
					Ваших шагов, которые привели к ошибке.</p>
				  </div>
				  <div class="panel-footer">			
						<p>Для продолжения работы вернитесь <INPUT TYPE="button" class="cancelbtn" VALUE="НАЗАД" onClick="history.go(-1);"> ,
						 либо <a class="cancelbtn" href="<c:url value="login" />" > ВОЙДИТЕ СНОВА</a></p>
	
				  </div>
			  </div>
		<!-- 
   An error page with hidden stack-trace suitable for tech support.
 -->

	<!-- You could use ${requestScope['javax.servlet.forward.request_uri']} 
	     but it's a lot more verbose and doesn't give you the full page URL. -->
	<c:if test="${not empty url}">
		<p>
			<b>Page:</b> ${url}
		</p>
	</c:if>

	<c:if test="${not empty timestamp}">
		<p id='created'>
			<b>Occurred:</b> ${timestamp}
		</p>
	</c:if>

	<c:if test="${not empty status}">
		<p>
			<b>Response Status:</b> ${status}
			<c:if test="${error}">(${error})</c:if>
		</p>
	</c:if>
			
	

	<!--
    Failed URL: ${url}
    Exception:  ${exception.message}
        <c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
    </c:forEach>
    -->	
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		
		<jsp:include page="common/footer.jsp" />
	</body>
</html>