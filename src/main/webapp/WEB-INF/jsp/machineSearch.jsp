<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<!doctype html>
<html lang="ru">
<head>
<title>Таблица Машин и Механизмов</title>

	    <meta name="viewport" content="width=device-width">
        <jsp:include page="common/headCoreElements.jsp" />

		<script src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnSetFilteringDelay.js"></script>


		<script type="text/javascript">

		$(document).ready(function() {
	        	var oTable = $('#machine_table')
		        	    .on( 'processing.dt', function ( e, settings, processing ) {
		        	    	$('#wait_modal').modal('show');
    					} ).dataTable( {
	        	        "bJQueryUI": true,
	        	        "sDom": '<"#tableActions"T><r>t<"#source"l><"F"ip>',
	        	        "sPaginationType": "full_numbers",
	        	        "bProcessing": true,
	        	        "responsive": false,
	        	        "fnPreDrawCallback": function() {
	        	            // gather info to compose a message
	        	            
	        	            return true;
	        	        },
	        	        
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
	                    "oLanguage": {
	                        "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
	                     },
	        	        "aoColumnDefs": [
	        	                         {
		        	   	        		      "aTargets": [ 1 ],
		        	   	        		      "mData": 1,
		        	   	        		      "mRender": function ( data, type, full ) {
		        	   	        		      	  var input;
		        	   	        		      	  if(full[22]=='Y') {
		        	   	        		      		  input = 'Удл.';	  
			        	   	        		      } else {
			        	   	        		    	  input = '<input id="machineSelection'+full[1]+'" class="newCheckbox" type="checkbox" value="'+full[1]+'" name="machineSelection">';
				        	   	        		  }
			        	   	        		       
												  return input;
		        	   	        		      }
	        	   	        		     },	        	 	        	        
	        	                         { "bVisible": true,  "aTargets": [ 1 ] },
	        	                         {
		        	   	        		      "aTargets": [ 4 ],
		        	   	        		      "mData": 4,
		        	   	        		      "mRender": function ( data, type, full ) {
		        	   	        		        return '<a href="${pageContext.request.contextPath}/machineEdit?machineId='+full[0]+'">'+data+'</a>';
		        	   	        		      }
	        	   	        		     }
	        	                       ],    	                     
	                    "sScrollX": "99%",
	        	        "sAjaxSource": '${pageContext.request.contextPath}/machineSearch/getMachines/',
	                    "fnInitComplete": function(oSettings) {
	                	   $('select[name="machine_table_length"]').appendTo("#table_length");
	                	   $('select[name="machine_table_length"]').addClass("form-control");
	                	   this.fnSetFilteringDelay(500);
	                	   $('#wait_modal').modal('hide');

	 	              },
	        	    } );
	        	
                // Event listener to the two range filtering inputs to redraw on input
                $('#startRangeSelect, #endRangeSelect').change( function() {
                	oTable.fnDraw();
                } );
	        	
                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });
                
                $('#groupSelect').change(function() {
                    group = $(this).val();
                    if(group==''){
                    	oTable.fnFilter(group, 2);
                    } else {
                    	oTable.fnFilter( "^"+group+"$", 2 , true);
                    }         
                });
                
                $('#modelSelect').change(function() {
                    modelId = $(this).val();
                    if(modelId==''){
                    	oTable.fnFilter(modelId, 3);
                    } else {
                    	oTable.fnFilter( "^"+modelId+"$", 3 , true);
                    } 
                });
                             
                $('#stevidorSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 6);
                });
                                   		 
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 7);
                });
                $('#portSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 8);
                });

                $('#manufacturerSelect').change(function() {
                	oTable.fnFilter( $(this).val());
                });                                                
                //$('#releaseYearSelect').change(function() {
                //	oTable.fnFilter( $(this).val(), 11);
                //});
                $('#recordTypeSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 22);
                });
                
                $('#groupSelect').change(function() {
              	  var groupId = $(this).val();
              	  if(groupId=='0'){
              		  $('#modelSelect').html("<option value=''>Все модели</option>");
                    } else {
  	                  $.getJSON('${pageContext.request.contextPath}/machineEdit/model/' + groupId, function(machineModel) {
  	                	  //$('#model_details').html("Характеристика Модели:");
  	                	  //$('#model_manuf_name_rus').html("Компания Произовдитель:");
  	                	  //$('#model_manuf_country_name_rus').html("Место Производства:");
  	                      var options='<option value="">Все модели</option>';
  	                      $.each(machineModel, function (i, e) {
  	                          options += "<option value='" + e.modelId + "'>" + "(" + e.modelId + ")"+e.name + "</option>";
  	                      });
  	                      $('#modelSelect').html(options);
  	                  });
                    }
                });                


//                 $('#selectAll').click(function (e) {
//                     $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
//                 });
        } );
        
    	/* Custom filtering function which will search data in column four between two values */
    	$.fn.dataTable.ext.search.push(
    	    function( settings, data, dataIndex ) {
    	        var min = parseInt( $('#startRangeSelect').val(), 10 );
    	        var max = parseInt( $('#endRangeSelect').val(), 10 );
    	        var age = parseFloat( data[11] ) || 0; // use data for the age column
    	 
    	        if ( ( isNaN( min ) && isNaN( max ) ) ||
    	             ( isNaN( min ) && age <= max ) ||
    	             ( min <= age   && isNaN( max ) ) ||
    	             ( min <= age   && age <= max ) )
    	        {
    	            return true;
    	        }
    	        return false;
    	    }
    	);    
        </script>
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
		<jsp:include page="common/menu.jsp" />

<!----- Begin page content ------>

<div class="container">
	<form:form id="machine_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="machineSearch" 
	commandName="machineSearchCommand" method="post" accept-charset="UTF-8">
	
		<div class="row">

			<!--Sidebar content-->
			<div id = "limit_width" class="col-sm-3">
				<div class="col-sm-12 well lform">
					<div class="row">
						<div class="col-sm-12">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="form-group">
									<label>Страна</label>
										<form:select id="countrySelect" path="countryId"
											cssClass="form-control">
											<form:option value="">Все Страны</form:option>
											<c:forEach items="${machineSearchCommand.userCountry}"
												var="country">
												<form:option value="${country.value.nameRus}"
													label="${country.value.nameRus}" />
											</c:forEach>
										</form:select>
								</div>
								<div class="form-group">
									<label>Порт</label>
										<form:select id="portSelect" path="portId"
											cssClass="form-control">
											<form:option value="">Все Порты</form:option>
											<c:forEach items="${machineSearchCommand.userPort}"
												var="port">
												<form:option value="${port.value.name}"
													label="${port.value.name}" />
											</c:forEach>
										</form:select>
								</div>
								<div class="form-group">
									<label>Компания</label>
										<form:select id="stevidorSelect" path="stevidorId"
											cssClass="form-control">
											<form:option value="">Все Компании</form:option>
											<c:forEach items="${machineSearchCommand.userStevidor}"
												var="stevidor">
												<form:option value="${stevidor.value.fullName}"
													label="${stevidor.value.fullName}" />
											</c:forEach>
										</form:select>
								</div>
							</sec:authorize>
							<div class="form-group">
								<label>Группа</label>
									<form:select id="groupSelect" path="groupId" cssClass="form-control">
										<form:option value="">Все Группы</form:option>
										<c:forEach items="${machineSearchCommand.groupMap}"
											var="group">
											<form:option value="${group.key}" label="(${group.key})${group.value.name}" />
										</c:forEach>
									</form:select>
							</div>
							<div class="form-group">
			                    <label class="form-label">Модель</label>
								<form:select id="modelSelect" path="modelId" cssClass="form-control">
									<form:option value="">Все модели</form:option>
					                <c:forEach items="${machineSearchCommand.machineModelMap}" var="model">
					                    <form:option value="${model.key}" label="(${model.key})${model.value.name}" />
					                </c:forEach>									
								</form:select>		                    
		                    </div>
		                    
							<div class="form-group">
								<label>Производитель</label>
									<form:select id="manufacturerSelect" path="manufacturerId"
										cssClass="form-control" title="Выборка по производителю">
										<form:option value="">Все Производители</form:option>
										<c:forEach items="${machineSearchCommand.manufacturerMap}"
											var="manufacturer">
											<form:option value="${manufacturer.value.nameRus}"
												label="(${manufacturer.key})${manufacturer.value.nameRus}" />
										</c:forEach>
									</form:select>
							</div>
 
							<div class="form-group">
								<label class="col-sm-4 control-label">Год выпуска</label>
								<div class="col-sm-8" style="padding-right: 0px">
									<form:select id="startRangeSelect" path="releaseYear"
										cssClass="form-control" title="Выборка по году выпуска">
										<form:option value="" label="С" />
										<form:options items="${machineSearchCommand.yearMap}" />
									</form:select>
									<form:select id="endRangeSelect" path="releaseYear"
										cssClass="form-control" title="Выборка по году выпуска">
										<form:option value="" label="По" />
										<form:options items="${machineSearchCommand.yearMap}" />
									</form:select>
								</div>
							</div>
 
							<div class="form-group">
								<label>Поиск</label>
									<input id="dataTableSearch" class="form-control"
										placeholder="Введите..."
										title="Введите для поиска по всем полям" type="text" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Кол.строк:</label>
						<div id="table_length"></div>					
					</div>
					<div class="form-group">
	                    <label>Тип записей</label>
						<select id="recordTypeSelect" class="form-control" title="Выборка по типу записи">
							<option value="">Все типы</option>
							<option value="0">Активные</option>
							<option value="1">Удаленные</option>
						</select>	                    
                    </div>					
				</div>
			
			<!--  Операции с данными в таблице -->
				<div class="col-sm-12 well lform">
					<div class="row" style="padding-right:10px">
						<div class="col-sm-12">
							<div class="form-group">
								<a href="<c:url value="machineEdit"/> "class="btn btn-primary pull-right" title="Ввод нового">Добавить</a>
									<span class="pull-right">&nbsp;</span> 
								<a href="#" class="btn btn-primary pull-right" title="Удалить" data-toggle="modal" data-target="#confirmDelete">Удалить</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Sidebar content-->

			<div id = "#max_width" class="col-sm-9">

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

				<!-- 	Таблица со списком машин -->
				<h3 class="page-header">Машины и Механизмы</h3>
				<table id="machine_table" class="table table-striped table-bordered">
			        <thead>
			            <tr>
			                <th>Id</th>
			                <th>Статус</th>
			                <th>group Id</th>
			                <th>model Id</th>
			                <th>Группа</th>
			                <th>Модель</th>
			                <th>Компания</th>
			                <th>Страна</th>
			                <th>Порт</th>
							<th>Характеристики</th>									                
							<th>Производитель</th>
							<th>Год выпуска</th>
							<th>Дата ввода в эксплуатацию</th>
							<th>Контракт №</th>
							<th>Инвентарный №</th>
							<th>Транс №</th>
							<th>Заводской №</th>
							<th>Страна призводства</th>
							<th>Место установки</th>
							<th>Номенклатурный №</th>
							<th>Регистрационный №</th>
							<th>Примечания</th>
							<th>Удалена</th>
			            </tr>
			        </thead>
			        <tbody>
			        </tbody>
				</table>
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
						<a type="button" class="cancelbtn" data-dismiss="modal">Отмена</a>
						<button type="submit" class="btn btn-primary">Удалить</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- 		Модальное окно подтверждения удаления данных -->
		<div class="modal fade" id="wait_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-processing">
					<div class="modal-body" align="center">
						<h3 style="color:white">Подождите, идет загрузка данных</h3>
						<img src="<c:url value="/static/images/32.gif"/>">
					</div> 
					<div class="modal-footer" align="center">
						
				    </div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</form:form>

</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />
</body>
</html>