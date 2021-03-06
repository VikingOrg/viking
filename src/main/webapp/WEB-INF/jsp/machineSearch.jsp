<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="v" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="ru">
<head>
<title>Таблица Машин и Механизмов</title>

	    <meta name="viewport" content="width=device-width">
        <jsp:include page="common/headCoreElements.jsp" />
        
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		
		<script type="text/javascript">
		var jsonData={};
		
		$(document).ready(function() {
			$.ajaxSetup({ cache: true });
			var selected = [];
            oTable = $('#machine_table').dataTable({
          	  "sDom": '<"#tableActions"T>t<"#source"l>ip',
  			  "scrollX" : true,
          	  "responsive": false,
          	  "sPaginationType": "full_numbers",
              "oLanguage": {
                    "sUrl": "${pageContext.request.contextPath}/static/js/dataTable_ru_RU.txt"
                 },
              "aoColumns": [
                               { "mDataProp": "machineId" },
                               { "mDataProp": "machineId" },
                               { "mDataProp": "machineModel.groupId", "defaultContent": " " },
                               { "mDataProp": "modelId", "defaultContent": " " },
                               { "mDataProp": "machineModel.group.name", "defaultContent": " "  },
                               { "mDataProp": "machineModel.name", "defaultContent": "отсутствует"  },
                               { "mDataProp": "stevidor.name", "defaultContent": " " },
                               { "mDataProp": "stevidor.port.country.nameRus", "defaultContent": " " },
                               { "mDataProp": "stevidor.port.name", "defaultContent": " " },
                               { "mDataProp": "machineModel.details", "defaultContent": " "  },
                               { "mDataProp": "machineModel.manufacturer.nameRus", "defaultContent": " "  },
                               { "mDataProp": "releaseYear", "defaultContent": " " },
                               { "mDataProp": "startDate", "defaultContent": " " },
                               { "mDataProp": "doc", "defaultContent": " " },
                               { "mDataProp": "inventoryNumb", "defaultContent": " " },
                               { "mDataProp": "transNumb", "defaultContent": " " },
                               { "mDataProp": "factoryNumb", "defaultContent": " " },
                               { "mDataProp": "machineModel.manufacturer.country.nameRus", "defaultContent": " "  },
                               { "mDataProp": "location", "defaultContent": " " },
                               { "mDataProp": "nomNo", "defaultContent": " " },
                               { "mDataProp": "regNo", "defaultContent": " " },
                               { "mDataProp": "note", "defaultContent": " " },
                               { "mDataProp": "archived", "defaultContent": " " },                          
                               { "mDataProp": "updateDate", "defaultContent": " " },
                               { "mDataProp": "endDate", "defaultContent": " " },
                               { "mDataProp": "machineModel.modelId", "defaultContent": " " },
                               { "mDataProp": "stevidor.port.portId", "defaultContent": " " }, //26
                               { "mDataProp": "machineModel.manufacturer.manufacturerId", "defaultContent": " " },
                               { "mDataProp": "stevidor.stevidorId", "defaultContent": " " }
                             ],
    	        "aoColumnDefs": [
       	                         {
        	   	        		      "aTargets": [ 1 ],
        	   	        		      "mData": 1,
        	   	        		      "mRender": function ( data, type, machineObject ) {
        	   	        		      	  var input;
        	   	        		      	  if(machineObject.archived =='Y') {
        	   	        		      		  input = 'Удл.';	  
	        	   	        		      } else {
	        	   	        		    	  input = '<input id="machineSelection'+  machineObject.machineId +'" class="newCheckbox" type="checkbox" value="'+machineObject.machineId+'" name="machineSelection">';
		        	   	        		  }
	        	   	        		       
										  return input;
        	   	        		      }
       	   	        		     },
	       	   	        		
	  	                         {
	  	   	        		      "aTargets": [ 10 ],
	  	   	        		      "mData": 10,
	  	   	        		      "mRender": function ( data, type, machineObject ) {
	  	   	        		    		var manufName = data;
	           	   	        		    if(machineObject.machineModel != null && machineObject.machineModel.manufacturer.country.countryId != 1) {
	           	   	        		 		manufName = manufName + " (" + machineObject.machineModel.manufacturer.nameEn + ")";
	                	   	        	}	  	   	        		    		
		  	   	        		        return manufName;
	  	   	        		      }
	 	   	        		     },
	 	   	        		        
       	   	        				{ "bVisible": false, "aTargets": [2, 3, 7, 9, 12, 13, 15, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28] },
//         	   	        		 <c:if test="${userModel.role.id == 2}">
              	                 	{ "bVisible": false,  "aTargets": [6] },
//               	             </c:if>        	 	        	        
        	                         
       	                         {
        	   	        		      "aTargets": [ 4 ],
        	   	        		      "mData": 4,
        	   	        		      "mRender": function ( data, type, machineObject ) {
        	   	        		        return '<a href="${pageContext.request.contextPath}/machineEdit?machineId='+machineObject.machineId+'">'+data+'</a>';
        	   	        		      }
       	   	        		     }
   	        	                   ], 	                                                
                "fnInitComplete": function(oSettings) {
             	   $('select[name="machine_table_length"]').appendTo("#table_length");
            	   $('select[name="machine_table_length"]').addClass("form-control");
           	   	   $("#tableActions").appendTo("#table_Actions");
            	   //this.fnSetFilteringDelay(500);
            	   getData("A");
	              },
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
  
            });


            // Event listener to the two range filtering inputs to redraw on input
            $('#startRangeSelect, #endRangeSelect').change( function() {
            	oTable.fnDraw();
            } );
        	
            $('#dataTableSearch').on('input', function() {
            	oTable.fnFilter( $(this).val());
            });
            
            $('#stevidorSelect').change(function() {
            	var stevidorId = $(this).val();
	            if(stevidorId==''){
	              	oTable.fnFilter(stevidorId, 28);
	            } else {
	             	oTable.fnFilter( "^"+stevidorId+"$", 28 , true);
	            }                
            });
                               		 
//            $('#countrySelect').change(function() {
//            	oTable.fnFilter( $(this).val(), 7);
//            });
            
            $('#portSelect').change(function() {
            	var portId = $(this).val();
	            if(portId==''){
	              	oTable.fnFilter(portId, 26);
	              	refreshStevidorElements("0");
	            } else {
	             	oTable.fnFilter( "^"+portId+"$", 26 , true);
	             	refreshStevidorElements(portId);
	            }
            });
            
    		/*Getting stevidor list from DB.*/
    		function refreshStevidorElements(portId){
    			$.getJSON('${pageContext.request.contextPath}/machineSearch/getStevidors/' + portId, function(objectLis) {
                    var options='<option value="">Все Компании</option>';
                    $.each(objectLis, function (i, e) {
                          options += "<option value='" + e.stevidorId + "'>" + e.name + "</option>";
                    });
                    $('#stevidorSelect').html(options);
                    $('#stevidorSelect').val("");
                    $("#stevidorSelect").select2("val", "");
                    oTable.fnFilter('', 28);
                });			
    		}
            
	        $('#modelSelect').change(function() {
	        	var modelId = $(this).val();
	            if(modelId==''){
	              	oTable.fnFilter(modelId, 25);
	            } else {
	            	oTable.fnFilter( "^"+modelId+"$", 25 , true);
	            }		        
	        	
            });

            
            $('#manufacturerSelect').change(function() {
	        	var manufacturerId = $(this).val();
	            if(manufacturerId==''){
	              	oTable.fnFilter(manufacturerId, 27);
	            } else {
	            	oTable.fnFilter( "^"+manufacturerId+"$", 27 , true);
	            }	
            });                                                
            
            $('#groupSelect').change(function() {
	          	var groupId = $(this).val();
          	    if(groupId==''){
          			oTable.fnFilter(groupId, 2);
          		  	refreshModelElements("0");
          		    refreshManufacturerElements("0");
                } else {
                	oTable.fnFilter( "^"+groupId+"$", 2 , true);
                    /*For Models*/
                    refreshModelElements(groupId);
	                /*For Manufactorers*/
					refreshManufacturerElements(groupId);                 
                }
            }); 

    		/*Getting model list from DB.*/
    		function refreshModelElements(groupId){
                $.getJSON('${pageContext.request.contextPath}/machineEdit/model/' + groupId, function(machineModel) {
                    var options='<option value="">Все модели</option>';
                    $.each(machineModel, function (i, e) {
                        options += "<option value='" + e.modelId + "'>" + e.name + "</option>";
                    });
                    $('#modelSelect').html(options);
                    $('#modelSelect').val("");
                    $("#modelSelect").select2("val", "");
                    oTable.fnFilter('', 25);
                });			
    		}
    		/*Getting manufacturer list from DB.*/
    		function refreshManufacturerElements(groupId){
                $.getJSON('${pageContext.request.contextPath}/machineSearch/getManufacturers/' + groupId, function(objectLis) {
                    var options='<option value="">Все Производители</option>';
                    $.each(objectLis, function (i, e) {
                        options += "<option value='" + e.manufacturerId + "'>" + e.nameRus;
                        if(e.nameEn != ""){
                      	  options += " (" + e.nameEn + ")";
	                      }
                        options += "</option>";
                    });
                    $('#manufacturerSelect').html(options);
                    $('#manufacturerSelect').val("");
                    $("#modemanufacturerSelectlSelect").select2("val", "");
                    oTable.fnFilter('', 27);                    
              	});	        		
    		}
            
            $('#recordTypeSelect').change(function() {
            	var recordType = $(this).val();
            	getData(recordType);
            });
                           

//             $('#selectAll').click(function (e) {
//                 $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
//             });


// for native datatable ajax call progress modal
//    	    .on( 'processing.dt', function ( e, settings, processing ) {
//	    	showProgressModal('#wait_modal');
//		} ).dataTable( {                
// to avoid aaData in JSON response 
//                 "sAjaxDataProp": '',

//            $("#countrySelect").focus();
            $('#dataTableSearch').keypress(function (ev) {
                var keycode = (ev.keyCode ? ev.keyCode : ev.which);
                if (keycode == '13') {
                	ev.preventDefault();
                	return false;
                }
            });

            $('#machine_table tbody').on('click', 'tr', function () {
                var id = this.id;
                var index = $.inArray(id, selected);
         
                if ( index === -1 ) {
                    selected.push( id );
                } else {
                    selected.splice( index, 1 );
                }
         
                $(this).toggleClass('success');
            } );			

        	$("#changesFrom").datepicker({
        		dateFormat: "dd.mm.yy", firstDay: 1, dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ],
        	 	monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],		
        	  	onSelect: function(dataPickerDate) {
        	  	    $.fn.dataTableExt.afnFiltering.push(
        	  	        function(oSettings, aData, iDataIndex) {
        	  	           var tableDate = aData[23].substring(6,10) + aData[23].substring(3,5)+ aData[23].substring(0,2);
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
              
	       	$("#stevidorSelect").select2({
	    	    allowClear:true
	    	}); 
              
//	       	$("#countrySelect").select2({
//	    	    allowClear:true
//	    	}); 
              
	       	$("#portSelect").select2({
	    	    allowClear:true
	    	}); 
	    	
	       	$("#groupSelect").select2({
	    	    allowClear:true
	    	}); 
	    	
	       	$("#modelSelect").select2({
	    	    allowClear:true
	    	}); 

	       	$("#manufacturerSelect").select2({
	    	    allowClear:true
	    	}); 

	       	$("#startRangeSelect").select2({
	    	    allowClear:true
	    	}); 

	       	$("#endRangeSelect").select2({
	    	    allowClear:true
	    	}); 
                    
        	         
        } ); //end of document.ready


        
		function getData(recordType){
        	showProgressModal('#wait_modal');
        	oTable.fnClearTable();
        	var pageData =  $("#machine_search_form").serialize();
      		$.getJSON("${pageContext.request.contextPath}/machineSearch/getMachines/"+recordType, pageData, function (data) {
      			cache: true
      			if (data.length != 0 ) {
      				jsonData = data; 
      				oTable.fnAddData(data);
      			}
      			oTable.fnJumpToRowId('${machineSearchCommand.lastMachine.machineId}');
      			$("#dataTableSearch").focus();
      			closeProgressModal('#wait_modal');
      		}).fail( function(d, textStatus, error) {
      	        console.error("getJSON failed, status: " + textStatus + ", error: "+error);
      	        closeProgressModal('#wait_modal');
      	    });
		} 

        
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

    	jQuery.fn.dataTableExt.oApi.fnJumpToRowId = function ( oSettings, nRowId )	{
    	    /* Find the node's position in the aoData store */
    	    //var iCurrent = oSettings.oApi._fnNodeToDataIndex( oSettings, nRow );
    	    
    	    /*Check if rowId defined*/ 
    	    if ( typeof nRowId === 'undefined' || nRowId =="")  {
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
  			$('#'+nRowId).addClass( "success" );
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
	<form:form id="machine_search_form" class="form-horizontal mini" style="margin-bottom: 0px;" action="machineSearch" 
	commandName="machineSearchCommand" method="post" accept-charset="UTF-8">
	
		<div class="row">

			<!--Sidebar content-->
			<div class="col-sm-4 col-md-3 col-lg-3">
				<div class="col-sm-12 well lform">
					<div class="row">
						<div class="col-sm-12">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<%-- <div class="form-group">
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
								</div> --%>
								<div class="form-group">
									<label>Порт</label>
										<form:select id="portSelect" path="portId"
											cssClass="form-control">
											<form:option value="">Все Порты</form:option>
											<c:forEach items="${machineSearchCommand.userPort}"
												var="port">
												<form:option value="${port.key}"
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
												<form:option value="${stevidor.key}"
													label="${stevidor.value.name}" />
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
											<form:option value="${group.key}" label="${group.value.name}" />
										</c:forEach>
									</form:select>
							</div>
							<div class="form-group">
			                    <label class="form-label">Модель</label>
								<form:select id="modelSelect" path="modelId" cssClass="form-control">
									<form:option value="">Все модели</form:option>
					                <c:forEach items="${machineSearchCommand.machineModelMap}" var="model">
					                    <form:option value="${model.key}" label="${model.value.name}" />
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
											<form:option value="${manufacturer.key}"
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
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="form-group">
	                    <label>Тип Машин</label>
						<form:select id="recordTypeSelect" path="archived" cssClass="form-control" title="Выборка по типу записи">
							<form:option value="ALL" label="Все типы" />
							<form:option value="A" label="Эксплуатируемые" />
							<form:option value="R" label="Списанные" />
							<form:option value="Y" label="Удаленные" />							
						</form:select>	                    
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
			
			<!--  Операции с данными в таблице -->
				<div class="col-sm-12 well lform">
					<div class="row">
						<div class="col-sm-12">
								<a href="#" class="btn btn-danger pull-left" title="Удалить" data-toggle="modal" data-target="#confirmDelete"><span class="glyphicon glyphicon-trash"></span></a>
								<a href="<c:url value="machineEdit"/> "class="btn btn-primary pull-right" title="Ввод нового"><span class="glyphicon glyphicon-plus"></span>&nbsp;Добавить</a>
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

				<!-- 	Таблица со списком машин -->
				<table id="company_header" class="table_report_header">
					<tbody>
						<tr>
							<td class="nowrap">
								<h3 class="page-header">Машины и Механизмы</h3>
							</td>
							<td class="nowrap" id="table_Actions"></td>
						</tr>
					</tbody>
				</table>
				<table id="machine_table" class="table table-striped table-bordered">
			        <thead>
			            <tr>
			                <th class="nowrap">№</th>
			                <th class="nowrap">&nbsp;</th>
			                <th class="nowrap">group Id</th>
			                <th class="nowrap">model Id</th>
			                <th class="nowrap">Группа</th>
			                <th class="nowrap">Модель</th>
			                <th class="nowrap">Компания</th>
			                <th class="nowrap">Страна</th>
			                <th class="nowrap">Порт</th>
							<th class="nowrap">Характеристики</th>									                
							<th class="nowrap">Производитель</th>
							<th class="nowrap">Год выпуска</th>
							<th class="nowrap">Дата ввода</th>
							<th class="nowrap">Контракт №</th>
							<th class="nowrap">Инв. №</th>
							<th class="nowrap">Транс №</th>
							<th class="nowrap">Заводской №</th>
							<th class="nowrap">Страна призводства</th>
							<th class="nowrap">Место установки</th>
							<th class="nowrap">Номенкл. №</th>
							<th class="nowrap">Рег. №</th>
							<th class="nowrap">Примечания</th>
							<th class="nowrap">Удалена</th>
							<th class="nowrap">Посл. изм.</th>
							<th class="nowrap">Дата спис.</th>
							<th class="nowrap">ModelId</th>
							<th class="nowrap">PortId</th>
							<th class="nowrap">ManId</th>
							<th class="nowrap">StevidorId</th>
							<!-- <th>Дата списания</th> -->
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

		<jsp:include page="common/progressModal.jsp" />
	</form:form>

</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />
</body>
</html>