<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8" dynamic-attributes="true"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="items" type="java.lang.Object" required="true" description="Data collection"%>
<%@ attribute name="var" type="java.lang.String" required="true" rtexprvalue="false" description="Variable name"%>
<%@ attribute name="styleClass" description="CSS class"%>

<%@ attribute name="columns" fragment="true" description="Columns contains column tag"%>

<%@ attribute name="headTemplate" fragment="true" description="The content in thead, wrapped with tr"%>
<%@ attribute name="rowTemplate" fragment="true" description="The content in tr, not wrapped with tr"%>
<%@ attribute name="footTemplate" fragment="true" description="The content in tfoot, wrapped with tr"%>

<%-- nested scope variable for fragment visible, variable name specified by calling JSP --%>
<%@ variable variable-class="java.lang.Object" name-from-attribute="var" alias="varAlias" scope="NESTED"%>

<table class="grid ${styleClass }">
	<%-- set indicator for column tag to generate header, NOTE that it do not support nested table due to request scope --%>
	<c:set var="_genHeader" value="${true}" scope="request" />
	<thead>
		<c:if test="${not empty headTemplate }">
			<jsp:invoke fragment="headTemplate" />
		</c:if>
		<c:if test="${ empty headTemplate }">
			<tr>
				<jsp:invoke fragment="columns" />
			</tr>
		</c:if>
	</thead>

	<c:set var="_genHeader" value="${false}" scope="request" />
	<tbody>
		<c:if test="${not empty rowTemplate }">
			<c:forEach items="${items }" var="_item" varStatus="_status">
				<tr class="${(_status.index % 2) == 0 ? 'even' : 'odd' }">
					<c:set var="varAlias" value="${_item }" />
					<jsp:invoke fragment="rowTemplate" />
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${ empty rowTemplate }">
			<c:forEach items="${items }" var="_item" varStatus="_status">
				<tr class="${(_status.index % 2) == 0 ? 'even' : 'odd' }">
					<c:set var="varAlias" value="${_item }" />
					<jsp:invoke fragment="columns" />
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<c:remove var="_genHeader" scope="request" />

	<c:if test="${not empty footTemplate }">
		<tfoot>
			<jsp:invoke fragment="footTemplate" />
		</tfoot>
	</c:if>
</table>