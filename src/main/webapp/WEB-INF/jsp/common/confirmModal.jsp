<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- 		Модальное окно подтверждения сохранения введенных данных -->
	<div class="modal fade" id="confirmSave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body" align="center">
	        <h4>ПОДТВЕРДИТЕ СОХРАНЕНИЕ ВВЕДЕННЫХ ДАННЫХ</h4>
	      </div>
	      <div class="modal-footer">
	        <a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
	        <!-- <button type="submit" class="btn btn-primary" onclick="$('Form').submit()">Сохранить</button>  -->
	        <button type="submit" class="btn btn-primary">Сохранить</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->				