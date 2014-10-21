<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>Таблица Моделей Машин</title>
		<jsp:include page="common/headCoreElements.jsp" />
        
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
    	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/localization/messages_ru.js"></script>
    	<script src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnSetFilteringDelay.js"></script>
		
		<script type="text/javascript">
			var jsonData={};
	        $(document).ready(function() {
	        	var selected = [];	  
	        	oTable = $('#modelSearchTable').dataTable( {
	        		"sDom": '<"#tableActions"T>t<"#source"l>ip',
	                "bJQueryUI": false,
	    			"scrollX" : true,
	    			"sPaginationType": "full_numbers",
	                "aoColumns": [
	                               { "mDataProp": "modelId" },
	                               { "mDataProp": "name" },
	                               { "mDataProp": "details", "defaultContent": "отсутствует" },
	                               { "mDataProp": "group.name", "defaultContent": "отсутствует" },
	                               { "mDataProp": "manufacturer.nameRus", "defaultContent": "отсутствует"  },
	                               { "mDataProp": "manufacturer.country.nameRus", "defaultContent": " " },
	                               { "mDataProp": "note", "defaultContent": " " },
	                               { "mDataProp": "group.groupId", "defaultContent": "отсутствует" },                          
	                               { "mDataProp": "updateDate", "defaultContent": " " }
	                             ],
               	     "aoColumnDefs": [
								 { "bVisible": false,  "aTargets": [7] },
       	                         { "aTargets": [ 1 ],
        	   	        		   "mData": 1,
        	   	        		   "mRender": function ( data, type, machineModelObject ) {
        	   	        			var html = '<a href="#" rel="tableRowEdit" data-param1="'+machineModelObject.modelId+'">' +
	                      			'<span id="name'+machineModelObject.modelId+'">'+ data + '</span></a>';
        	   	        		    return html;
        	   	        		    }
       	   	        		     },
       	                         {
       	   	        		      "aTargets": [ 4 ],
       	   	        		      "mData": 4,
       	   	        		      "mRender": function ( data, type, machineModelObject ) {
           	   	        		      var machineName = data;
           	   	        		      if(machineModelObject.manufacturer.country.countryId != 1) {
           	   	        		    	 machineName = machineName + " (" + machineModelObject.manufacturer.nameEn + ")";
               	   	        		  }
       	   	        		        return machineName;
       	   	        		      }
      	   	        		     }       	   	        		     
    	        	      	   ], 		                             
	             	tableTools: {
	         			"sSwfPath": "${pageContext.request.contextPath}/static/swf/copy_csv_xls_pdf.swf",
	         		 	"aButtons": [
	           	                "copy",
	           	             	{
	           	                    "sExtends":     "print",
		           	                 "sInfo": "</br>"+
	               	                 "</br>"+
	               	                 "Нажмите ESC для выхода из режима ПЕЧАТИ.",
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
                   "fnInitComplete": function(oSettings) {
                	   $('select[name="modelSearchTable_length"]').appendTo("#table_length");
                	   $('select[name="modelSearchTable_length"]').addClass("form-control");
                  	   $("#tableActions").appendTo("#table_Actions");
                  	   //this.fnSetFilteringDelay(500);
                  	   getData();
 	               },
 	               
	            });
	        	
                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                }); 
                  		 
                $('#groupSelect').change(function() {
                    group = $(this).val();
                    if(group==''){
                    	oTable.fnFilter(group, 7);
                    } else {
                    	oTable.fnFilter( "^"+group+"$", 7 , true);
                    }
                });
                
                $('#manufacturerSelect').change(function() {
                	oTable.fnFilter( $(this).val(), 4);
                });
                
                $('#countrySelect').change(function() {
                	oTable.fnFilter( $(this).val(), 5);
                });

                $('#addNewModel').click(function(e){
                	$('#success_alert').attr("class","alert alert-success hidden");
                    $.ajax('${pageContext.request.contextPath}/machineModel/createNew/', {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#machineModelModalContent").html(response.responseText);
                            $('#machineModelModal').modal('show');
                        }
                    });
                });
                
                $(document).on('click', "a[rel^='tableRowEdit']", function(){
                    $.ajax('${pageContext.request.contextPath}/machineModel/edit/'+this.dataset['param1'], {
                        beforeSend: function(req) {
                            req.setRequestHeader("Accept", "text/html;type=ajax");
                        },  
                        complete : function( response )
                        {
                            $("#machineModelModalContent").html(response.responseText);
                            $('#machineModelModal').modal('show');
                            
                        }
                    });
                });

                $("#dataTableSearch").focus();
                $('#dataTableSearch').keypress(function (ev) {
                    var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                    if (keycode == '13') {
                    	ev.preventDefault();
                    	return false;
                    }
                }); 

	            $('#modelSearchTable tbody').on('click', 'tr', function () {
	                var id = this.id;
	                var index = $.inArray(id, selected);
	         
	                if ( index === -1 ) {
	                    selected.push( id );
	                } else {
	                    selected.splice( index, 1 );
	                }
	         
	                $(this).toggleClass('success');
	            } );    			   

	        	$('#machineModelModal').on('hidden.bs.modal', function (e) {
	        		var modelId = $(this).data('id');
	        		/*Don't update data for 'cancel'*/
	        		if(modelId != '') {
	        			getData(modelId);
		        	}
	        	});

	        	$("#changesFrom").datepicker({
	        		dateFormat: "dd.mm.yy", firstDay: 1, dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ],
	        	 	monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],		
	        	  	onSelect: function(dataPickerDate) {
	        	  	    $.fn.dataTableExt.afnFiltering.push(
	        	  	        function(oSettings, aData, iDataIndex) {
	        	  	           var tableDate = aData[8].substring(6,10) + aData[8].substring(3,5)+ aData[8].substring(0,2);
	        	  	           var fromDate  = dataPickerDate.substring(6,10) + dataPickerDate.substring(3,5)+ dataPickerDate.substring(0,2);
	        	  	           if (tableDate >= fromDate) {
	        	  	        	 return true;
	        		  	       }
	        	  	           return false;
	        	  	        }

	        	  	    );
	        	  	    //Update table
	        	  	     oTable.fnDraw();
	        	  	     //Deleting the filtering function if we need the original table later.
	        	  	    $.fn.dataTableExt.afnFiltering.pop();
	        	  }
	        	});

	        	$("#groupSelect").select2({
	        	    allowClear:true
	        	});
	        	$("#manufacturerSelect").select2({
	        	    allowClear:true
	        	});
	        	$("#countrySelect").select2({
	        	    allowClear:true
	        	});
	        	
            } ); //end of document.ready 

            
    		function getData(rowId){
            	showProgressModal('#wait_modal');
            	oTable.fnClearTable();
            	var pageData =  $("#machine_search_form").serialize();
          		$.getJSON("${pageContext.request.contextPath}/machineModel/getModels/false", pageData, function (data) {
          			if (data.length != 0 ) {
          				jsonData = data; 
          				oTable.fnAddData(data);
          			}
          			closeProgressModal('#wait_modal');
          			oTable.fnJumpToRowId(rowId);
          			$('#'+rowId).addClass( "success" );
          			$("#dataTableSearch").focus();
          		}).fail( function(d, textStatus, error) {
          	        console.error("getJSON failed, status: " + textStatus + ", error: "+error);
          	        closeProgressModal('#wait_modal');
          	    });
    		} 

   		 	/*Get called from edit modal - to close it.*/        
        	function closingModal(modelId, successMsg, groupId){
        		$('#machineModelModal').modal('hide');
        		if(successMsg != "") {
            		$("#success_alert_message").html(successMsg);
            		$('#success_alert').attr("class","alert alert-success");
            	}
            }

        	/* 
        	 * Custom plugin from datatable
        	 * Uses record Id along with Datatable row index to page, find and highlight 
        	 * data in table.
        	 */
        	jQuery.fn.dataTableExt.oApi.fnJumpToRowId = function ( oSettings, nRowId )	{
        	    /* Find the node's position in the aoData store */
        	    //var iCurrent = oSettings.oApi._fnNodeToDataIndex( oSettings, nRow );
        	    
        	    /*Check if rowId defined*/ 
        	    if ( typeof nRowId === 'undefined' )  {
        	        return;
        	    }	
        	    
        	    var iPos = -1;
        	    for( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ ) {
            	    var rowId = oSettings.aoData[ oSettings.aiDisplay[i] ].nTr.id;
        	        if( rowId == nRowId )  {
        	            iPos = i;
        	            break;
        	        }
        	    }

        	    var myPage = Math.floor(iPos / oSettings._iDisplayLength); 
        	    // Set new page
        	    var iPage = (myPage) * oSettings._iDisplayLength;
        	    oSettings._iDisplayStart = iPage;
        	 
        	    // Redraw table
        	    oSettings.oApi._fnCalculateEnd( oSettings );
        	    oSettings.oApi._fnDraw( oSettings );
        	};
        	
        </script> 	
        <style type="text/css">
        	th, td { white-space: nowrap; }
        </style>
        
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap"> 
<jsp:include page="common/menu.jsp" />
<!----- Begin page content ------>
<div class="container-fluid">
    <form:form id="machine_search_form" action="modelSearch" class="form-horizontal mini" style="margin-bottom: 0px;" 
    commandName="modelSearchCommand" method="post" accept-charset="UTF-8">   
		<div class="row">

			<!--Sidebar content-->
			<div class="col-sm-4 col-md-3 col-lg-3">

				<div class="col-sm-12 well lform">

					<div class="row">

						<div class="col-sm-12">
								<div class="form-group">
				                    <label>Группа</label>
									<form:select id="groupSelect" path="groupId" cssClass="form-control">
									    <form:option value="">Все группы</form:option>
						                <c:forEach items="${modelSearchCommand.groupMap}" var="group">
						                    <form:option value="${group.key}" label="(${group.key})${group.value.name}" />
						                </c:forEach>								
									</form:select>
			                    </div>
						        <div class="form-group">
				                    <label>Производитель</label>
									<form:select id="manufacturerSelect" path="manufacturerId" cssClass="form-control" title="Выборка по производителю">
									    <form:option value="">Все производители</form:option>
						                <c:forEach items="${modelSearchCommand.manufacturerMap}" var="manufacturer">
						                    <form:option value="${manufacturer.value.nameRus}" label="${manufacturer.value.nameRus}" />
						                </c:forEach>								
									</form:select>
					        	</div>
					        	<div class="form-group">
				                    <label>Страна</label>
									<form:select id="countrySelect" path="countryId" cssClass="form-control">
										<form:option value="">Все страны</form:option>
						                <c:forEach items="${modelSearchCommand.countryMap}" var="country">
						                    <form:option value="${country.value.nameRus}" label="${country.value.nameRus}" />
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
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="form-group">
				                    <label>Тип записей</label>
									<select id="" class="form-control" title="Выборка по типу записи">
										<option value="">Все типы</option>
										<option value="0">Активные</option>
										<option value="1">Удаленные</option>
									</select>	                    
                    			</div>
								
								<div class="form-group">
				                    <label>Внесенные изменения</label>
				                    <div class="input-group pull-right">
										<span class="date-range-label">С</span>
										<input class="date-range" type="text" id="changesFrom" data-date-format="dd.mm.yyyy" placeholder="01.01.2014">
									</div>
	                    		</div>	
							</sec:authorize>
			               </div>
					</div>
				</div>
				
				<!--  Операции с данными в таблице КНОПОЧКИ -->
				<div class="col-sm-12 well lform">
					<div class="row">
						<div class="col-sm-12">
								<a id="addNewModel" href="#" class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
								<a href="#" class="btn btn-primary pull-right hidden" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span>Удалить</a>
						</div>
					</div>	
				</div>		
			</div>
			<!-- End of Sidebar content-->

			<div class="col-sm-8 col-md-9 col-lg-9">
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

				<table id="company_header" class="table_report_header">
					<tbody>
						<tr>
							<td class="nowrap">
								<h3 class="page-header">Список Моделей</h3>
							</td>
							<td class="nowrap" id="table_Actions"></td>
						</tr>
					</tbody>
				</table>
				
				<!-- Таблица со списком машин -->									
                 <table id="modelSearchTable" class="table table-striped table-bordered">
                   <thead>
                       <tr>
                         <th class="column-check">№</th>
                         <th class="">Модель</th>
                         <th class="">Характеристики Модели</th>                         
                         <th class="">Группа</th>
                         <th class="">Производитель</th>
                         <th class="">Страна</th>
                         <th class="">Примечания</th>
                         <th class="">group Id</th>
						 <th class="">Посл. изм.</th>
                       </tr>
                   </thead>
	               <tbody>

                   </tbody>
          		</table>
    		</div>
        </div>
	</form:form>
			
		<div id="machineModelModal" class="modal modal-wide fade" tabindex="-1" data-id="1">
		  <div class="modal-dialog">
		    <div id="machineModelModalContent" class="modal-content">
		    
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
				
				
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
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->				
</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/progressModal.jsp" />
<jsp:include page="common/footer.jsp" />	
</body>
    
</html>