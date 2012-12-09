<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>

<%    
    String user=(String)session.getAttribute("user");
	String _NoTrust = request.getParameter("nottrusted");
	Connector con = new Connector();
	User u = new User();
    Statement stmt=con.stmt; 
    try{
    	String result = u.recordNoTrust(user, _NoTrust, stmt);
    	con.closeConnection();
		pageContext.forward("profile.jsp?msg="+result);
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
	
 %>