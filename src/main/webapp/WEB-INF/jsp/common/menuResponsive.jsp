<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>


<c:url value="deviceListAdmin" var="deviceListAdminUrl"/>
<c:url value="logout" var="logoutUrl"/>
<c:url value="stevidorSearch" var="stevidorSearchUrl"/>
<c:url value="userSearchAdmin" var="userSearchUrl"/>


         
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
								<li><a href="<c:url value="/stevidorSearch"/>">Компании-операторы</a></li>
								<li><a href="<c:url value="/portSearch"/>">Порты</a></li>
								<li><a href="<c:url value="/countrySearch"/>">Страны</a></li>
					            <li class="divider"></li>
					            <li><a href="<c:url value="/machineModel"/>">Модели Механизмов</a></li>
					            <li><a href="<c:url value="/group"/>">Группы Механизмов</a></li>
					            <li><a href="<c:url value="/manufacturer"/>">Фирмы Производители</a></li>
							</ul>
						</li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
			          <li class="dropdown">
			          	  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Механизмы<b class="caret"></b></a>
			          	  <ul class="dropdown-menu">
				              <li><a href="<c:url value="/machineSearch"/>">Машины и Механизмы</a></li>
				              <li class="divider"></li>
				              <li><a href="<c:url value="/machineEdit"/>">Добавить Механизм</a></li>
			              </ul>
			          </li>
					  <li class="dropdown">
					  	  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Отчеты<b class="caret"></b></a>	
			          	  <ul class="dropdown-menu">
				              <li><a href="<c:url value="/reportSelection/company/"/>">По Компаниям</a></li>
				              <li><a href="<c:url value="/reportSelection/group/"/>">По Группам</a></li>
				              <li><a href="<c:url value="/reportSelection/account/"/>">По Производителям</a></li><!--  сменить на  manufacturers-->
				              <li><a href="<c:url value="/reportSelection/company/"/>">Списочный</a></li>
			              </ul>
					  </li>
						
			</sec:authorize>        
			<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Администрирование <b class="caret"></b></a>
							<ul class="dropdown-menu">
                                <li><a href="<c:url value="/userSearchAdmin"/>">Список пользователей</a></li>
				              <li class="divider"></li>
				              <li><a href="<c:url value="/userEditAdmin"/>">Добавить Пользователя</a></li>
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
										<a class="dropdown-toggle" href="#" data-toggle="dropdown" style="height:24px; padding:2px 4px; border-left: 0px; color:#E1FCC5; font-weight: bold;">${userModel.firstName} &nbsp;${userModel.lastName} <strong class="caret"></strong></a>
										<ul class="dropdown-menu">
												<!-- <li><a href="#">Личные данные</a></li> -->
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

 
