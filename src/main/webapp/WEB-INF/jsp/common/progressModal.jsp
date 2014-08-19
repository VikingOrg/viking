<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<!-- 		Модальное окно ожидания загрузки данных -->
				<div class="modal fade" id="wait_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body" align="center">
								<h3 style="color:#448800">Подождите, идет загрузка данных</h3>
								<img src="<c:url value="/static/images/32.gif"/>">
							</div> 
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->