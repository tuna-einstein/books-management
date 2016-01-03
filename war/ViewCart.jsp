<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="common/header.html" />
</head>
<body>
	<div data-role="page" id="home" data-theme="b">

		<div data-role="header" data-position="fixed" data-theme="b">
			<h1>Place Order</h1>
			<a href="Index" data-icon="back" data-iconpos="notext">Back</a>
		</div>


		<div data-role="content">

			<ul data-role="listview" data-inset="true">
				<li><a href="#"><h3>The Nectar of Devotion</h3>
						<p id="no-ellipsis">by A. C. Bhaktivedanta Swami Prabhupada
							(Author).</p> 
							Units Ordered:
							<input type="number" name="number" pattern="[0-9]*"
					id="number-pattern" value="5"
					class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset" />
							</a> </li>

				<li><a href="#"><h3>The Nectar of Devotion</h3>
						<p id="no-ellipsis">by A. C. Bhaktivedanta Swami Prabhupada
							(Author).</p> 
							Units Ordered:
							<input type="number" name="number" pattern="[0-9]*"
					id="number-pattern" value="5"
					class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset" />
							</a> </li>

				<li><a href="#"><h3>The Nectar of Devotion</h3>
						<p id="no-ellipsis">by A. C. Bhaktivedanta Swami Prabhupada
							(Author).</p> 
							Units Ordered:
							<input type="number" name="number" pattern="[0-9]*"
					id="number-pattern" value="5"
					class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset" />
							</a> </li>
			</ul>

			<a href="index" data-role="button">Place order</a>
		</div>
	</div>
</body>
</html>