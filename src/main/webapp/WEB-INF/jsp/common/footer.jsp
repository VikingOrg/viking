   <%@ page contentType="text/html; charset=UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <!-- Site footer -->
   <div class="footer">
     <p class="text-center"><a href="#">О Системе</a>
     	&nbsp;|&nbsp;
     	<a href="#">&nbsp;Участники</a>
     	&nbsp;|&nbsp;
     	<a href="#">&nbsp;Правила</a>
     	&nbsp;|&nbsp;
     	<a href="#">&nbsp;Поддержка</a>
     	&nbsp;|&nbsp;
     	<a href="help.html">Справка</a>

     </p>
     <p class="text-center">&copy; ООО "ИТТ", 2013&nbsp;</p>
   </div>
   
    		        
					    <!-- 		Модальное окно подтверждения выхода из системы -->
					<div class="modal" id="confirmLogout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title">ВНИМАНИЕ!</h4>
					      </div>
					      <div class="modal-body">
					        <p>ВЫХОД ИЗ СИСТЕМЫ</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
					        <a href="<c:url value="j_spring_security_logout" />" class="btn btn-primary" type="submit" class="btn btn-danger">ВЫЙТИ</a>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
			      </div><!--/.nav-collapse -->