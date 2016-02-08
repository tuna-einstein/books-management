<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>AdminViewOrders</title>
<jsp:include page="common/header.html" />
</head>
<body>




	<div data-role="page" id="page_admin_view_orders" data-theme="b">
		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Orders</h1>
			<a href="#home" data-icon="back" data-iconpos="notext">Back</a>
		</div>



		<div data-role="content">
			<ul data-role="listview" data-theme="b" data-inset="true">
				<li><h3>The Nectar of Devotion</h3>
						<p id="no-ellipsis">by A. C. Bhaktivedanta Swami Prabhupada
							(Author).</p>
						<p id="no-ellipsis">Order date : 5th April, 2016</p>
						<p id="no-ellipsis">Units ordered : 10</p>
						<h4>Status : Approved</h4>

						<div data-role="controlgroup" data-type="horizontal">
							<a href="index.html" data-role="button" data-icon="arrow-u">Accept</a>
							<a href="index.html" data-role="button" data-icon="arrow-d">Reject</a>
						</div> </li>
						
						<li><h3>The Nectar of Devotion</h3>
						<p id="no-ellipsis">by A. C. Bhaktivedanta Swami Prabhupada
							(Author).</p>
						<p id="no-ellipsis">Order date : 5th April, 2016</p>
						<p id="no-ellipsis">Units ordered : 10</p>
						<h4>Status : Approved</h4>

						<div data-role="controlgroup" data-type="horizontal">
							<a href="index.html" data-role="button" data-icon="arrow-u">Accept</a>
							<a href="index.html" data-role="button" data-icon="arrow-d">Reject</a>
						</div> </li>

			</ul>
		</div>
	</div>



</body>
</html>
