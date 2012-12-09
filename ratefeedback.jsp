<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thanks for the rating!</title>
</head>
<body>
<%    
    int _isbn = Integer.parseInt((String)session.getAttribute("isbn"));
	int _score = 0;
	String queryString = request.getQueryString();
	
		if(queryString.contains("rating0"))
		{
		 _score = 0;	
		}
		if(queryString.contains("rating1"))
		{
		  _score = 1;	
		}
		if(queryString.contains("rating2"))
		{
		_score = 2;	
		}
	int _postid = Integer.parseInt(request.getParameter("postid"));
	String $login = (String)session.getAttribute("user");
	
	Connector con = new Connector();
	Feedback f = new Feedback();
    Statement stmt=con.stmt; 
    try{
    	String result = f.rateFeedback(_postid, _isbn, $login, _score, stmt);
    	con.closeConnection();
		out.print(result);
		out.print("<a href=\"bookorder.jsp?isbn="+_isbn+"\"> Back </a>");
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
 %>
</body>
</html>