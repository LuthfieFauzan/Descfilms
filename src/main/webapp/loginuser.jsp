<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
Statement st= connection.createStatement();
ResultSet rs=null;
String user= request.getParameter("name").toString();
String pass= request.getParameter("pass").toString();
rs=st.executeQuery("select count(*) from user where username='"+user+"' OR email='"+user+"' and password='"+pass+"'"); 
rs.next();
if(rs.getString(1).equals("1")){
	rs=st.executeQuery("select * from user where username='"+user+"' OR email='"+user+"' and password='"+pass+"'"); 
	try{
		while(rs.next()){
	    if(rs.getString(2).equals(user)||rs.getString(4).equals(user)&&rs.getString(3).equals(pass)) 
		{	session.setAttribute("idu", rs.getString(1));
	    	session.setAttribute("user", rs.getString(4) );
	    	session.setAttribute("val", "0");
	    	response.sendRedirect("index.jsp");
		}
		}
			
	}
	catch (Exception e) {
	out.println(e);
	}
}else{
	session.setAttribute("val", "1");
	response.sendRedirect("login.jsp");	
}
%>