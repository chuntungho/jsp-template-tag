<%@ include file="/WEB-INF/jsp/@.jspf"%>
<%
	// to change locale to show other language
	com.chuntung.demo.web.util.WebUtil.setLocale(request, java.util.Locale.CHINESE);

	// for tags:html test
	request.setAttribute("htmlText", "a\r\nb\r\n<label>");
%>
<layout:nested title="Demo">
	<jsp:attribute name="content">
		<c:set var="options" value="${fn:split('a,b,c,d',',') }" />
		<p>
			<label class="strong">options tag: </label><br />
			<select>
				<tags:options items="${options }" selected="b" withEmpty="true" emptyLabel="--" />
			</select>
		</p>
		<hr />
		
		<p>
			<label class="strong">buttonGroup tag: </label><br />
			Radio: <br />
			<tags:buttonGroup items="${options }" name="test" checked="a" /> <br /> <br />
			Check Box: <br />
			<tags:buttonGroup items="${options }" name="test" multiple="true" checked="${fn:split('a,c',',') }" /> <br />
		</p>
		<hr />
		
		<c:set var="text" value="123<br>456" />
		<p>
			<label class="strong">html tag: </label><br />
			<tags:html value="${htmlText }" />
		</p>
		<hr />
		
		<form>
			<input type="hidden" id="page" name="page" />
		</form>
		<p>
			<label class="strong">pagination tag: </label><br />
			<tags:pagination currentPage="3" totalPage="10" selector="#page" />
		</p>
		<hr />
		
		<p>
		<label class="strong">datagrid/column tag: </label><br />
		<tags:datagrid items="${options }" var="item">
			<jsp:attribute name="columns">
				<tags:column header="Header" content="${item }" />
				<tags:column headerKey="demo.header">
					<jsp:attribute name="contentTemplate">
						Use tempalte: ${item }
					</jsp:attribute>
				</tags:column>
				<tags:column>
					<jsp:attribute name="headerTemplate">
						<label>Action</label>
					</jsp:attribute>
					<jsp:attribute name="contentTemplate">
						<button class="button">
							<tags:i18n key="demo.save" />
						</button>
					</jsp:attribute>
				</tags:column>
			</jsp:attribute>
		</tags:datagrid>
		</p>
		<hr />
		
	</jsp:attribute>
</layout:nested>