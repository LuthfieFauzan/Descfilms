<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<html> 
<body> 
<form name="form1" action="tes2.jsp" method="post" enctype="multipart/form-data" > 
	<h1>Insert an Image into MySQL Database!</h1> 
	<input type="text" name="fname"><br><br>
	<input type="text" name="lname"><br><br>
	<input type="text" name="email"><br><br>
	<input type="file" name="myimg"><br><br>
	<input type="submit" name="submit" value="Submit">
</form>
</body> 
</html> 
