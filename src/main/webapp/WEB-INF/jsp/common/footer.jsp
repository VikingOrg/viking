   <%@ page contentType="text/html; charset=UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <!-- Site footer -->
<div class="container-fluid">
	<footer>
		<hr />	
		<p class="pull-right"><a href="#">Наверх</a></p>
		<p>
			<a href="<c:url value="/static/html/about.html"/>">О системе</a> |
			<a href="<c:url value="/static/html/participants.html"/>">Участники</a> |
			<a href="<c:url value="/static/html/rules.html"/>">Правила</a> |
			<a href="<c:url value="/static/html/support.html"/>">Поддержка</a> |
			<a href="<c:url value="/static/html/help.html"/>">Помощь</a><br />
			&copy; 2013 | <a href="<c:url value="/home"/>">ИТТ24</a>.
		</p>
	</footer>
</div>

   	<script type="text/javascript">
		            
           function applLogout() {
         	   var href = window.location.href.split('/');
         	   var baseUrl = href[0]+'//'+href[2]+'/'+href[3]+'/'; 
           	$('form').attr('action', baseUrl+"j_spring_security_logout").submit();
           }

           function baseUrl() {
        	   var href = window.location.href.split('/');
        	   return href[0]+'//'+href[2]+'/';
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
					
				
				   
