<%@ include file="/WEB-INF/jsp/@.jspf"%>

<layout:base title="Home">
	<jsp:attribute name="resources">
		<tags:resource path="/css/common.css" />
	</jsp:attribute>

	<jsp:attribute name="content">
		<p class="text-center">
			<tags:link path="/signin.jsp">Sign In Demo</tags:link>
		</p>
		<p class="text-center">
			<tags:link path="/demo.jsp">Other Demos</tags:link>
		</p>
	</jsp:attribute>
</layout:base>