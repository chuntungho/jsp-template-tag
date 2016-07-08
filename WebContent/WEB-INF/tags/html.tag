<%@ tag trimDirectiveWhitespaces="true" body-content="empty" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="value" type="java.lang.String" required="true" description="The text to be excaped"%>
<%@ attribute name="escapeLine" type="java.lang.Boolean" description="Convert line feed \r\n to &lt;br&gt; by default>"%>

<c:set var="line" value='<%="\r\n"%>' />
<c:set var="html" value="${fn:escapeXml(value) }" />
<c:set var="escapeLine" value="${(empty escapeLine) ? true : escapeLine }" />

${escapeLine ? fn:replace(html,line,'<br/>') : html }