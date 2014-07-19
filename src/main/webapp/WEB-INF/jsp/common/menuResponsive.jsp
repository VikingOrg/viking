<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>


<c:url value="deviceListAdmin" var="deviceListAdminUrl"/>
<c:url value="logout" var="logoutUrl"/>
<c:url value="stevidorSearch" var="stevidorSearchUrl"/>
<c:url value="userSearchAdmin" var="userSearchUrl"/>


	    <meta name="viewport" content="width=device-width">
	    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="//cdn.datatables.net/1.10.0-rc.1/css/jquery.dataTables.css"/>
	    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/real_estate.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/theme.css"/>
	    <link rel="stylesheet" type="text/css" media="screen" href="static/css/core.css"/>
	    
	    <!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
	    <script src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
	    <script src="static/js.response.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"> </script>
        <script type="text/javascript" src="static/js/dataTables.bootstrapPagination.js"> </script>
		<script type="text/javascript" src="static/js/ajax-form.js" ></script>
		<script type="text/javascript" src="static/js/dataTables.tableTools.js" ></script>

	
	</head>
	<body>
		<!-- Wrap all page content here -->  
		<div id="wrap">          
    <div class="container">        
 		<div class="row"><!-- start header -->
			<div class="col-sm-4 col-xs-6 logo">
				<a href="index.html">
				<div class="row">
					<div class="col-sm-3 hidden-xs logo-img">
						<img src="" alt=""/>
					</div>
					<div class="col-sm-9 logo-text">
						<h1><br>ИТТ24</h1>
					</div>
				</div>
				</a>
			</div>		
			<div class="col-sm-4 col-xs-6 customer_service pull-right text-right">
				<h4 class="phone"><span class="hidden-xs">Служба поддержки:</span>(812) 275-32-27</h4>
			</div>
		</div><!-- end header -->
	
		           
		<div class="row"><!-- start nav -->    
			<div class="col-sm-12">

				<nav class="navbar navbar-inverse" role="navigation" >
					<div class="navbar-inner">
				  <!-- Brand and toggle get grouped for better mobile display -->
				  <div class="navbar-header">
				    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				      <span class="sr-only">Toggle navigation</span>
				      <span class="icon-bar"></span>
				      <span class="icon-bar"></span>
				      <span class="icon-bar"></span>
				    </button>
				    <a class="navbar-brand visible-xs" href="#">Меню</a>
				  </div>

				  <!-- Collect the nav links, forms, and other content for toggling -->
				  <div class="collapse navbar-collapse navbar-ex1-collapse">
				    <ul class="nav navbar-nav">
						<li><a href="<c:url value="/home"/>" class="first"><span class="glyphicon glyphicon-home" title="Копировать"></span>&nbsp;&nbsp;Главная</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')"> 
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Справочники <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/stevidorSearch"/>">Операторы портов</a></li>
								<li><a href="<c:url value="/portSearch"/>">Порты</a></li>
								<li><a href="<c:url value="/countrySearch"/>">Страны</a></li>
					              <li class="divider"></li>
					            <li><a href="<c:url value="/stevidorEdit"/>">Добавить Компанию</a></li>
							</ul>
						</li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Механизмы<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="<c:url value="/machineSearch"/>">Перегрузочные машины</a></li>
			              <li><a href="<c:url value="/machineModel"/>">Модели Маханизмов</a></li>
			              <li><a href="#">Группы Моделей</a></li>
			              <li><a href="#">Производители*</a></li>
			              <li class="divider"></li>
			              <li><a href="<c:url value="/machineEdit"/>">Добавить машину</a></li>
			            </ul>
			          </li>
						<li><a href="<c:url value="/reportSelection"/>">Отчеты</a></li>
						
			</sec:authorize>        
			<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Администрирование <b class="caret"></b></a>
							<ul class="dropdown-menu">
                                <li><a href="<c:url value="/userSearchAdmin"/>">Список пользователей</a></li>
							</ul>
						</li>
			</sec:authorize>
				    </ul>

				    <ul class="nav navbar-nav navbar-right">		
						        	<li>
									    <a style="border-left: 0px solid #f5f5f5; color: black; padding:10px 4px 1px 4px;" href="?lang=ru">
									    	<img alt="__" title="Russian" src="<c:url value="/static/images/flags/blank.gif"/>" class="flag flag-ru">
									    </a>
								    </li>
								    <li>
									    <a style="border-left: 0px solid #f5f5f5; color: black; padding:10px 4px 1px 4px;" href="?lang=en">
									        <img alt="__" title="US" src="<c:url value="/static/images/flags/blank.gif"/>" class="flag flag-us">
									    </a>
									</li>									
									<li class="dropdown" style="padding:4px;">
										<a class="btn btn-primary dropdown-toggle" href="#" data-toggle="dropdown" style="height:24px; padding:2px 4px;">${userModel.lastName} <strong class="caret"></strong></a>
										<ul class="dropdown-menu">
												<li><a href="#">Личные данные</a></li>
												<li><a data-toggle="modal" data-target="#confirmLogout" style="cursor: pointer">Выход&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-log-out" title="Копировать"></span></a></li>
										</ul>
									</li>
									
					</ul>

				  </div><!-- /.navbar-collapse -->
				</div>
				</nav>

			</div>
		</div><!-- end nav -->
</div>

 