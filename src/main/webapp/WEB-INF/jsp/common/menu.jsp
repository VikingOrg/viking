<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
     <c:when test="${system.responsiveDesign}">
     	<jsp:include page="menuResponsive.jsp" />
     </c:when>
     <c:otherwise>
		<jsp:include page="menuNotResp.jsp" />
     </c:otherwise>
</c:choose>


 