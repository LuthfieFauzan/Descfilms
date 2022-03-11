<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
Statement st= connection.createStatement();
ResultSet rs=null;
String id=null;
int a=0;
try{a =Integer.parseInt(request.getParameter("c"));
	
}catch(Exception e){
	
}
if(a==1){
	session.setAttribute("ed", "");
	response.sendRedirect("admin.jsp");
}else{
	if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){
		id=request.getParameter("movie").toString();
		session.setAttribute("ed", id);
		response.sendRedirect("admin.jsp");
	}else{
		session.setAttribute("ed", "");
		response.sendRedirect("admin.jsp");
	}
}


%>