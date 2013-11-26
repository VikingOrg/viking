<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<c:url value="/" var="homeUrl"/>
<c:url value="deviceSearch" var="deviceSearchUrl"/>
<c:url value="deviceListAdmin" var="deviceListAdminUrl"/>
<c:url value="logout" var="logoutUrl"/>
<c:url value="portSearch" var="portSearchUrl"/>
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
			
			  		  <li ><a href="${homeUrl}">Главная*</a></li>
			          
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Инфраструктура<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="${portSearchUrl}">Стивидоры*</a></li>
			              <li><a href="#">Порты</a></li>
			              <li><a href="#">СВХ и ТС</a></li>
			              <li><a href="#">Транзит</a></li>
			              <li class="divider"></li>
			              <li><a href="#">Отчеты/статус</a></li>
			              <li><a href="#">Загрузка/Трафик</a></li>
			            </ul>
			          </li> 
			
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Механизмы<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="${deviceSearchUrl}">Поиск*</a></li>
			              <li><a href="#">Наменклатура</a></li>
			              <li class="divider"></li>
			              <li><a href="#">Потребности</a></li>
			              <li><a href="#">Износ</a></li>
			            </ul>
			          </li>
			          <sec:authorize access="hasRole('ROLE_ADMIN')">          
				          <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Администрирование<b class="caret"></b></a>
				            <ul class="dropdown-menu">
				              <li><a href="${userSearchUrl}">Список пользователей*</a></li>
				              <li><a href="${deviceListAdminUrl}">Оборудование*</a></li>
				              <li class="divider"></li>
				              <li><a href="#">Добавить пользователя</a></li>
				            </ul>				            
				          </li>
			          </sec:authorize>
			          <li> <a href="<c:url value="j_spring_security_logout" />" > Logout</a>
			        </ul>
			      </div><!--/.nav-collapse -->
			    </div>
			  </div>   


