<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
int uid= Integer.parseInt(request.getParameter("uid"));
int mid= Integer.parseInt(request.getParameter("mid"));
PreparedStatement pstmt = null; 
try {

	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	connection = DriverManager.getConnection(connectionURL, "root", "");
	pstmt = connection.prepareStatement("INSERT INTO `favourite`(`fav_id`, `movie_id`, `user_id`)"+"VALUES(NULL,?,?)");
	pstmt.setInt(1, mid);
	pstmt.setInt(2, uid);
	pstmt.executeUpdate();
	response.sendRedirect("detail.jsp?id="+mid);

} catch (Exception e) {
       out.print(e);
       response.sendRedirect("detail.jsp?id="+mid);
    return;
    }

%>