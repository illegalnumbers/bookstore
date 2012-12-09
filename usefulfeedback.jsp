<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="phase2.*" %>
<%
 int n =Integer.parseInt(request.getParameter("NumberOfFeedback"));
 String resultstr = "";
 Search s = new Search();
 Connector c = new Connector();
 int _isbn = Integer.parseInt((String)session.getAttribute("isbn"));
 resultstr=s.nUsefulFeedback(n, _isbn, c.stmt);
 out.println(resultstr);
 out.println("<a href=\"bookorder.jsp?isbn="+_isbn+"\"> Back </a>");
 c.closeConnection();
%>