package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/editservletu")
@MultipartConfig(maxFileSize = 16177215)
public class editprofile extends HttpServlet{
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));		
		String email,name,gender,dob,desc;		
		name=request.getParameter("name");
		gender=request.getParameter("gender");
		dob=request.getParameter("date");
		desc=request.getParameter("pass");
		String img=request.getParameter("a");
		InputStream is=null;
		PreparedStatement pstmt = null; 
		Part file =request.getPart("files");
		is = file.getInputStream();
		Connection con=null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con= DriverManager.getConnection(connectionURL, "root", "");
			if(img=="1") {
				pstmt = con.prepareStatement("UPDATE `user` SET `user_id`=?,`username`=?,`gender`=?,`date_of_birth`=?,`img`=?,`desc`=? WHERE `user_id`="+id);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, gender);
				pstmt.setString(4, dob);
				pstmt.setBlob(5, is);	
				pstmt.setString(6, desc);
				pstmt.executeUpdate();			
			}else {
				pstmt = con.prepareStatement("UPDATE `user` SET `user_id`=?,`username`=?,`gender`=?,`date_of_birth`=?,`desc`=? WHERE `user_id`="+id);
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, gender);
				pstmt.setString(4, dob);				
				pstmt.setString(5, desc);
				pstmt.executeUpdate();	
			}			
			getServletContext().getRequestDispatcher("/edit.jsp").forward(request, resp);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.print(e1);
		}finally {
			if(con !=null) {
				 try {
	                    con.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
			}
		}
		
	}

}