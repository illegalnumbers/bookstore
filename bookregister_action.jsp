<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering the book...</title>
</head>
<body>
<%    
    int _isbn = Integer.parseInt(request.getParameter("isbn"));
	String _format=(String)request.getParameter("format");
    float _price=Float.parseFloat(request.getParameter("price"));
	int _copies=Integer.parseInt(request.getParameter("numcopies"));
	String[] keyword = {request.getParameter("keyword")};
	String _edition= (String)request.getParameter("edition");
	String _title = (String)request.getParameter("title");
	String _pubdate = (String)request.getParameter("pubdate");
	String _subject = (String)request.getParameter("subject");
	String _author = (String)request.getParameter("author");

	
	Connector con = new Connector();
    Book b = new Book();
    Statement stmt=con.stmt; 
    try{
    	String result = b.addBook(_isbn, _format, _price, _copies, _edition, _title, _pubdate, _subject, _author, keyword, stmt);
    	con.closeConnection();
		out.print(result);
		out.print("<a href=\"addbook.jsp\"> Back </a>");
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
 %>
</body>
</html>