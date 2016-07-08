<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="path" type="java.lang.String" required="true" description="The path under WebContent."%>

<%@ attribute name="key" type="java.lang.String" description="The i18n key that will be rendered as inner text."%>
<%@ attribute name="title" type="java.lang.String" description="The link title."%>

<%@ attribute name="id" type="java.lang.String" description="The link id."%>
<%@ attribute name="target" type="java.lang.String" description="The link target."%>
<%@ attribute name="styleClass" type="java.lang.String" description="CSS class"%>

<c:url var="url" value="${path }" />

<c:set var="attr" value="" />

<c:if test="${! empty target }">
	<c:set var="attr" value='${attr }target="${target }" ' />
</c:if>
<c:if test="${! empty title }">
	<c:set var="attr" value='${attr }title="${title }" ' />
</c:if>
<c:if test="${! empty styleClass }">
	<c:set var="attr" value='${attr }class="${styleClass }" ' />
</c:if>
<c:if test="${! empty id }">
	<c:set var="attr" value='${attr }id="${id }" ' />
</c:if>

<a href="${url}" ${attr}><c:choose>
		<c:when test="${! empty key}">
			<tags:i18n key="${key}" />
		</c:when>
		<c:otherwise>
			<jsp:doBody />
		</c:otherwise>
	</c:choose></a>