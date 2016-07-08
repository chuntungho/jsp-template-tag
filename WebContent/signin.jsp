<%@ include file="/WEB-INF/jsp/@.jspf"%>

<layout:standalone title="Sign in">
	<jsp:attribute name="resources">
		<tags:resource lib="jquery" />
		<tags:resource path="/css/common.css" />
	</jsp:attribute>

	<jsp:attribute name="content">
		<form method="post" action="?signin" target="_top">
		<div class="text-center"> 
			<div>
				<input name="username" type="text" placeholder="User name" />
			</div>
			<div>
				<input name="password" type="password" placeholder="Password" />
			</div>
			<div class="button-group">
				<button type="submit" class="button">Sign in</button>
				<button type="reset" class="button">Reset</button>
			</div>
			</div>
		</form>
	</jsp:attribute>
</layout:standalone>