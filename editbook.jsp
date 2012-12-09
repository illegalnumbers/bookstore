<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update A Book</title>
</head>
<body>
<form name="book" action="editbookaction.jsp">
ISBN <input type="text" name="isbn"/>
UPDATED Number of Copies <input type="text" name="numCopies"/>
<input type="submit" value="Submit Changes"/>
<a href="managerprofile.jsp">Profile</a>
</form>
</body>
</html>