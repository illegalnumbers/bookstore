<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/jquery.js"></script>
<script src="./scripts/checkPageInput.js"></script>
<script src="./scripts/Utilities.js"></script>
<link rel=StyleSheet href="styles/profileStyle.css" type ="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
User u = new User();
if((String)session.getAttribute("user") == "" || (String)session.getAttribute("user") == null || (String)session.getAttribute("user") == "null")
{
	response.sendRedirect("index.html?msg=Please log  in");	
}
 %>
<title><% String userName = (String)session.getAttribute("user"); out.print(userName); %>'s Profile</title>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
Welcome <%= userName %> to Super Books!
</div>
<div id = "middle_userinfo">
<% 
try{
	Connector con= new Connector();
	String result = u.returnUserData(userName, con.stmt);
	out.println(result);
	con.closeConnection();
}
catch (Exception e)
{
	out.print(e.toString());
}
%>
</div>


<div id = "right">
<p class=trust> Want to add a user to your nontrusted users list? Type in their name here and hit submit!<br/></p>
<form class = "trusteduser" id="notrust" action="notrust.jsp">
<input type="text" name = "nottrusted" value = "Type in a nontrusted user here..." onclick="changeContentsOnClick(&#34;notrust&#34;,&#34;nottrusted&#34;)"/>
<input type="submit" value="Submit"/>
</form>
<p class=trust>Want to add a user to your trusted users list? Type in their name here and hit submit!<br/></p>
<form class = "trusteduser" id="trust" action="trust.jsp">
<input type="text" name="trusteduser" value = "Type in a trusted user here..." onclick="changeContentsOnClick(&#34;trust&#34;,&#34;trusteduser&#34;)" />
<input type="submit" value="Submit"/>
</form>
<div id="bottomright">
<hr id="rightbar"/>
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