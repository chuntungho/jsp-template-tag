<%@ tag trimDirectiveWhitespaces="true" body-content="empty" pageEncoding="utf-8"%>

<%@ include file="@taglib.jspf"%>

<%@ attribute name="totalPage" type="java.lang.Integer" required="true" description="Total page count"%>
<%@ attribute name="currentPage" type="java.lang.Integer" required="true" description="The current page"%>

<%-- jquery pagination selector --%>
<%@ attribute name="selector" type="java.lang.String"%>
<%@ attribute name="styleClass" type="java.lang.String"%>

<div class="pagination ${styleClass }" data-selector="${selector }">
	<c:choose>
		<c:when test="${totalPage == 0}">
			<tags:i18n key="pagination.noRecord" />
		</c:when>
		<c:otherwise>
			<span><tags:i18n key="pagination.page" arg0="${currentPage}" arg1="${totalPage }" /></span>
			<c:if test="${totalPage > 1}">
				<c:set var="isFirst" value="${currentPage <= 1 }" />
				<c:set var="isLast" value="${currentPage >= totalPage}" />
				<a href="#" data-page="1" ${isFirst ? 'class="disabled"' : ''}><tags:i18n key="pagination.first" /></a>
				<a href="#" data-page="${currentPage - 1}" ${isFirst ? 'class="disabled"' : ''}><tags:i18n
						key="pagination.previous" /></a>
				<a href="#" data-page="${currentPage + 1 }" ${isLast ? 'class="disabled"' : ''}><tags:i18n key="pagination.next" /></a>
				<a href="#" data-page="${totalPage}" ${isLast ? 'class="disabled"' : ''}><tags:i18n key="pagination.last" /></a>
				
				<tags:resource path="/js/jquery/pagination.js" />
			</c:if>
		</c:otherwise>
	</c:choose>
</div>