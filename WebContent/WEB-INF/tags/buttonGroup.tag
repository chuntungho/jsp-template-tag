<%@ tag trimDirectiveWhitespaces="true" body-content="empty" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="items" type="java.lang.Object" required="true"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="Field name in form."%>
<%@ attribute name="value" type="java.lang.String" description="Value field name."%>
<%@ attribute name="label" type="java.lang.String" description="Label field name。"%>

<%@ attribute name="multiple" type="java.lang.Boolean" description="True to render as checkbox, else radio by default"%>

<%@ attribute name="checked" type="java.lang.Object" description="The checked value, string or collection"%>
<%@ attribute name="disabled" type="java.lang.Boolean" description="Make the element disabled."%>

<%@ variable name-given="item" variable-class="java.lang.Object" description="Used for tag body"%>

<c:set var="type" value="${ multiple ? 'checkbox' : 'radio' }" />

<c:choose>
	<%-- specify value field --%>
	<c:when test="${not empty value }">
		<c:if test="${not empty label }">
			<c:forEach items="${items }" var="item">
				<c:set var="_checked" value="${multiple ? util:exists(item[value], checked) : item[value] == checked }" />
				<label class="form-label pointer"><input class="form-field" type="${type }" name="${name }"
					value="${item[value] }" ${ _checked ? 'checked ' : ''} ${disabled ? 'disabled' : '' } />${item[label] }</label>
			</c:forEach>
		</c:if>
		<%-- use body template as label --%>
		<c:if test="${empty label }">
			<c:forEach items="${items }" var="item">
				<c:set var="_checked" value="${multiple ? util:exists(item[value], checked) : item[value] == checked }" />
				<label class="form-label pointer"><input class="form-field" type="${type }" name="${name }"
					value="${item[value] }" ${ _checked ? 'checked ' : ''} ${disabled ? 'disabled' : '' } /><jsp:doBody /></label>
			</c:forEach>
		</c:if>
	</c:when>
	<%-- no value field, consider as primitive object --%>
	<c:when test="${empty value }">
		<c:forEach items="${items }" var="item">
			<c:set var="_checked" value="${multiple ? util:exists(item, checked) : item == checked }" />
			<label class="form-label pointer"><input class="form-field" type="${type }" name="${name }" value="${item }"
				${ _checked ? 'checked ' : ''} ${disabled ? 'disabled' : '' } />${item }</label>
		</c:forEach>
	</c:when>
</c:choose>