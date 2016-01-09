<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.usp.inventory.server.meta.BookMeta"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="org.slim3.datastore.Datastore"%>
<%@ page import="com.usp.inventory.shared.model.Book"%>
<%@ page import="com.usp.inventory.server.meta.BookMeta"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.usp.inventory.server.common.CommonUtils"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="common/header.html" />
</head>

<body>
	<%
		UserService userService = UserServiceFactory.getUserService();
		String loginOrLogoutUrl;
		String signinText;
		if (CommonUtils.isLoggedIn()) {
			loginOrLogoutUrl = userService.createLogoutURL("/");
			signinText = "Logout";
		} else {
			loginOrLogoutUrl = userService.createLoginURL("/");
			signinText = "Login";
		}
	%>

	<script type="text/javascript">
	<%
	if (CommonUtils.isLoggedIn()) { %>
	storeObject.isSignedIn = true;	
	<%
	} else {
	%>
	storeObject.isSignedIn = false;
	<% } %>
	</script>

	<div data-role="page" id="home" data-theme="b">



		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Books</h1>
			<a href="#home" data-icon="home" data-iconpos="notext">Home</a> <a
				href=<%=loginOrLogoutUrl%> class="ui-btn-right" data-ajax='false'
				id="shoppingCart"><%=signinText%></a>
		</div>
		<!-- /header -->

		<%if (CommonUtils.isLoggedIn()) { %>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#page_view_cart" data-icon="navigation"
						class="view_cart_nav">View Cart</a></li>
					<li><a href="#page_view_orders" data-icon="navigation"
						class="view_order_nav">View Orders</a></li>
				</ul>

			</div>
		</div>
		<!-- /footer -->
		<% } %>

		<div data-role="content">


			<!-- 	Book book = new Book();
				book.setAuthor("A. C. Bhaktivedanta Swami Prabhupada");
				book.setTitle("Bhagavad-Gita As It Is");
				book.setAvaibaleUnits(100);
				Datastore.put(book); -->


			<ul data-role="listview" data-filter="true"
				data-filter-placeholder="Find Books..." data-filter-theme="b">

				<%
					BookMeta b = BookMeta.get();
					List<Book> list = Datastore.query(b).sort(b.title.desc).asList();
					for (Book bk : list) {
				%>
				<li><a href="#" class="my-book-item"
					data-id=<%=KeyFactory.keyToString(bk.getKey())%>>
						<h3><%=bk.getTitle()%>
						</h3>
						<p>
							Available :
							<%=bk.getAvaibaleUnits()%>
						</p>
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<!-- /page -->


	<div data-role="page" id="page_signin" data-theme="b">

		<div data-role="content">
			<div class="signin-link"></div>
		</div>
	</div>
	<!-- signin page -->

	<div data-role="page" id="page_book_details" data-theme="b">
		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Update cart</h1>
			<a href="#" data-icon="back" data-iconpos="notext" data-rel="back">Back</a>
		</div>


		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#" data-role="button" class="add_to_cart">Update
							cart</a></li>
				</ul>

			</div>
		</div>

		<div data-role="content">
			<div class="book_id"></div>
			<h3>
				<div class="book_title"></div>
			</h3>
			<h5>
				<div class="book_author"></div>
			</h5>
			<div class="available_units"></div>
			<div data-role="fieldcontain" class="ui-hide-label">
				<label for="units">Units</label> <input type="number"
					pattern="[0-9]*" name="units" class="order_units" value=""
					placeholder="Units" />
			</div>
		</div>
	</div>

	<div data-role="page" id="page_view_cart" data-theme="b">
		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>My cart</h1>
			<a href="#home" data-icon="back" data-iconpos="notext">Back</a>
		</div>

		<div data-role="content">
			<ul data-role="listview" data-inset="true" class="list_view"
				data-theme="b">

			</ul>
			<a href="#" data-role="button" class='place_order'>Place order</a>
		</div>
	</div>

	<div data-role="page" id="page_view_orders" data-theme="b">
		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>My orders</h1>
			<a href="#home" data-icon="back" data-iconpos="notext">Back</a>
		</div>

		<div data-role="content">
			<ul data-role="listview" data-inset="true" class="list_view"
				data-theme="b">

			</ul>
		</div>
	</div>
</body>
</html>