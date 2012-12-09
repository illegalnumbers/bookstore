<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/jquery.js"></script>
<script src="./scripts/checkPageInput.js"></script>
<script src="./scripts/Utilities.js"></script>
<link rel=StyleSheet href="styles/bookorderStyle.css" type ="text/css" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order a book!</title>
<%
 %>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
Welcome <%= session.getAttribute( "user" ) %> to Super Books!
</div>

<div id = "middle">
<img id="centerphoto" src="./images/book.jpg" />
<p id="description">
This is going to be the description of the book! Isn't this cool?
</p>
<form id="order" action="order.jsp" onsubmit="return validateIntegerForm(&#34;order&#34;);">
<input value="Enter the number of order copies as an integer" type="text"/>
<input value="Click here to place an order." type="submit"/>
</form>
</div>


<div id = "right">
<form id = "search" action="search.jsp" onsubmit="return validateSearch();">
<input id = "search" type="text" value="Search..." onclick="changeContentsOnClick(&#34;search&#34;,&#34;search&#34;)"/>
</form>
<form id = "NUsefulFeedbacks" action="usefulfeedback.jsp" onsubmit="return validateIntegerForm(&#34;NUsefulFeedbacks&#34;);">
Set the number of feedbacks you want to see... <input type="text" id = "NumberOfFeedback" />
</form>
<div id="feedbacks">
</div>
<hr id="rightbar"/> 
<div id="bottomright">
<ul id="sitemap">
<li><a href=<%if((String)session.getAttribute("admin")=="true"){out.print("\"managerprofile.jsp\"");}else{out.print("\"profile.jsp\"");}%>>Home</a></li>
<li><a href="search.jsp">Search</a></li>
<li> <a href="logout.jsp">Logout</a></li>
</ul>
</div>
</div>
</div>
</body>
</html>