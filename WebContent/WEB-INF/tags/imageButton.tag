<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="type" type="java.lang.String"%>
<%@ attribute name="icon" type="java.lang.String"%>
<%@ attribute name="key" type="java.lang.String"%>
<%@ attribute name="title" type="java.lang.String"%>
<%@ attribute name="id" type="java.lang.String"%>
<%@ attribute name="name" type="java.lang.String"%>
<%@ attribute name="styleClass" type="java.lang.String"%>

<c:if test="${not empty key }">
	<c:set var="title">
		<tags:i18n key='${key }' />
	</c:set>
</c:if>
<c:if test="${not empty id }">
	<c:set var="idAttr" value='id="${id }"' />
</c:if>
<c:if test="${not empty name }">
	<c:set var="nameAttr" value='name="${name }"' />
</c:if>
<button type="${type }" class="img-btn ${styleClass }" ${idAttr} ${nameAttr }>
	<span class="icon ${icon }" title="${title }"></span>
</button>