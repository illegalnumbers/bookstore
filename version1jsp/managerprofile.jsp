<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/jquery.js"></script>
<script src="./scripts/checkPageInput.js"></script>
<script src="./scripts/Utilities.js"></script>
<link rel=StyleSheet href="styles/managerProfileStyle.css" type ="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
 %>
<title><%= (String)session.getAttribute( "user" ) %>'s Profile</title>
</head>
<body>
<div id="page-container">
<div id = "top">
<img id="leftlogo" src="./images/logo.jpg" />

<h1>Welcome Manager <%= session.getAttribute( "user" ) %></h1>
<a href="addbook.jsp">Add a book to the Inventory</a>
<a href="addbook.jsp">Edit a book in the Inventory</a> //going to make some call to populate the form with the amount of copies..orsomething.
<a href="logout.jsp">Logout</a>
</div>

<div id = "bottom">
First column is the number of popular books, second column is # of popular authors, third is number of popular subjects, fourth is number of trusted users and fifth (the last one) is useful users.
<form id="manager_form" action="manager_action.jsp" onsubmit="return validateIntegerForm(&#34order&#34);">
<table id="bottom">
<tr><td><input type = "text" id="book" onclick="changeContentsOnClick(&#34;manager_form&#34;,&#34;book&#34;)" value="Insert the # to search for..." size=35/></td><td><input type = "text" id="author" value="Insert the # to search for..." size=35 onclick="changeContentsOnClick(&#34;manager_form&#34;,&#34;author&#34;)"/></td><td><input type = "text" id="subject" value="Insert the # to search for..." size=35 onclick="changeContentsOnClick(&#34;manager_form&#34;,&#34;subject&#34;)"/></td><td><input type = "text" id="trusteduser" value="Insert the # to search for..." size=35 onclick="changeContentsOnClick(&#34;manager_form&#34;,&#34;trusteduser&#34;)"/></td><td><input type = "text" id="usefuluser" value="Insert the # to search for..." size=35 onclick="changeContentsOnClick(&#34;manager_form&#34;,&#34;usefuluser&#34;)"/></td></tr>
<tr><td><div id="bookstats">Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.</div></td><td><div id="authorstats">Test Lorem Ipsum.</div></td><td><div id="subjectstats">Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.Test Lorem Ipsum.</div></td><td><div id="trustedusers">Test Lorem Ipsum.</div></td><td><div id="usefulusers">Test Lorem Ipsum.</div></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>