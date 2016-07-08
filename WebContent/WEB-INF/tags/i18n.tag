<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="key" type="java.lang.String" required="true" description="The message key."%>

<%-- Allow 3 arguments at most --%>
<%@ attribute name="arg0" type="java.lang.Object" description="To replace the first argumetn {0}."%>
<%@ attribute name="arg1" type="java.lang.Object" description="To replace the second argumetn {1}."%>
<%@ attribute name="arg2" type="java.lang.Object" description="To replace the third argumetn {3}."%>

<%@ attribute name="bundle" type="java.lang.String"%>

<c:set var="_bundle" value="${empty bundle ? initParam['i18nDefaultBundle'] : bundle }" />

<fmt:setLocale value="${util:locale(pageContext.request) }" />

<fmt:bundle basename="${_bundle }">
	<fmt:message key="${key }">
		<c:if test="${not empty arg0 }">
			<fmt:param value="${arg0 }" />
		</c:if>
		<c:if test="${not empty arg1 }">
			<fmt:param value="${arg1 }" />
		</c:if>
		<c:if test="${not empty arg2 }">
			<fmt:param value="${arg2 }" />
		</c:if>
	</fmt:message>
</fmt:bundle>