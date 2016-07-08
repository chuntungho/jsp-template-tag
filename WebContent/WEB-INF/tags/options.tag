<%@ tag trimDirectiveWhitespaces="true" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="items" type="java.lang.Object" required="true"%>

<%@ attribute name="value" type="java.lang.String" description="The value field name."%>
<%@ attribute name="label" type="java.lang.String" description="The label field name."%>

<%@ attribute name="labelTemplate" type="java.lang.Boolean"
	description="Indicate if use tag body including nested variable $item as label template, prior to label/labelFormat attribute."%>
<%@ variable name-given="item" scope="NESTED" variable-class="java.lang.Object"
	description="To be used for tag body to format label."%>

<%@ attribute name="selected" type="java.lang.String" description="The selected item value."%>
<%@ attribute name="withEmpty" type="java.lang.Boolean" description="Indicate if empty item will be added at top."%>
<%@ attribute name="emptyLabel" type="java.lang.String" description="Only available when withEmpty is specified."%>

<c:if test="${withEmpty }">
	<option value="">${emptyLabel }</option>
</c:if>

<c:choose>
	<c:when test="${not empty labelTemplate}">
		<c:forEach items="${items }" var="item">
			<jsp:doBody var="itemLabel" />
			<option value="${item[value] }" ${selected == item[value]?'selected':'' } title="${itemLabel }">${itemLabel }</option>
		</c:forEach>
	</c:when>
	<c:when test="${not empty label}">
		<c:forEach items="${items }" var="item">
			<option value="${item[value] }" ${selected == item[value]?'selected':'' }>${item[label]}</option>
		</c:forEach>
	</c:when>
	<c:when test="${empty label }">
		<c:forEach items="${items }" var="item">
			<option value="${item }" ${selected == item ? 'selected':'' }>${item}</option>
		</c:forEach>
	</c:when>
</c:choose>