<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating book...</title>
</head>
<body>
<%    
    int _isbn = Integer.parseInt(request.getParameter("isbn"));
	int _numCopies = Integer.parseInt(request.getParameter("numCopies"));	
	Connector con = new Connector();
    Book b = new Book();
    Statement stmt=con.stmt; 
    try{
    	String result = b.updateBook(_numCopies, _isbn, stmt);
    	con.closeConnection();
		out.print(result);
		out.print("<a href=\"editbook.jsp\"> Back </a>");
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
 %>
</body>
</html>