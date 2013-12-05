<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>


<c:url value="deviceSearch" var="deviceSearchUrl"/>
<c:url value="deviceListAdmin" var="deviceListAdminUrl"/>
<c:url value="logout" var="logoutUrl"/>
<c:url value="stevidorSearch" var="stevidorSearchUrl"/>
<c:url value="userSearchAdmin" var="userSearchUrl"/>
        
			   <!-- Fixed navbar -->
			  <div class="navbar navbar-default navbar-fixed-top">
			    <div class="container">
			      <div class="navbar-header">
			        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			          <span class="icon-bar"></span>
			          <span class="icon-bar"></span>
			          <span class="icon-bar"></span>
			        </button>
			        <a class="navbar-brand" href="#">ИТТ24</a>
			      </div>
			      <div class="collapse navbar-collapse">
			        <ul class="nav navbar-nav">
			
			  		  <li ><a href="<c:url value="/home"/>">Главная</a></li>
			<sec:authorize access="hasRole('ROLE_USER')">                
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Порты<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="${stevidorSearchUrl}">Список Стивидоров</a></li>
			              <li><a href="#">Список Портов</a></li>
			              <li><a href="#">Список Стран</a></li>
			              <li class="divider"></li>
			              <li><a href="<c:url value="stevidorEdit"/>">Добавить Стивидора</a></li>
			            </ul>
			          </li> 
			
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Механизмы<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="${deviceSearchUrl}">Список Механизмов</a></li>
			              <li><a href="#">Список Групп*</a></li>
			              <li><a href="#">Список Производителей*</a></li>
			              <li class="divider"></li>
			              <li><a href="<c:url value="deviceEdit"/>">Добавить Механизм</a></li>
			            </ul>
			          </li>
			          
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Отчеты<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="deviceReport.html">Количественный состав</a></li>
			              <li><a href="deviceYearsReport.html">Разрез по годам</a></li>
			              <li class="divider"></li>
			              <li><a href="<c:url value="deviceEdit"/>">Добавить Отчет</a></li>
			            </ul>
			          </li>
			  </sec:authorize>        
			          <sec:authorize access="hasRole('ROLE_ADMIN')">          
				          <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Администрирование<b class="caret"></b></a>
				            <ul class="dropdown-menu">
				              <li><a href="${userSearchUrl}">Список пользователей*</a></li>
				              <li class="divider"></li>
				              <li><a href="<c:url value="userEditAdmin"/>">Добавить Пользователя</a></li>
				            </ul>				            
				          </li>
			          </sec:authorize>
			          
			        </ul>
			        <ul class="nav navbar-nav navbar-right">
			        	<li>
				          <a> Имя Фамилия</a>
				        </li>
				        <li>
				          <a class="btn" data-toggle="modal" data-target="#confirmLogout">&nbsp;<span class="glyphicon glyphicon-log-out"></span>&nbsp;</a>
				        </li>
				    </ul>
			       </div><!--/.nav-collapse -->
			       
			    </div>
			  </div>   

