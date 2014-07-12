   <%@ page contentType="text/html; charset=UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <!-- Site footer -->
<footer>
	<hr />	
	<p class="pull-right"><a href="#">Наверх</a></p>
	<p>
		<a href="<c:url value="static/html/about.html"/>">О системе</a> |
		<a href="<c:url value="static/html/participants.html"/>">Участники</a> |
		<a href="<c:url value="static/html/rules.html"/>">Правила</a> |
		<a href="<c:url value="static/html/support.html"/>">Поддержка</a> |
		<a href="<c:url value="static/html/help.html"/>">Справка</a><br />
		&copy; 2013 | <a href="#">ИТТ24</a>.
	</p>
</footer>
   
    		        
					    <!-- 		Модальное окно подтверждения выхода из системы -->
					<div class="modal" id="confirmLogout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-body" align="center">
					        <h4>ВЫХОД ИЗ СИСТЕМЫ</h4>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
					        <a href="<c:url value="j_spring_security_logout" />" class="btn btn-primary" type="submit" class="btn btn-danger">ВЫЙТИ</a>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
