<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ru">
<head>
<title>УЖАС</title>
		<jsp:include page="common/headCoreElements.jsp" />
		<!-- text fonts -->
		<link rel="stylesheet" href="<c:url value="/static/assets/css/ace-fonts.css"/>" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<c:url value="/static/assets/css/ace.min.css"/>" id="main-ace-style" />
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="//cdn.datatables.net/plug-ins/725b2a2115b/api/fnAddDataAndDisplay.js"></script>
		 <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
            	var oTable = $('#group_table').dataTable( {
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
                    	   $("#tableActions").appendTo("#table_Actions");
	                	   $('select[name="group_table_length"]').appendTo("#table_length");
	                	   $('select[name="group_table_length"]').addClass("form-control");
	 	              },                   
                } );


                $('#dataTableSearch').on('input', function() {
                	oTable.fnFilter( $(this).val());
                });

                $('#closeFilters').on('click', function(e) {
                    e.preventDefault();

                    //$('#toggleOne').animate({
                    //    "width": "0%"
                    //}, "slow", function() {
                        // Hide when width animation finishes
                   //     $(this).hide();
                   //     $('#toggleTwo').toggleClass('col-sm-12 col-sm-8')
                   // });
                    
                    //$('#toggleOne').toggleClass('col-sm-0 col-sm-4');
                    //$('#toggleTwo').toggleClass('col-sm-12 col-sm-8');

                                        
                    //var $lefty = $('#toggleOne');
                    //$lefty.animate({
                    //  left: parseInt($lefty.css('left'),10) == 0 ?
                    //    -$lefty.outerWidth() :
                    //    0
                    //});
                    //$('#toggleOne').animate({width: 'toggle'});                    
                    //$('#toggleTwo').toggleClass('col-sm-12 col-sm-8')

                });
                
                   		 
            } );
            
        </script>
        
        <style type="text/css">

   		</style>
	
	</head>
	
	<body>
	
	<!-- Wrap all page content here -->  
	<div id="wrap">	
	
	<jsp:include page="common/menu.jsp" />

    <!----- Begin page content ------>
	<div class="container-fluid">
			<div class="row">
	
					<!-- Start table content -->
					
					<div class="container">
						<div class="page-header">
							<h1>
								Помощь
								<small>
									по работе в Системе учета Машин и Механизмов
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="tabbable">
									<!-- #section:pages/faq -->
									<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
										<li class="active">
											<a data-toggle="tab" href="#faq-tab-1">
												<i class="fa-green fa fa-question-circle bigger-120"></i>
												Общее
											</a>
										</li>

										<li>
											<a data-toggle="tab" href="#faq-tab-2">
												<i class="fa-green fa fa-user bigger-120"></i>
												Регистрация
											</a>
										</li>

										<li>
											<a data-toggle="tab" href="#faq-tab-3">
												<i class="fa-green fa fa-book bigger-120"></i>
												Справочники
											</a>
										</li>
										
										<li>
											<a data-toggle="tab" href="#faq-tab-4">
												<i class="fa-green fa fa-truck bigger-120"></i>
												Механизмы
											</a>
										</li>
										
										<li>
											<a data-toggle="tab" href="#faq-tab-5">
												<i class="fa-green fa fa-files-o bigger-120"></i>
												Отчеты
											</a>
										</li>

										<!-- <li class="dropdown">
											<a data-toggle="dropdown" class="dropdown-toggle" href="#">
												<i class="fa-green fa fa-magic bigger-120"></i>

												Прочее
												<i class="fa fa-caret-down"></i>
											</a>

											<ul class="dropdown-menu dropdown-lighter dropdown-125">
												<li>
													<a data-toggle="tab" href="#faq-tab-6"> Affiliates </a>
												</li>

												<li>
													<a data-toggle="tab" href="#faq-tab-7"> Merchants </a>
												</li>
											</ul>
										</li> -->
										<!-- /.dropdown -->
									</ul>

									<!-- /section:pages/faq -->
									<div class="tab-content no-border padding-24">
										<div id="faq-tab-1" class="tab-pane fade in active">
											<h3 class="page-header">
												Общие вопросы по работе в Системе
											</h3>

											<div class="space-8"></div>

											<div id="faq-list-1" class="panel-group accordion-style1 accordion-style2">
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-1-1" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-left pull-right" data-icon-hide="fa fa-chevron-down" data-icon-show="fa fa-chevron-left"></i>

															<i class="fa fa-question bigger-130"></i>
															&nbsp; Описание Системы учета Механизмов
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-1-1">
														<div class="panel-body">
															<p>Настоящая система учета перегрузочных машин в морских портах разработана с соблюдением последних требований в области стандартизации и унификации ведения упорядоченного документооборота в российских портах и ориентирована на повышение уровня производительности и культуры организации отчетности технических и технологических служб операторов морских терминалов (стивидорных компаний).</p>
												            <p>Для целей повышения производительности интерфейс приложения максимально упрощен и интуитивно понятен.</p>
												            <p>Вся система построена на серверной технологии и для пользования сотрудниками требуется только компьютер, подключенный к сети Интернет и браузер, поддерживающий все основные функции языка гипертекстовой разметки. Подключение дополнительных устройств, программ и расширений не требуется.</p>
												            <p>Кроме всего прочего, важным достоинством данной системы является то, что для поддержания ее в актуальном состоянии, расширения функциональности, работоспособности не требуются периодические обновления и отслеживания изменений - все действия производятся автоматически в фоновом режиме по мере внесения изменений в законодательство, интерфейс программы без затрагивания непосредственно данных хранящихся в базе.</p>
												            <p>Безопасность вводимых данных обеспечивается уровнями проверки прав доступа и серверными технологиями.</p>
												            <p>Целостность данных, хранящихся на удаленном сервере подвергается многократному резервированию и позволяет уверенно использовать базы данных даже для хранения критичной к сохранности информации.
												            </p>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-1-2" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-left pull-right" data-icon-hide="fa fa-chevron-down" data-icon-show="fa fa-chevron-left"></i>

															<i class="fa fa-question"></i>
															&nbsp; Назначение Системы учета Механизмов
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-1-2">
														<div class="panel-body">
															<p>С помощью данной Системы пользователи могут вести учет любых машин и механизмов, находящихся на балансе Компании, своевременно вносить изменения в регистрах учета, формировать отчеты по списочному и количественному составу.</p>
															<p>В отчетах применяются гибкие условия отбора и фильтрации записей. Это позволяет наглдядно демонстрировать структуру, состав, дифференциацию Машин и Механизмов как внутри компании, так и в целом по всем Портам.</p>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-1-3" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-left pull-right" data-icon-hide="fa fa-chevron-down" data-icon-show="fa fa-chevron-left"></i>

															<i class="fa fa-question bigger-130"></i>
															&nbsp; Организация рабочего места
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-1-3">
														<div class="panel-body">
															<p>Для запуска и работы в Системе необходим компьютер, подключенный к сети Интернет.</p>
															<p>Операционная система может быть любая.</p>
															<p>Программное обеспечение должно содержать стандартный Интернет-браузер, с установленными последними обновлениями. <b>Рекомендуемые для работы:</b> </p>
															<table class="table table-bordered table-striped">
				                    						  <thead>
									                              <tr>
										                              <th class="column-check nowrap">&nbsp;</th>
										                              <th class="nowrap">Интернет-браузер</th>
										                              <th class="nowrap">Версия</th>
									                              </tr>
									                          </thead>
									                          <tbody>
										                            <tr>
										                                <td class="column-check nowrap">
										                                	1			                                	
										                                </td>
											                         	<td class="nowrap">
											                         		Google Chrome
											                         	</td>
										                              <td class="nowrap">36</td>
										                            </tr>
										                            <tr>
										                                <td class="column-check nowrap">
										                                	2			                                	
										                                </td>
											                         	<td class="nowrap">
											                         		Firefox
											                         	</td>
										                              <td class="nowrap">31</td>
										                            </tr>
										                            <tr>
										                                <td class="column-check nowrap">
										                                	3			                                	
										                                </td>
											                         	<td class="nowrap">
											                         		Internet Explorer
											                         	</td>
										                              <td class="nowrap">8.0</td>
										                            </tr>
										                            <tr>
										                                <td class="column-check nowrap">
										                                	4			                                	
										                                </td>
											                         	<td class="nowrap">
											                         		Safari
											                         	</td>
										                              <td class="nowrap">5.0</td>
										                            </tr>
									                          </tbody>
									                    </table>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-1-4" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-left pull-right" data-icon-hide="fa fa-chevron-down" data-icon-show="fa fa-chevron-left"></i>

															<i class="fa fa-question bigger-130"></i>
															&nbsp; Связь с сетью Интернет
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-1-4">
														<div class="panel-body">
															<p>Так как хранение и обработка введенной информации осуществляется на удаленных защищенных серверах, то для доступа к ним требуется подключение к сети Интернет.</p>
															<p>Скорость соединения может влиять на проведение операций и осуществление запросов к базе данных. Рекомендуется использовать высокоскоростное подключение, а в местах где это невозможно подключение через модемы сотовой связи.</p>
														</div>
													</div>
												</div>
												
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-1-5" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-left pull-right" data-icon-hide="fa fa-chevron-down" data-icon-show="fa fa-chevron-left"></i>

															<i class="fa fa-question bigger-130"></i>
															&nbsp; Безопасность хранимых данных
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-1-5">
														<div class="panel-body">
															<p>Для предотвращения несанкционированного доступа в Систему и к данным используется многоуровневая защита, основанная на проверке идентификационных данных пользователя.</p>
															<p>В целях соблюдения конфиденциальности личных данных, доступ к ним ограничен и введен запрет на использование учетных данных и пароля другими лицами.</p>
															<p>Сами учетные данные о Машинах и Механизмах хранятся на защищенных серверах и в целях сохранности ведется учет изменений и дополнений, вносимых пользователями.</p>
														</div>
													</div>
												</div>

											</div>
										</div>

										<div id="faq-tab-2" class="tab-pane fade">
											<h3 class="page-header">
												Справка по вопросам регистрации в Системе
											</h3>

											<div class="space-8"></div>

											<div id="faq-list-2" class="panel-group accordion-style1 accordion-style2">
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-2-1" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-chevron-right smaller-80" data-icon-hide="fa fa-chevron-down align-top" data-icon-show="fa fa-chevron-right"></i>
															&nbsp; Как зарегистрироваться в Системе?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-2-1">
														<div class="panel-body">
															<ol>
															 <li>Составляется список лиц, допущенных к работе в Системе.</li>
															 <li>Утвержденный руководителем Компании-оператора список направляется в адрес Службы поддержки.</li>
															 <li>Пользователи на странице Регистрации заполняют форму с данными о себе.</li>
															 <li>В течение 24 часов администратор Службы поддержки сверяет данные и разрешает работу в Системе.</li>
															</ol>
														</div>
													</div>
												</div>

											</div>
										</div>

										<div id="faq-tab-3" class="tab-pane fade">
											<h3 class="page-header">
												Вопросы по работе со Справочниками Системы
											</h3>

											<div class="space-8"></div>

											<div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-1" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
															Для чего нужен Справочник Стран?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-1">
														<div class="panel-body">
															<p>Справочник Стран содержит сведения о написании русскоязычного и англоязычного наименования Страны.</p>
															<p>Данный справочник используется в целях упорядочения информации по принадлежности Компании-оператора, а также при классификации Производителей Машин и Механизмов.</p>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-2" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
					  										Для чего нужен Справочник Производителей?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-2">
														<div class="panel-body">
															<p>Справочник Производителей используется для классификации Моделей Машин и Механизмов, используемых в Компаниях-операторах Портов.</p>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-3" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
															Для чего нужен Справочник Групп Машин и Механизмов?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-3">
														<div class="panel-body">
															<p>Справочник Групп позволяет вести упорядоченный учет и дифференциацию различных перегрузочных Машин и Механизмов с целью упрощения доступа и сортировки.</p>
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-4" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
															Для чего нужен Справочник Моделей Машин и Механизмов?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-4">
														<div class="panel-body">
															<p>Справочник Моделей содержит наиболее полный список разлличных видов перегрузочных Машин и Механизмов, используемых для работы в портах.	</p>
															<p>В случае необходимости может быть дополнен необходимыми данными или внесены исправления в существующие записи.</p>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div id="faq-tab-4" class="tab-pane fade">
											<h4 class="blue">
												<i class="purple fa fa-magic bigger-110"></i>
												Miscellaneous Questions
											</h4>

											<div class="space-8"></div>

											<div id="faq-list-4" class="panel-group accordion-style1 accordion-style2">
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-1" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-hand-o-right" data-icon-hide="fa fa-hand-o-down" data-icon-show="fa fa-hand-o-right"></i>&nbsp;
						Enim eiusmod high life accusamus terry richardson?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-1">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-2" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-frown-o bigger-120" data-icon-hide="fa fa-smile-o" data-icon-show="fa fa-frown-o"></i>&nbsp;
					  Single-origin coffee nulla assumenda shoreditch et?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-2">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-3" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
					  Sunt aliqua put a bird on it squid?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-3">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-4" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="fa fa-plus smaller-80" data-icon-hide="fa fa-minus" data-icon-show="fa fa-plus"></i>&nbsp;
					  Brunch 3 wolf moon tempor sunt aliqua put?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-4">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
			
				
			</div>
	</div>
</div>
<!-- Closing div tag for wrap -->
<jsp:include page="common/footer.jsp" />

</body>
</html>