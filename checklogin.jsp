<%@ page import="java.sql.*" %>
<%@ page import="phase2.*" %>

<%    
	session.setMaxInactiveInterval(-1);
    String user=request.getParameter("username");
	String pass=request.getParameter("password");
	String query = "SELECT * FROM Customer c WHERE (c.login =\""+user+"\") AND (c.password=\""+pass+"\");"; //get all customer information
	String query2 = "SELECT * FROM Managers WHERE (login =\""+user+"\") AND (password=\""+pass+"\");"; //check if a manager
	String resultstr=""; 
	ResultSet results; 
	ResultSet results2; 
	Connector con = new Connector();
    Statement stmt=con.stmt; 
    
	try{ //run the query, check for errors
		results = stmt.executeQuery(query);
    } catch(Exception e) {
		System.err.println("Unable to execute query:"+query+"\n");
                System.err.println(e.getMessage());
		throw(e);
	}
	
	if(results.next()) //if the user is a customer
	{
		//makes the assumption you have a valid login sent to the java code, error checking in js
		session.setAttribute("user", user);
		con.closeConnection();
		pageContext.forward("profile.jsp?user=\""+session.getAttribute("user")+"\"");
	}
	else{
		
		try{ //run the query, check for errors
			results2 = stmt.executeQuery(query2);
	    } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		
		if(results2.next())
		{
			session.setAttribute("user", user);
			session.setAttribute("admin","true");
			con.closeConnection();
			pageContext.forward("managerprofile.jsp?user=\""+session.getAttribute("user")+"\"");
		}
		else{
			con.closeConnection();
			response.sendRedirect("index.html?msg=Invalid Username or Password");
		}
	}
	
 %>