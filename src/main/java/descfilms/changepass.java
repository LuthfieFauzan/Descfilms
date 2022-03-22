package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/changepass")
public class changepass extends HttpServlet{
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));		
		String oldpass,newpass;		
		oldpass=request.getParameter("oldpass");
		newpass=request.getParameter("newpass");
		PreparedStatement pstmt = null; 
		
		
		Connection con=null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con= DriverManager.getConnection(connectionURL, "root", "");
			java.sql.Statement st= con.createStatement();
			ResultSet rs=null;
			rs=st.executeQuery("SELECT password FROM `user` WHERE user_id ="+id); 
			rs.next();
			String pass=rs.getString(1);
			if(oldpass.equals(pass)) {
				pstmt = con.prepareStatement("UPDATE `user` SET `password` =? WHERE `user_id`="+id);
				pstmt.setString(1, newpass);
				pstmt.executeUpdate();
				getServletContext().getRequestDispatcher("/myprofile.jsp").forward(request, resp);
			}else {
				getServletContext().getRequestDispatcher("/changepass.jsp?error=1").forward(request, resp);
			}
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