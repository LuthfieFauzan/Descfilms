<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
int check=Integer.parseInt(request.getParameter("no"));
int rid=0;
try{
	rid= Integer.parseInt(request.getParameter("rid"));
}catch(Exception e){
	
}
int uid= Integer.parseInt(request.getParameter("uid"));
int mid= Integer.parseInt(request.getParameter("mid"));
PreparedStatement pstmt = null; 
try {

	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	connection = DriverManager.getConnection(connectionURL, "root", "");
	if(check==1){
		pstmt = connection.prepareStatement("DELETE FROM `favourite` WHERE `movie_id` ="+mid +" AND `user_id` ="+uid);
		pstmt.executeUpdate();
		response.sendRedirect("detail.jsp?id="+mid);
	}else if(check==2){
		pstmt = connection.prepareStatement("DELETE FROM `like` WHERE `review_id` ="+rid +" AND `user_id` ="+uid);
		pstmt.executeUpdate();
		response.sendRedirect("detail.jsp?id="+mid+"#review"+rid);
	}else if(check==3){
		pstmt = connection.prepareStatement("DELETE FROM `review` WHERE `review_id` ="+rid +" AND `user_id` ="+uid);
		pstmt.executeUpdate();
		response.sendRedirect("detail.jsp?id="+mid+"#review");
	}
	

} catch (Exception e) {
       System.out.print(e);
       response.sendRedirect("detail.jsp?id="+mid);
    return;
    }

%>