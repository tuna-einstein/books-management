<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="org.slim3.datastore.Datastore"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="org.slim3.datastore.Datastore"%>
<%@ page import="com.usp.inventory.shared.model.Book"%>
<%@ page import="com.usp.inventory.server.meta.BookMeta"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="common/header.html" />
</head>
<body>
	<div data-role="page" id="home" data-theme="b">

		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Add to cart</h1>
			<a href="index" data-icon="back" data-iconpos="notext">Back</a>
		</div>


		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#" data-role="button" data-icon="plus"
						id="add_to_cart">Add to cart</a></li>
				</ul>

			</div>
		</div>
		<!-- /footer -->

		<div data-role="content">
			<%
				Book book = null;
				String bookId = request.getParameter("book_id");
				if (bookId != null) {
					BookMeta meta = BookMeta.get();
					book = Datastore.query(meta)
							.filter(meta.key.equal(KeyFactory.stringToKey(bookId)))
							.asSingle();

					if (book != null) {
			%>
			<h3><%=book.getTitle()%></h3>
			<h4>
				by
				<%=book.getAuthor()%>
			</h4>
			Available units :
			<%=book.getAvaibaleUnits()%>
			<%
				}
				}
			%>
			<div data-role="fieldcontain" class="ui-hide-label">
				<label for="units">Units</label> <input type="number"
					pattern="[0-9]*" name="units" id="units" value=""
					placeholder="Units" />
			</div>
		</div>
	</div>


	<script>
 	$(document).on('pagebeforeshow', '#home', function(){       
    $(document).on('click', '#add_to_cart',function(e) {
        if(e.handled !== true) // This will prevent event triggering more then once
        {
            e.handled = true;
            $.mobile.changePage("UpdateCart", {
						type: "post",
	                    data: { "book_id" :  "<%=bookId%>",
	                    "units" : $("#units").val() },
					});
					return false;
        }
    }); 
});
			
		</script>
</body>
</html>