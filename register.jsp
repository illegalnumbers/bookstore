<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./scripts/jquery.js"></script>
<script src="./scripts/checkPageInput.js"></script>
<script src="./scripts/Utilities.js"></script>
<link rel=StyleSheet href="styles/registerStyle.css" type ="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you for Registering</title>
</head>
<body>
<div id="page-container">
<div id = "left">
<img id="leftlogo" src="./images/logo.jpg" />
</div>

<div id = "middle">
<p id=blurb>
Thank you for registering for Super Books! I worked really hard on this assignment and love to show it off to people. The more people who register, the more I get to show it off to! If anyone has any comments or concerns you can try and contact me, but due to the public nature of the internet I will not be posting my email here. Try and contact me face to face if you know me and let me know what you think! The rest of the site is pretty straightforward so you shouldn't worry about getting lost. Have fun!!
</p>

<form id="register" action="register_action.jsp" onsubmit="return validateRegistration(&#34;register&#34;);">
<table id="register">
<tr><td>Name</td><td><input name="name" type = "text" /></td></tr>
<tr><td>Desired Login</td><td><input type = "text" name="login" /></td></tr>
<tr><td>Password</td><td><input type = "password" name="password" /></td></tr>
<tr><td>Credit Card Number</td><td><input type = "text" name="ccn" /></td></tr>
<tr><td>Address</td><td><input type = "text" name="address"/></td></tr>
<tr><td>Phone Number</td><td><input type = "text" name="phonenumber" /></td>
</table>
<input type="submit" value="Submit Registration"/>
</form>
</div>


<div id = "right">
<hr id="rightbar"/>
<div id="bottomright">
<ul id="sitemap">
<li><a href=<%if((String)session.getAttribute("admin")=="true"){out.print("\"managerprofile.jsp\"");}else{out.print("\"profile.jsp\"");}%>>Home</a></li>
<li><a href="search.jsp">Search</a></li>
<li> <a href="logout.jsp">Logout</a></li>
</ul>
</div>

</div>
</div>
</body>
</html>