<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="../@taglib.jspf"%>

<%@ attribute name="title" type="java.lang.String"%>
<%@ attribute name="resources" fragment="true"%>
<%@ attribute name="content" fragment="true"%>

<layout:base title="${title }">
	<jsp:attribute name="resources">
		<%-- include common css & jquery lib by default --%>
		<tags:resource path="/css/common.css" />
		<tags:resource lib="jquery" />
		
		<jsp:invoke fragment="resources" />
	</jsp:attribute>

	<jsp:attribute name="content">
		<%-- to define more detail here --%>
		<div class="relative">
			<div class="text-center" style="border: 1px solid #999; padding: 3px;">Top Menus</div>
			<div style="position: absolute; width: 100px; padding: 3px;">Left Menus</div>
			<div style="position: absolute; left: 100px; border: 1px solid #999; padding: 3px;">
				<jsp:invoke fragment="content" />
			</div>
		</div>
	</jsp:attribute>
</layout:base>