<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%-- the same name with HTTP header, should use pageScope prefix --%>
<%@ attribute name="header" description="Header text."%>
<%@ attribute name="headerKey" description="Header key which will be translated."%>

<%@ attribute name="content" description="Column content."%>
<%@ attribute name="escape" type="java.lang.Boolean" description="Indicate if escape the content."%>

<%@ attribute name="width" description="Column width."%>
<%@ attribute name="styleClass" description="CSS class used for both header and content."%>

<%@ attribute name="headerTemplate" fragment="true"
	description="Use header template instead of header attribute if specified."%>
<%@ attribute name="contentTemplate" fragment="true"
	description="Use content template instead of content attribute if specified."%>

<c:set var="_attr" value="" />
<c:if test="${not empty styleClass }">
	<c:set var="_attr" value='${_attr } class="${styleClass }"' />
</c:if>
<c:if test="${not empty width }">
	<c:set var="_attr" value='${_attr } width="${width }"' />
</c:if>

<c:if test="${requestScope._genHeader }">
	<th ${_attr }><c:choose>
			<c:when test="${empty headerTemplate }">
				<c:choose>
					<c:when test="${not empty pageScope.headerKey }">
						<tags:i18n key="${headerKey }" />
					</c:when>
					<c:when test="${empty pageScope.headerKey }">
						<c:out value="${pageScope.header }" />
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${not empty headerTemplate }">
				<jsp:invoke fragment="headerTemplate" />
			</c:when>
		</c:choose></th>
</c:if>

<c:if test="${not requestScope._genHeader }">
	<td ${_attr }><c:choose>
			<c:when test="${empty contentTemplate }">
				<c:choose>
					<c:when test="${not empty pageScope.escape }">
						<tags:html value="${pageScope.content}" />
					</c:when>
					<c:when test="${empty pageScope.escape }">
						<c:out value="${pageScope.content }" />
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${not empty contentTemplate }">
				<jsp:invoke fragment="contentTemplate" />
			</c:when>
		</c:choose></td>
</c:if>