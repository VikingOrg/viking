<%@tag description="Extended input tag to allow for sophisticated errors" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="title" required="false" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="type" required="false" type="java.lang.String"%>
<%@attribute name="tabindex" required="false" type="java.lang.String"%>
<%@attribute name="maxlength" required="false" type="java.lang.String"%>
<%@attribute name="autocomplete" required="false" type="java.lang.String"%>

<spring:bind path="${path}">
    <div class="form-group ${status.error ? 'has-error' : '' }">
		<c:if test="${not empty label}">
		    <%--<c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" /> --%>
		    <label class="form-label" for="${path}">${label}<c:if test="${required}"><span class="required">*</span></c:if></label>
		</c:if>    
        
        <div class="controls">
            <form:input 
            	id="${empty id ? path : id}" 
            	path="${path}" 
            	cssClass="${empty cssClass ? 'form-control' : cssClass}"
            	type="${empty type ? 'text' : type}"
            	title="${empty title ? '' : title}"
            	tabindex="${empty tabindex ? '' : tabindex}"
            	maxlength="${empty maxlength ? '' : maxlength}"
            	autocomplete="${empty autocomplete ? '' : autocomplete}"/>
            	
           	<form:errors path="${path}" cssClass="control-label"/>
        </div>
    </div>
</spring:bind>

