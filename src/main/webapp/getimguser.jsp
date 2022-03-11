<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
Blob image,a = null;
Connection con = null;
String img= "img/movie.png";
byte[ ] imgData = null ;
int id= Integer.parseInt(request.getParameter("your_id"));
ResultSet rs = null;
try {

	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	connection = DriverManager.getConnection(connectionURL, "root", "");
		Statement stmt=connection.createStatement();  
    rs = stmt.executeQuery("select img from user where user_id="+id);
    
    rs.next();
    if(rs.getBlob(1)!=null){
    	image = rs.getBlob(1);
        imgData = image.getBytes(1,(int)image.length());
        response.setContentType("image/jpg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();	
    }
    
} catch (Exception e) {
        out.println("Unable To Display image");
    out.println("Image Display Error=" + e.getMessage());
    return;
    } finally {
    
    try {
    rs.close();
    con.close();
    
    } catch (SQLException e) {
    
    e.printStackTrace();
    
    }

}

%>