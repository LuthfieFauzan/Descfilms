<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
Statement st= connection.createStatement();
ResultSet rs=null;
String user= request.getParameter("id").toString();
String pass= request.getParameter("pass").toString();
rs=st.executeQuery("select count(*) from admin where admin_id='"+user+"' and password='"+pass+"'"); 
rs.next();
if(rs.getString(1).equals("1")){
	rs=st.executeQuery("select * from admin where admin_id='"+user+"' and password='"+pass+"'"); 
	try{
		while(rs.next()){
	    if(rs.getString(2).equals(pass)&&rs.getString(1).equals(user)) 
		{
	    	session.setAttribute("ids", user );
	    	session.setAttribute("val", "0");
	    	session.setAttribute("ed", "");
	    	response.sendRedirect("admin.jsp");
		}
		}
			
	}
	catch (Exception e) {
	out.println(e);
	}
}else{
	session.setAttribute("val", "1");
	response.sendRedirect("admin.jsp");	
}
%>