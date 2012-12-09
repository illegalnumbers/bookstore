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
<%
	if ((String) session.getAttribute("user") == ""
			|| (String) session.getAttribute("user") == null
			|| (String) session.getAttribute("user") == "null") {
		response.sendRedirect("index.html?msg=Please log  in");
	}
%>
<link rel=StyleSheet href="styles/searchStyle.css" type ="text/css" />
<title>Search</title>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
<p id="welcome">Welcome <%
	if ((String) session.getAttribute("user") != null) {
		out.print((String) session.getAttribute("user"));
	} else {
		out.print("User");
	}
%>, take all the time to search that you need!</p>
</div>

<div id = "middle">
<form id="search" action="search_action.jsp"  onsubmit="return validateSearch(&#34;search&#34;);">
<table id="search">
<tr><td>Title</td><td><input type = "text" name="title"/></td>
<td><input type="checkbox" name="conjunct2" value="0" />AND<br />
<input type="checkbox" name="conjunct2" value="1" />OR<br />
</td></tr>
<tr><td>Author</td><td><input type = "text" name="author"/></td>
<td><input type="checkbox" name="conjunct3" value="0" />AND<br />
<input type="checkbox" name="conjunct3" value="1" />OR<br />
</td></tr>
<tr><td>Keyword</td><td><input type = "text" name="keyword"/></td>
<td><input type="checkbox" name="conjunct4" value="0" />AND<br />
<input type="checkbox" name="conjunct4" value="1" />OR<br />
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
<img id="resultbook" src="./images/book.jpg" />
<p id="bookname_desc">
<%
//should probably clear the session on each reload of the page but for now this works.
	ArrayList<Integer> conjunct = new ArrayList<Integer>();
	String $login = (String) session.getAttribute("user");
	String _author = (String) session.getAttribute("search_author");
	String _title = (String) session.getAttribute("search_title");
	String _subject = (String) session.getAttribute("search_subject");
	String _keyword = (String) session.getAttribute("search_keyword");
	Character sort = null;
	if (session.getAttribute("search_conjunct2") != null) {
		conjunct.add(Integer.parseInt(session.getAttribute(
				"search_conjunct2").toString()));
	}
	if (session.getAttribute("search_conjunct3") != null) {
		conjunct.add(Integer.parseInt(session.getAttribute(
				"search_conjunct3").toString()));
	}
	if (session.getAttribute("search_conjunct4") != null) {
		conjunct.add(Integer.parseInt(session.getAttribute(
				"search_conjunct4").toString()));
	}
	if ((session.getAttribute("search_sort")) != null) {
		sort = (session.getAttribute("search_sort")).toString().charAt(
				0);
	}

	try {
		Search s = new Search();
		Connector con = new Connector();
		String result = s.browse($login, _author, _title, _subject,
				_keyword, sort, conjunct, con.stmt);
		out.println(result);
		con.closeConnection();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</p>
</div>
</div>



<div id = "right">
<div id="buyingsuggestions">
</div>
<hr id="rightbar"/>
<div id="bottomright">
<ul id="sitemap">
<li><a href=<%if ((String) session.getAttribute("admin") == "true") {
				out.print("\"managerprofile.jsp\"");
			} else {
				out.print("\"profile.jsp\"");
			}%>>Home</a></li>
<li><a href="search.jsp">Search</a></li>
<li> <a href="logout.jsp">Logout</a></li>
</ul> 
</div>
</div>
</div>
</body>
</html>