<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="phase2.*" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you for placing the order!</title>
</head>
<body>
<%
Order o = new Order();
Connector con = new Connector();
out.println(o.placeOrder(Integer.parseInt(session.getAttribute("isbn").toString()), session.getAttribute("user").toString(), Integer.parseInt(request.getParameter("copies").toString()), con.stmt));
out.println(o.orderSuggestion(Integer.parseInt(session.getAttribute("isbn").toString()), con.stmt));
con.closeConnection();
%>
<a href="profile.jsp">Back to the your profile.</a>
</body>
</html>