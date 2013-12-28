<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>


<c:url value="deviceListAdmin" var="deviceListAdminUrl"/>
<c:url value="logout" var="logoutUrl"/>
<c:url value="stevidorSearch" var="stevidorSearchUrl"/>
<c:url value="userSearchAdmin" var="userSearchUrl"/>
            
            <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/static/css/non-responsive.css"/>"/>
              <!-- Fixed navbar -->
			  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			    <div class="container">
			      <div class="navbar-header">
			        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			          <span class="icon-bar"></span>
			          <span class="icon-bar"></span>
			          <span class="icon-bar"></span>
			        </button>
			        <a class="navbar-brand" href="#" style="color: #569EF0">ИТТ24</a>
			      </div>
			      <div class="collapse navbar-collapse">
			        <ul class="nav navbar-nav">
			
			  		  <li ><a href="<c:url value="/home"/>">Главная</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">                
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Порты<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="<c:url value="/stevidorSearch"/>">Список Стивидоров</a></li>
			              <li><a href="#">Список Портов *</a></li>
			              <li><a href="#">Список Стран *</a></li>
			              <li class="divider"></li>
			              <li><a href="<c:url value="/stevidorEdit"/>">Добавить Стивидора</a></li>
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
			          
			          <li class="dropdown">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Отчеты<b class="caret"></b></a>
			            <ul class="dropdown-menu">
			              <li><a href="<c:url value="/static/html/deviceReport.html"/>">Количественный состав</a></li>
			              <li><a href="<c:url value="/static/html/deviceYearsReport.html"/>">Разрез по годам</a></li>
			            </ul>
			          </li>
			  </sec:authorize>        
			          <sec:authorize access="hasRole('ROLE_ADMIN')">          
				          <li class="dropdown">
				            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Администрирование<b class="caret"></b></a>
				            <ul class="dropdown-menu">
				              <li><a href="<c:url value="/userSearchAdmin"/>">Список пользователей</a></li>
				              <li><a href="#">Группы пользователей *</a></li>
				            </ul>				            
				          </li>
			          </sec:authorize>
			          
			        </ul>
			        <ul class="nav navbar-nav navbar-right">
			        	<li>
				          <a style="color: #569EF0"> ${userModel.lastName}&nbsp;${userModel.firstName}</a>
				        </li>
<!-- 			        	<li> -->
<!-- 						    <a href="?lang=ru"> -->
<%-- 						    	<img alt="__" title="Russian" src="<c:url value="/static/images/flags/blank.gif"/>" class="flag flag-ru"> --%>
<!-- 						    </a> -->
<!-- 					    </li> -->
<!-- 					    <li> -->
<!-- 						    <a href="?lang=en"> -->
<%-- 						        <img alt="__" title="US" src="<c:url value="/static/images/flags/blank.gif"/>" class="flag flag-us"> --%>
<!-- 						    </a> -->
<!-- 						</li> -->
				        <li>
				          <a class="btn" data-toggle="modal" data-target="#confirmLogout">&nbsp;<span class="glyphicon glyphicon-log-out"></span>&nbsp;</a>
				        </li>
				    </ul>
			       </div>
			       <!--/.nav-collapse -->
			       
			    </div>
			  </nav>   

 