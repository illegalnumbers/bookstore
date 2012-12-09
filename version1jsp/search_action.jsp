<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
 

<%    
	if((String)request.getParameter("title") != "")
	{
		session.setAttribute("search_title",(String)request.getParameter("title"));
	}
	else
	{
		session.setAttribute("search_title", null);
	}

	if((String)request.getParameter("author") != "")
	{
	  session.setAttribute("search_author",(String)request.getParameter("author"));
	  session.setAttribute("search_conjunct2",Integer.parseInt(request.getParameter("conjunct2")));
	}
	else
	{
		session.setAttribute("search_author", null);
		session.setAttribute("search_conjunct2", null);
	}

	if((String)request.getParameter("keyword") != "")
	{
	  session.setAttribute("search_keyword",(String)request.getParameter("keyword"));	
      session.setAttribute("search_conjunct3",Integer.parseInt(request.getParameter("conjunct3")));
	}
	else
	{
	  session.setAttribute("search_keyword", null);
	  session.setAttribute("search_conjunct3", null);
	}

    if((String)request.getParameter("subject") != "")
	{
      session.setAttribute("search_subject",(String)request.getParameter("subject"));
  	  session.setAttribute("search_conjunct4",Integer.parseInt(request.getParameter("conjunct4")));
	}
	else
	{
	  session.setAttribute("search_subject", null);
	  session.setAttribute("search_conjunct4",null);
	}


	session.setAttribute("search_sort",((String)request.getParameter("sort")).charAt(0));
	pageContext.forward("search.jsp");
 %>