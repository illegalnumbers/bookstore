<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="phase2.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you for the feedback!</title>
</head>
<body>
<%    
    int _isbn = Integer.parseInt((String)session.getAttribute("isbn"));
	String _text=(String)request.getParameter("feedback_text");
	int _score = Integer.parseInt(request.getParameter("feedback_score"));
	
	Connector con = new Connector();
	Feedback f = new Feedback();
    Statement stmt=con.stmt; 
    try{
    	String result = f.placeFeedback(_isbn, (String)session.getAttribute("user"), _score, _text, stmt);
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