<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>

<%    
    String user=(String)session.getAttribute("user");
	String _Trust = request.getParameter("trusteduser");
	Connector con = new Connector();
	User u = new User();
    Statement stmt=con.stmt; 
    try{
    	String result = u.recordTrust(user, _Trust, stmt);
    	con.closeConnection();
		pageContext.forward("profile.jsp?msg="+result);
    }
    catch (Exception e)
    {
    	e.printStackTrace();
    }
	
 %>