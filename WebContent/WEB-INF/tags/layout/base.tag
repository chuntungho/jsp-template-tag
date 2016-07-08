<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="../@taglib.jspf"%>

<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="resources" fragment="true"%>
<%@ attribute name="content" fragment="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tags:i18n key="common.title"/> - ${title }</title>
<tags:resource path="/css/base.css" />

<%-- resources here --%>
<jsp:invoke fragment="resources" />

</head>
<body>

	<%-- content here --%>
	<jsp:invoke fragment="content" />

</body>
</html>