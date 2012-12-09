<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="phase2.*" %>
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
if(request.getQueryString() == null || request.getQueryString() == "")
{
	response.sendRedirect("index.html?msg=Error 100");	
}
String isbn = request.getQueryString();
isbn = isbn.substring(5);
session.setAttribute("isbn", isbn);
Book b = new Book();
Connector con = new Connector();
if((String)session.getAttribute("user") == "" || (String)session.getAttribute("user") == null || (String)session.getAttribute("user") == "null")
{
	response.sendRedirect("index.html?msg=Please log  in");	
}
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
<% out.println(b.getBook(Integer.parseInt(isbn), con.stmt)); 
%>
</p>
<form id="order" action="order.jsp" onsubmit="return validateIntegerForm(&#34;order&#34;);">
<input value="Enter the number of order copies as an integer" name="copies" type="text"/>
<input value="Click here to place an order." type="submit"/>
</form>

<br />
<form id="feedback" action="placefeedback.jsp" onsubmit="return validateFeedback(&#34;order&#34;);">
<input value="Enter your feedback" size=200 name="feedback_text" type="text"/>
<input value="Enter your book score" name="feedback_score" type="text"/>
<input value="Click here to place your feedback." type="submit"/>
</form>
</div>


<div id = "right">
<form id = "NUsefulFeedbacks" action="usefulfeedback.jsp" onsubmit="return validateIntegerForm(&#34;NUsefulFeedbacks&#34;);">
Set the number of 'useful' feedbacks you want to see... <input type="text" name = "NumberOfFeedback" /> <input type="submit" value="Submit"/>
</form>
<div id="feedbacks">
<%
Feedback f = new Feedback();
out.println(f.getFeedback(Integer.parseInt(isbn), con.stmt));
con.closeConnection(); 
%>
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