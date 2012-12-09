<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="phase2.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Here are the requested statistics</title>
</head>
<body>
<%
Statistics s = new Statistics();
Connector c = new Connector();
if(request.getParameter("book") != null && request.getParameter("book") != "")
{
	out.println(s.nPopularBooks(Integer.parseInt((String)request.getParameter("book")), c.stmt));
	out.println("<br />");
}
if(request.getParameter("author") != null && request.getParameter("author") != "")
{
	out.println(s.nPopularAuthors(Integer.parseInt((String)request.getParameter("author")), c.stmt));
	out.println("<br />");
}
if(request.getParameter("subject") != null && request.getParameter("subject") != "")
{
	out.println(s.nPopularSubjects(Integer.parseInt((String)request.getParameter("subject")), c.stmt));
	out.println("<br />");
}
if(request.getParameter("trusteduser") != null && request.getParameter("trusteduser") != "")
{
	out.println(s.nTrustedUser(Integer.parseInt((String)request.getParameter("trusteduser")), c.stmt));
	out.println("<br />");
}
if(request.getParameter("usefuluser") != null && request.getParameter("usefuluser") != "")
{
	out.println(s.nUsefulUser(Integer.parseInt((String)request.getParameter("usefuluser")), c.stmt));
	out.println("<br />");
}
%>
<a href="managerprofile.jsp">Back</a>
</body>
</html>