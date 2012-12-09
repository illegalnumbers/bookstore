<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>

<%    
	session.invalidate();
	response.sendRedirect("index.html");	
 %>