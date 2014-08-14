<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Фирм Производителей</title>
		<jsp:include page="common/headCoreElements.jsp" />
		
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#manufacturer_table').dataTable( {
        	        "bJQueryUI": true,
        	        "sDom": '<"#tableActions"T><r>t<"#source"l><"F"ip>',
        	        "sPaginationType": "full_numbers",
        	        "bProcessing": true,
        	        "responsive": false,
                	tableTools: {
             			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
             		 	"aButtons": [
               	                "copy",
               	             	{
               	                    "sExtends":     "print",
               	                    "bHeader": true
               	                	},
               	            	{
               	                    "sExtends":     "csv",
               	                    "sButtonText": "Save",
               	                    "bHeader": true
               	                	}
               	            ]
             	   },
                    "bJQueryUI": true,
                    "oLanguage": {
                        "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                     },
                     "fnInitComplete": function(oSettings) {
	                	   $('select[name="manufacturer_table_length"]').appendTo("#table_length");
	                	   $('select[name="manufacturer_table_length"]').addClass("form-control");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 2);
                });

                $("a[rel^='tableRowEdit']").click(function(e){
                    $.ajax('${pageContext.request.contextPath}/manufacturer/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#manufacturerEditModalContent").html(response.responseText);
                            $('#manufacturerEditModal').modal('show');
                            
                        }
                    });
                });            

                $("a[rel^='tableRowEdit']").popover({
                	trigger:'hover',
                	container:'body',
                	html:'true',
                	template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
                	title:'Дополнительные данные о записи Фирмы Производителя.',
                	placement:'auto',
                    delay: { 
                        show: "1000", 
                        hide: "100"
                    },
                    content: function() {
                        return $('#popoverContent'+this.dataset['param1']).html();
                    },
                });    
                
            } );

        	function closingModal(manufacturerId){
        		$('#manufacturerEditModal').modal('hide');
        		$('#'+manufacturerId).addClass( "success" );
            }
        </script>


    <style type="text/css">
        .popover{
            max-width:600px;
        }
    </style>

        
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">	
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
	<div class="container">
	
		<form:form id="manufacturer_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="manufacturer"
			commandName="manufacturerCommand" method="post" accept-charset="UTF-8">
			
			<div class="row">
				<!--Sidebar content-->
				<div id="limit_width" class="col-sm-4">
					<div class="col-sm-12 well lform">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label>Страна производства</label>
										<form:select id="countrySelect" path="countryId"
											cssClass="form-control col-sm-12">
											<form:option value="">Все Страны</form:option>
											<c:forEach items="${manufacturerCommand.countryMap}" var="country">
												<form:option value="${country.value.nameRus}"
													label="${country.value.nameRus}" />
											</c:forEach>
										</form:select>
								</div>
								<div class="form-group">
									<label>Поиск</label>
										<input id="dataTableSearch" class="form-control"
											placeholder="Введите..."
											title="Введите для поиска по всем полям" type="text" />
								</div>
								<div class="form-group">
										<label>Кол.строк:</label>
										<div id="table_length"></div>					
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 well lform">
							<div class="row" style="margin-left:-25px; margin-right:-25px;">	
							<!--  Операции с данными в таблице -->
								<div class="col-sm-12">
									<div class="form-group">
										<a href="<c:url value="manufacturerEdit/new/"/> "class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>Добавить</a>
										<span class="pull-right">&nbsp;</span> 
										<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
									</div>
								</div>
							</div>
					</div>
				</div>
				<!-- End of Sidebar content-->
				<div id = "#max_width" class="col-sm-8">
	
					<!-- Start table content -->
	
					<!--  Вывод сообщений и предупреждений  -->
					<c:if test="${not empty message}">
						<div class="alert alert-success show">
							<spring:message code="${message}" />
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger show">
							<spring:message code="${error}" />
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
					</c:if>
	
	
					<!-- Таблица со списком Производителей Механизмов -->
					<h3 class="page-header">Список Фирм Производителей</h3>
					<table id="manufacturer_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check nowrap">&nbsp;</th>
								<th class="nowrap">Рус. наименование&nbsp;&nbsp;</th>
								<th class="nowrap">Страна&nbsp;&nbsp;</th>
								<th class="nowrap">Англ. наименование&nbsp;&nbsp;</th>
								<th class="nowrap">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="manufacturer" varStatus="loop" items="${manufacturerCommand.manufacturerList}">
								<tr>
									<td class="column-check nowrap">
										<form:checkbox path="manufacturerList[${loop.index}].archived" value="Y"></form:checkbox>
									</td>
									<td class="nowrap">
										<a href="#" rel="tableRowEdit" data-param1="${manufacturer.manufacturerId}">
							            	<span id="name${manufacturer.manufacturerId}"><c:out value="${manufacturer.nameRus}"/></span>
							            </a>
							            <span class="hidden" id="popoverContent${manufacturer.manufacturerId}">
							            
											<table class="table_report_header">
												<tbody>
													<tr>
														<td>
											            	<span class="nowrap">
											            		Автор записи:<c:out value="${manufacturer.createUser.firstName}"/>
											            					 <c:out value="${manufacturer.createUser.lastName}"/><br>
											            	</span> 
											            	<span class="nowrap">Запись создана:<c:out value="${manufacturer.createDate}"/><br></span>
											            	<span class="nowrap">Последние изменение внесены:<c:out value="${manufacturer.updateDate}"/><br></span>
											            	<span class="nowrap">Пользователем с ID:<c:out value="${manufacturer.updateUserId}"/><br></span>
											            	<span class="nowrap">Img Path:<c:url value="/static/images/users/${manufacturer.createUser.img}"/><br></span>
														
														</td>
														<td>
															<c:if test="${not empty manufacturer.createUser.img}">
																<img src="<c:url value="/static/images/users/${manufacturer.createUser.img}"/>">
															</c:if>
															<c:if test="${empty manufacturer.createUser.img}">
																<img src="<c:url value="/static/images/users/defaultImg.jpg"/>">															
															</c:if>														
					
														</td>
													</tr>
												</tbody>
											</table>							            
							            </span>
									</td>
									<td class="nowrap">
										<c:out  value="${manufacturer.country.nameRus}"/>
									</td>
									<td class="nowrap">
											<c:out value="${manufacturer.nameEn}" />
									</td>
									<td class="nowrap"><c:out value="${manufacturer.note}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	
				</div>
			</div>
	
		</form:form>
	</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />

<div id="manufacturerEditModal" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div id="manufacturerEditModalContent" class="modal-content">
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

</body>
</html>
