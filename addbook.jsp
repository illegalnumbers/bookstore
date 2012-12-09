<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/jquery.js"></script>
<script src="./scripts/checkPageInput.js"></script>
<script src="./scripts/Utilities.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=StyleSheet href="styles/addbookStyle.css" type ="text/css" />
<title>Add a new Book</title>
<%
if((String)session.getAttribute("user") == "" || (String)session.getAttribute("user") == null || (String)session.getAttribute("user") == "null")
{
	response.sendRedirect("index.html?msg=Please log  in");	
}
else if ((String)session.getAttribute("admin") != "true")
{
	response.sendRedirect("index.html?msg=You are not an admin");	
}
 %>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
</div>
<div id = "middle">
<p id="blurb">
Thank you for registering this book with Super Books! I worked really hard on this assignment and love to show it off to people. The more people who register, the more I get to show it off to! If anyone has any comments or concerns you can try and contact me, but due to the public nature of the internet I will not be posting my email here. Try and contact me face to face if you know me and let me know what you think! The rest of the site is pretty straightforward so you shouldn't worry about getting lost. Have fun!!
</p>
<form id="register" action="bookregister_action.jsp" onsubmit="return validateRegistration(&#34;register&#34;);">
<table id="register">
<tr><td>ISBN</td><td><input type = "text" name="isbn" /></td></tr>
<tr><td>Title</td><td><input type = "text" name="title"/></td></tr>
<tr><td>Author</td><td><input type = "text" name="author"/></td></tr>
<tr><td>Year of Publication</td><td><input type = "text" name="pubdate"/></td></tr>
<tr><td>Edition</td><td><input type = "text" name="edition"/></td></tr>
<tr><td>Number of Copies</td><td><input type = "text" name="numcopies"/></td></tr>
<tr><td>Price</td><td><input type = "text" name="price" /> </td></tr>
<tr><td>Format</td><td><input type = "text" name="format" /> </td></tr>
<tr><td>Keyword</td><td><input type = "text" name="keywords"/></td></tr>
<tr><td>Subject</td><td><input type = "text" name="subject" /></td></tr>
</table>
<input type = "submit" value="Submit"/>
</form>
</div>


<div id = "right">
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