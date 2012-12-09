<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering...</title>
</head>
<body>
<%    
    String _name=(String)request.getParameter("name");
	String _login=(String)request.getParameter("login");
    String _password=(String)request.getParameter("password");
	String _ccn=(String)request.getParameter("ccn");
	String _address=(String)request.getParameter("address");
	int _phone= Integer.parseInt(request.getParameter("phonenumber"));

	
	Connector con = new Connector();
	Register r = new Register();
    Statement stmt=con.stmt; 
    try{
    	String result = r.registerUser(_login, _name, _phone, _address, _ccn, _password, stmt);
    	con.closeConnection();
		out.print(result);
		out.print("<a href=\"register.jsp\"> Back </a>");
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
 %>
</body>
</html>