<%@ page import="java.sql.*"%>
<%@ page import="phase2.*"%>


<%
	session.setAttribute("search_title",
			(String) request.getParameter("title"));
	session.setAttribute("search_author",
			(String) request.getParameter("author"));
	session.setAttribute("search_keyword",
			(String) request.getParameter("keyword"));
	session.setAttribute("search_subject",
			(String) request.getParameter("subject"));
	session.setAttribute("search_sort",
			((String) request.getParameter("sort")));
	if(request.getParameter("conjunct2") != null)
	{
	session.setAttribute("search_conjunct2",
			Integer.parseInt(request.getParameter("conjunct2")));
	}
	if(request.getParameter("conjunct3") != null)
	{
	session.setAttribute("search_conjunct3",
			Integer.parseInt(request.getParameter("conjunct2")));
	}
	if(request.getParameter("conjunct4") != null)
	{
	session.setAttribute("search_conjunct4",
			Integer.parseInt(request.getParameter("conjunct2")));
	}
	
	
	pageContext.forward("search.jsp");
%>