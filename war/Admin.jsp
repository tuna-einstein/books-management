<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Admin</title>
<jsp:include page="common/header.html" />
</head>
<body>
	<div data-role="page" id="page_admin_orders" data-theme="b">
		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Orders</h1>
			<a href="index" data-icon="home" data-iconpos="notext">Home</a> <a
				href="#" class="ui-btn-right" data-ajax='false' id="shoppingCart">Hello</a>
		</div>
		<!-- /header -->

		<div data-role="content">
			<ul data-role="listview" data-inset="true" class="list_view"
				data-theme="b">
			</ul>
		</div>
	</div>
</body>
</html>
