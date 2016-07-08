<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="path" type="java.lang.String"%>
<%@ attribute name="icon" type="java.lang.String"%>
<%@ attribute name="key" type="java.lang.String"%>
<%@ attribute name="title" type="java.lang.String"%>
<%@ attribute name="target" type="java.lang.String"%>
<%@ attribute name="styleClass" type="java.lang.String"%>

<c:if test="${not empty key }">
	<c:set var="title">
		<tags:i18n key='${key }' />
	</c:set>
</c:if>
<tags:link path="${path }" styleClass="img-link ${styleClass }" target="${target}">
	<span class="icon ${icon }" title="${title }"></span>
</tags:link>