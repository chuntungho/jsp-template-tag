<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="../@taglib.jspf"%>

<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="resources" fragment="true"%>
<%@ attribute name="content" fragment="true"%>

<layout:base title="${title} ">
	<jsp:attribute name="resources">
		<tags:resource path="/css/common.css" />
		<jsp:invoke fragment="resources" />
	</jsp:attribute>

	<jsp:attribute name="content">
		<div class="wrapper">
			<div class="header">
				<div class="logo"></div>
			</div>
			
			<fieldset class="content">
				<legend style="padding: 0 30px; color: #666; font-weight: bold">${title }</legend>
					<jsp:invoke fragment="content" />
			</fieldset>
			
			<div class="footer text-center">
				<tags:i18n key="common.copyright" arg0="2016" />
			</div>
		</div>
	</jsp:attribute>
</layout:base>