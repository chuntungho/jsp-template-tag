<%@ tag trimDirectiveWhitespaces="true" body-content="empty" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="lib" type="java.lang.String" description="Resource library, which have been defind in this tag."%>
<%@ attribute name="path" type="java.lang.String" description="Resource file path under WebContent, starts with '/'."%>
<%@ attribute name="type" type="java.lang.String"
	description="Indicator resource type when file ext is unknown, 'css' or 'script'."%>

<c:if test="${empty lib }">
	<c:set var="servletContext" value="${pageContext.servletContext }" />
	<c:url var="url" value="${path}?f=${util:fingerprint(path, servletContext) }" />
	<c:choose>
		<c:when test="${type == 'script' || fn:endsWith(path,'.js') }">
			<script src="${url }" type="text/javascript"></script>
		</c:when>
		<c:when test="${type=='css' || fn:endsWith(path,'.css')}">
			<link href="${url }" type="text/css" rel="stylesheet" />
		</c:when>
	</c:choose>
</c:if>

<%-- for common library --%>
<c:if test="${!empty lib }">
	<c:choose>
		<c:when test="${lib == 'jquery' }">
			<tags:resource path="/js/jquery/jquery-1.11.3.js" />
			<tags:resource path="/js/jquery/jquery.blockUI.js" />
		</c:when>
	</c:choose>
</c:if>