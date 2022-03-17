package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
 
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/feedback")

public class feedback extends HttpServlet {
	
	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("idu"));		
	String Feedback;
	System.out.print(id);
	
	Feedback=req.getParameter("message");
	System.out.print(Feedback);
	PreparedStatement pstmt=null;
	Connection con=null;
	try {
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		con= DriverManager.getConnection(connectionURL, "root", "");
		pstmt = con.prepareStatement("INSERT INTO `feedback`(`feed_id`, `user_id`, `feedbacks`)"+"VALUES(NULL,?,?)");
		pstmt.setInt(1, id);
		pstmt.setString(2, Feedback);	
		pstmt.executeUpdate();	
		getServletContext().getRequestDispatcher("/about.jsp?sucess=1").forward(req, resp);
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
