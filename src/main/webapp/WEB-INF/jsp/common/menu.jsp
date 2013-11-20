<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<c:url value="/" var="homeUrl"/>
<c:url value="user" var="userUrl"/>
<c:url value="deviceList" var="adminUrl"/>
<c:url value="logout" var="logoutUrl"/>

<div class="masthead">

    <!-- 
    <div class="col-md-2 col-md-offset-1" style="padding: 10px;">
      <img src="https://app.divshot.com/img/placeholder-100x100.gif" class="hidden-xs">
    </div>
    <div class="col-md-6" style="padding-top: 20px;">
      <h4 class="text-muted">ИНФОРМАЦИОННАЯ СИСТЕМА УЧЕТА<br>          ПОДЪЕМНЫХ СРЕДСТВ И МЕХАНИЗМОВ ПОРТОВ</h4>
    </div>
     -->
     
      <h4 class="text-muted">ИНФОРМАЦИОННАЯ СИСТЕМА УЧЕТА<br>ПОДЪЕМНЫХ СРЕДСТВ И МЕХАНИЗМОВ ПОРТОВ</h4>
        
    

  <ul class="nav nav-justified">
    <li class="active">
      <a href="${homeUrl}">Главная**</a>
    </li>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
     <li class="dropdown">
       <a href="#" data-toggle="dropdown" class="dropdown-toggle">Пользователи <b class="caret"></b></a>
       <ul class="dropdown-menu">
         <li>
           <a href="${adminUrl}">Список пользователей**</a>
         </li>
         <li>
           <a href="#">Группы</a>
         </li>
         <li class="divider"></li>
         <li>
           <a href="#">Ввод нового</a>
         </li>
       </ul>
     </li>
    </sec:authorize>
    <li class="dropdown">
      <a href="#" data-toggle="dropdown" class="dropdown-toggle">Механизмы <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li>
          <a href="${userUrl}">Перечень**</a>
        </li>
        <li>
          <a href="#">Группы</a>
        </li>
        <li>
          <a href="#">Производители</a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">Ввод нового</a>
        </li>
      </ul>
    </li>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
     <li class="dropdown">
       <a href="#" data-toggle="dropdown" class="dropdown-toggle">Порты <b class="caret"></b></a>
       <ul class="dropdown-menu">
         <li>
           <a href="#">Список портов</a>
         </li>
         <li>
           <a href="#">Страны</a>
         </li>
         <li class="divider"></li>
         <li>
           <a href="#">Ввод нового</a>
         </li>
       </ul>
     </li>
    </sec:authorize>
    <li>
      <a href="${logoutUrl}">Выход</a>
    </li>
  </ul>
</div>
