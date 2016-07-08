<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="value" type="java.lang.Object" required="true"%>

<%@ attribute name="type" type="java.lang.String" description="To type, date/datetime/number."%>
<%@ attribute name="pattern" type="java.lang.String" description="Format pattern."%>

<c:if test="${type == 'date' or type == 'datetime' }">
	<c:if test="${empty pattern}">
		<c:set var="pattern" value="${ type == 'date' ? 'yyyy-MM-dd' : 'yyyy-MM-dd HH:mm:ss' }" />
	</c:if>
	<fmt:formatDate value="${value }" pattern="${pattern }" />
</c:if>