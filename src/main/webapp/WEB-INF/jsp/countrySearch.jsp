<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
	<head>
	    <title>Таблица Стран</title>
	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
	    <link rel="stylesheet" type="text/css" href="static/css/core.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="static/css/page.css">
		<link rel="stylesheet" type="text/css" href="static/css/table.css">
		<link rel="stylesheet" type="text/css" href="static/css/dataTables.tableTools.css">

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
	    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/js/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/dataTables.tableTools.js" ></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#port_table').dataTable( {
            	"aoColumns": [
                	               { "bSortable": false },
                	               null,
                	               null,
                	               null,
                	               { "bSortable": false },
                	           ],
                	"sDom": "<'row'>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
                    "oTableTools": {
                    	"sSwfPath": "static/swf/copy_csv_xls_pdf.swf"
                    },
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
                
            } );

    
        </script>
        <style type="text/css">
			.filter_select {
				padding-top: 10px;
			}
			th {
            text-align: center;
            white-space:nowrap;
          }
          	td {
            white-space:nowrap;
          }
        </style>
		
	</head>
	<body>
		<!-- Wrap all page content here -->
		<div id="wrap">
		   <jsp:include page="common/menu.jsp" />
		   <!----- Begin page content ------>
	        <div class="container">
	        	<form:form id="country_search_form" action="countrySearch" commandName="countrySearchCommand" method="post" accept-charset="UTF-8">
	        	<div class="masthead">
			        <div class="container-fluid">
			            <div class="row-fluid">
			            	<div class="col-md-10 col-md-offset-1">
			                    <h4 class="text-muted page-header">СПИСОК СТРАН<br></h4>
			            	</div>
			            </div>
			        </div>
		        </div>
		        
			        <div class="container-fluid">
			            <div class="row-fluid">
			                 <div class="col col-sm-4 col-md-3">
			                     <!--Sidebar content-->
			                    <label class="form-label">ПОИСК</label>
			                    <div class="input-group" style="margin: 5px">
			                        <input id="dataTableSearch" class="form-control" placeholder="Введите..." title="Введите для поиска по всем полям" type="text"/>
			                    </div>
			                 </div>
			                <div class="col col-sm-8 col-md-9">
			                    
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
							<!--  Операции с данными в таблице -->
		                    <div class="btn-group" style="margin: 5px">
                            <a href="<c:url value="countryEdit"/>" class="btn btn-primary" title="Ввод нового">Добавить &nbsp;<span class="glyphicon glyphicon-plus"></span>&nbsp;</a>
                            <a href="#" class="btn btn-primary" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;</a>
                            </div>
                            

							<!-- Таблица со списком стран -->
			                <div class="table-container">
			                    <table id="country_table" class="table table-striped table-bordered">
			                          <thead>
			                              <tr>
				                              <th>&nbsp;</th>
				                              <th>Страна (RUS)&nbsp;&nbsp;</th>
				                              <th>Страна (ENG)&nbsp;&nbsp;</th>
				                              <th>Примечания&nbsp;&nbsp;</th>
			                              </tr>
			                          </thead>
			                          <tbody>
			                          	<c:forEach var="country" varStatus="loop" items="${countrySearchCommand.countryList}" >
			                          	<c:if test="${country.archived != 'Y'}" >
				                            <tr>
				                                <td>
				                                	<form:checkbox path="countryList[${loop.index}].archived" value="Y"></form:checkbox>
					                              	<c:if test="${system.localConfig}" >
					                              		<span class="alert-danger">
					                              			<c:out value="(${country.countryId})"/>
					                              		</span>
					                              	</c:if>				                                	
				                                </td>
					                         	<td class="nowrap">
					                         		<a href="<c:url value="countryEdit?countryId=${country.countryId}"/>">&nbsp;<span class="glyphicon glyphicon-pencil" title="Редактировать"></span></a>
					                         		<a href="<c:url value="countryEdit?countryId=${country.countryId}&copy=true"/>">&nbsp;<span class="glyphicon glyphicon-fullscreen" title="Копировать"></span>&nbsp;</a>
					                         		<c:out value="${country.nameRus}"/>
					                         	</td>
				                              <td><c:out value="${country.nameEn}"/></td>
				                              <td><c:out value="${country.countryNote}"/></td>
				                            </tr>
				                        </c:if>    
			                            </c:forEach>
			                          </tbody>
			                    </table>
			                   </div>
			                </div>
			            </div>
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
					
				</form:form>
		    </div> <!-- End Main Container -->
		</div> <!-- Wrapper end -->

		<div id="footer">
		  <div class="container">
		   <jsp:include page="common/footer.jsp" />
		  </div>
		</div>
	</body>
</html>