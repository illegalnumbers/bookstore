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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=StyleSheet href="styles/searchStyle.css" type ="text/css" />
<title>Search</title>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
<p id="welcome">Welcome <% if((String)session.getAttribute("user")!=null){out.print((String)session.getAttribute("user"));}else{out.print("User");}%>, take all the time to search that you need!</p>
</div>

<div id = "middle">
<form id="search" action="search_action.jsp">
<table id="search">
<tr><td>Title</td><td><input type = "text" name="title"/></td>
<td><select name="conjunct2">
<option value="0">AND</option>
<option value="1">OR</option>
</select>
</td></tr>
<tr><td>Author</td><td><input type = "text" name="author"/></td>
<td><select name="conjunct3">
<option value="0">AND</option>
<option value="1">OR</option>
</select>
</td></tr>
<tr><td>Keyword</td><td><input type = "text" name="keyword"/></td>
<td><select name="conjunct4">
<option value="0">AND</option>
<option value="1">OR</option>
</select>
</td></tr>
<tr><td>Subject</td><td><input type = "text" name="subject" /></td></tr>
</table>
<input type = "submit" value="Search!"/>
Order by:
<select name="sort">
<option value="a">Publishing Date</option>
<option value="b">Average Numerical Score of Feedbacks</option>
<option value="c">Average Numerical Score of Trusted Users</option>
</select>
</form>


<div id="results">
<img id="resultbook" src="book.jpg" />
<p id="bookname_desc"> This will be the description of the book. </p>


<% 
try{
	ArrayList<Integer> conjunct = new ArrayList<Integer>();
	String $login = (String)session.getAttribute("user");
	String _author = (String)session.getAttribute("search_author");
	String _title = (String)session.getAttribute("search_title");
	String _subject = (String)session.getAttribute("search_subject");
	String _keyword = (String)session.getAttribute("search_keyword");
	conjunct.add(Integer.parseInt((String)session.getAttribute("search_conjunct2")));
	conjunct.add(Integer.parseInt((String)session.getAttribute("search_conjunct3")));
	conjunct.add(Integer.parseInt((String)session.getAttribute("search_conjunct4")));
	char sort = ((String)session.getAttribute("search_sort")).charAt(0);
	
	Search s = new Search();
	Connector con= new Connector();
	String result = s.browse($login, _author, _title, _subject, _keyword, sort, conjunct, con.stmt);
	out.println(result);
	con.closeConnection();
}
catch (Exception e)
{
 e.printStackTrace();
}
%>
</div>
</div>



<div id = "right">
<div id="buyingsuggestions">
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