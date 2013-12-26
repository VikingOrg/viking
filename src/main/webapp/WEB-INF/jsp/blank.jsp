<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="ru">
	<head>
	    <title>Страница не найдена</title>
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

		    <div class="page-header">
		      <h1>Система не может обработать Ваш запрос.</h1>
		    </div>
			<p><h4>Извините, но на Ваш зарпос система показала код ошибки (
	<c:if test="${not empty status}">
			<b>Response Status:</b> ${status}
			<c:if test="${error}">(${error})</c:if>
	</c:if>			
			).</h4></p>
					<p>Если вы зарегистрированный пользователь и хотите войти в систему вам <a href="<c:url value="login" />" > Сюда</a> </p>
					<p>Если вы новый пользователь, вам нужно пройти регистрацию <a href="<c:url value="register" />" > Здесь</a> </p>
					
					
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

	<p>Если ошибка повториться, обратитесь в службу потдержки.</p>

	<p>Служба потдежки может попросить Вас выслать им 'код' этой страницы.<br> Для получения кода, нужно после нажатия 
	на правую кнопку мыши, выбрать View Page Source. Затем скопировать код и выслать в службу потдержки с кратким описанием 
	Ваших шагов, которые привели к ошибке.</p>

	<!--
    Failed URL: ${url}
    Exception:  ${exception.message}
        <c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
    </c:forEach>
    -->	
			</div> <!-- End of Main Container -->
		</div> <!-- End of Wrapping -->
		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>