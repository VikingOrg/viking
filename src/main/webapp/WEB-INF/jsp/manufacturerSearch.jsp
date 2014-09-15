<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>Таблица Фирм Производителей</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
						
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#manufacturer_table').dataTable( {
            		"columnDefs": [
	          		               {
	          		                   "targets": [ 0 ],
	          		                   "visible": true
	          		               },
  		           ],          
        	        "bJQueryUI": true,
        	        "sDom": '<"#tableActions"T><r>t<"#source"l><"F"ip>',
        	        "sPaginationType": "full_numbers",
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
                   	   	   $("#tableActions").appendTo("#table_Actions");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 2);
                });

                $("a[rel^='tableRowEdit']").click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
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

                $('#addNewManufacturer').click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/manufacturer/createNew/', {
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

                /*Popover logic. Works only with DOM table elements.*/
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


                $("#editManufacturer").on("click","#submitCreate", function(){
             	   e.preventDefault();
      			   initiateAjaxCall("create");
               });

               /*Modal code.*/ 
               //$('#manufacturerEditModal').on('shown.bs.modal', function (e) {
            	   
               //});                	                          
                
            } );

            
        	function closingModal(manufacturerId, successMsg){
        		$('#manufacturerEditModal').modal('hide');
        		$('#'+manufacturerId).addClass( "success" );

        		$('#success_alert').attr("class","alert alert-success");
        		$("#success_alert_message").html(successMsg);
        		
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
	<div class="container-fluid">
	
		<form:form id="manufacturer_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="manufacturer"
			commandName="manufacturerCommand" method="post" accept-charset="UTF-8">
			
			<div class="row">
				<!--Sidebar content-->
				<div class="col-sm-4 col-md-3 col-lg-3">
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
							<div class="row">	
							<!--  Операции с данными в таблице -->
								<div class="col-sm-12">
										<a id="addNewManufacturer" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
										<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
								</div>
							</div>
					</div>
				</div>
				<!-- End of Sidebar content-->
				<div class="col-sm-8 col-md-9 col-lg-9">
	
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
					<div id="success_alert" class="alert alert-success hidden">
						<span id="success_alert_message"></span>
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					</div>
	
	
					<!-- Таблица со списком Производителей Механизмов -->
					<table id="company_header" class="table_report_header">
						<tbody>
							<tr>
								<td class="nowrap">
									<h3 class="page-header">Список Производителей Механизмов</h3>
								</td>
								<td class="nowrap" id="table_Actions"></td>
							</tr>
						</tbody>
					</table>
					<table id="manufacturer_table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th class="column-check">№</th>
								<th class="nowrap">Рус. наименование&nbsp;&nbsp;</th>
								<th class="nowrap">Страна&nbsp;&nbsp;</th>
								<th class="nowrap">Англ. наименование&nbsp;&nbsp;</th>
								<th class="">Примечания&nbsp;&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="manufacturer" varStatus="loop" items="${manufacturerCommand.manufacturerList}">
								<tr id="${manufacturer.manufacturerId}">
									<td class="column-check">
										<c:out value="${manufacturer.manufacturerId}"/>
										<%--<form:checkbox path="manufacturerList[${loop.index}].archived" value="Y"></form:checkbox> --%>
									</td>
									<td class="nowrap">
										<a href="#" rel="tableRowEdit" data-param1="${manufacturer.manufacturerId}">
							            	<span id="manufacturerNameRus${manufacturer.manufacturerId}"><c:out value="${manufacturer.nameRus}"/></span>
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
										<span id="countryNameRus${manufacturer.manufacturerId}"><c:out  value="${manufacturer.country.nameRus}"/></span>
									</td>
									<td class="nowrap">
										<span id="manufacturerNameEn${manufacturer.manufacturerId}"><c:out value="${manufacturer.nameEn}"/></span>
									</td>
									<td class="">
										<span id="manufacturerNote${manufacturer.manufacturerId}"><c:out value="${manufacturer.note}"/></span>
									</td>
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

<div id="manufacturerEditModal" class="modal modal-wide fade" tabindex="-1">
  <div class="modal-dialog">
    <div id="manufacturerEditModalContent" class="modal-content">
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

</body>
</html>
