   <%@ page contentType="text/html; charset=UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
   
   <!-- Site footer -->
<div class="container-fluid">
	<footer>
		<hr />	
		<p class="pull-right"><a href="#">Наверх</a></p>
		<p>
			<a href="<c:url value="/static/html/about.html"/>">О системе</a> |
			<a href="<c:url value="/static/html/participants.html"/>">Участники</a> |
			<a href="<c:url value="/static/html/rules.html"/>">Правила</a> |
			<a href="<c:url value="/support"/>">Поддержка</a> |
			<a href="<c:url value="/static/html/help.html"/>">Помощь</a> 
			<sec:authorize access="hasRole('ROLE_ADMIN')">|
			<a href="<c:url value="/static/html/admin_manual.pdf"/>">Инструкция</a><br />
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">|
			<a href="<c:url value="/static/html/user_manual.pdf"/>">Инструкция</a><br />
            </sec:authorize>
			&copy; 2013  <a href="<c:url value="/home"/>">ООО "ИТТ"</a>.
			<span class="pull-right"><a href="#">Разработано Gigavar.com</a></span>
		</p>
	</footer>
</div>

   	<script type="text/javascript">
           function applLogout() {
         	  var href = window.location.href.split('/');
         	  var baseUrl = href[0]+'//'+href[2]+'/'+href[3]+'/'; 
           	  $('form').attr('action', baseUrl+"j_spring_security_logout").submit();
           }
    </script>        
   		        
	<!-- Модальное окно подтверждения выхода из системы -->
	<div class="modal" id="confirmLogout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body" align="center">
	        <h4>ВЫХОД ИЗ СИСТЕМЫ</h4>
	      </div>
	      <div class="modal-footer">
	        <a type="button" class="cancelbtn" data-dismiss="modal">ОТМЕНА</a>
	        <a id="applLogout" href="<c:url value="/j_spring_security_logout"/>" class="btn btn-primary" class="btn btn-primary" onclick="applLogout()">ВЫЙТИ</a>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
					
				
				   
