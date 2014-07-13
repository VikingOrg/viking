<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Компаний-операторов</title>
        
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
		 <div class="container"> 
		 
								
		<form:form id="stevidor_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="stevidorSearch" commandName="stevidorSearchCommand" method="post" accept-charset="UTF-8">
		   <div class="row">
		   		
				<br>
				<!--Sidebar content-->
					<div class="col-sm-4">
					
					<h3>
					&nbsp;
					</h3>
			
						<div class="col-sm-12 well lform">
			
							<div class="row">
									
									<div class="col-sm-12">
										<div class="form-group">
											<label class="col-sm-3 control-label">Страна</label>
											<div class="col-sm-9">
											<form:select id="countrySelect" path="countryId" cssClass="form-control col-sm-12">
												<form:option value="">ВСЕ</form:option>
								                <c:forEach items="${stevidorSearchCommand.userCountry}" var="country">
								                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
								                </c:forEach>
											</form:select>
											</div>
										</div>	
										<div class="form-group">
											<label class="col-sm-3 control-label">Порт</label>
											<div class="col-sm-9">
											<form:select id="portSelect" path="portId" cssClass="form-control col-sm-12">
												<form:option value="">ВСЕ</form:option>
								                <c:forEach items="${stevidorSearchCommand.userPort}" var="port">
								                    <form:option value="${port.value.name}" label="${port.value.name}" />
								                </c:forEach>							
											</form:select>
											</div>	
										</div>
										<div class="form-group">
						                    <label class="col-sm-3 control-label">Поиск</label>
						                    	<div class="col-sm-9">
						                        <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text"/>
						                        </div>
								        </div>
								    </div>				
							</div>
						</div>	
					</div>
				<!-- End of Sidebar content-->	
				
				
					<div class="col-sm-8">
				
						<!-- Start table content -->

				                    
			                    <!--  Вывод сообщений и предупреждений  -->
								<c:if test="${not empty message}"> 
								<div class="alert alert-success show"><spring:message code="${message}" />
									<button type="button" class="close" data-dismiss="alert">&times;</button>
								</div>			
								</c:if>
								<c:if test="${not empty error}"> 
									<div class="alert alert-danger show"><spring:message code="${error}" />
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>			
								</c:if>									
								
								<!-- Таблица со списком стивидоров -->
								<h3>
								<span>Список</span>
								компаний-операторов
								</h3>
				                    <table id="stevidor_table" class="table table-bordered table-striped">
				                          <thead>
				                              <tr>
					                              <th class="column-check">&nbsp;</th>
					                              <th>Компания-оператор&nbsp;&nbsp;</th>
			                              		  <th>Порт&nbsp;&nbsp;</th>
					                              <th class="hidden-sm hidden-xs">Страна&nbsp;&nbsp;</th>
					                              <th class="hidden-sm hidden-xs">Примечания</th>
				                              </tr>
				                          </thead>
				                          <tbody>
				                          	<c:forEach var="stevidor" varStatus="loop" items="${stevidorSearchCommand.stevidorList}" >
				                          	<c:if test="${stevidor.archived != 'Y'}" >
					                            <tr>
					                                <td>
					                                	<form:checkbox path="stevidorList[${loop.index}].archived" value="Y"></form:checkbox>
						                              	<c:if test="${system.localConfig}" >
						                              		<span class="alert-danger">
						                              			<c:out value="(${stevidor.stevidorId})"/>
						                              		</span>
						                              	</c:if>				                                	
					                                </td>
						                         	<td class="nowrap">
						                         		<a href="<c:url value="stevidorEdit?stevidorId=${stevidor.stevidorId}&copy=true"/>">&nbsp;<span class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;</a>
						                         		<a href="<c:url value="stevidorEdit?stevidorId=${stevidor.stevidorId}"/>"><c:out value="${stevidor.fullName}"/></a>
						                         	</td>
						                          <td><c:out value="${stevidor.port.name}"/></td>
					                              <td class="hidden-sm hidden-xs"><c:out value="${stevidor.port.country.nameRus}"/></td>
					                              <td class="hidden-sm hidden-xs"><c:out value="${stevidor.stevidorNote}"/></td>
					                            </tr>
					                        </c:if>    
				                            </c:forEach>
				                          </tbody>
				                    </table>
				                    <!--  Операции с данными в таблице -->
				                    <div class="btn-group">
				                    <a href="<c:url value="stevidorEdit"/>" class="btn btn-primary" title="Ввод нового">Добавить</a>
                            <a href="#" class="btn btn-primary" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
		                            </div>
				        
					    <!-- 		Модальное окно подтверждения удаления данных -->
						<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-body" align="center">
						        <h4>ПОДТВЕРДИТЕ УДАЛЕНИЕ ДАННЫХ</h4>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">ОТМЕНА</button>
						        <button type="submit" class="btn btn-danger">УДАЛИТЬ</button>
						      </div>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->
					
				                             
				                  <!-- // end of table content -->
						
					</div>
				
			</div>
		
		</form:form>
		</div>
		   <jsp:include page="common/footer.jsp" />
		
		<script type="text/javascript">
        $(document).ready(function() {
        	var oTable = $('#stevidor_table').dataTable( {
        	"aoColumns": [
            	               { "bSortable": false },
            	               null,
            	               null,
            	               null,
            	               { "bSortable": false },
            	           ],
            	"sDom": "<'row'>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
              /*   "oTableTools": {
                	"sSwfPath": "static/swf/copy_csv_xls_pdf.swf"
                }, */
                "sPaginationType": "bootstrap",
                "iDisplayLength": 15,
                "oLanguage": {
                    "sUrl": "static/js/dataTable_ru_RU.txt"
                 }                    
            } );


            $('#dataTableSearch').on('input', function() {
            	oTable.fnFilter( $(this).val());
            });   		 
            $('#countrySelect').change(function() {
            	oTable.fnFilter( $(this).val(), 3);
            });
            $('#portSelect').change(function() {
            	oTable.fnFilter( $(this).val(), 2);
            });

//             $('#selectAll').click(function (e) {
//                 $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
//             });
            
        } );
   
        </script>
	</body>
</html>