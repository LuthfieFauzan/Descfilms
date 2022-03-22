package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
 
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/regis")

public class regis extends HttpServlet {
	
	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String email,name,gender,dob,password;
	email=req.getParameter("email");
	name=req.getParameter("name");
	gender=req.getParameter("gender");
	dob=req.getParameter("date");
	password=req.getParameter("pass");
	PreparedStatement pstmt=null;
	Connection con=null;
	try {
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		con= DriverManager.getConnection(connectionURL, "root", "");
		pstmt = con.prepareStatement("INSERT INTO `user`(`user_id`, `email`, `password`, `username`, `gender`, `date_of_birth`, `img`, `desc`, `title`, `Exp`)"+"VALUES(NULL,?,?,?,?,?,NULL,?,NULL,0)");
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, dob);
		pstmt.setString(6, "");
		pstmt.executeUpdate();
		getServletContext().setAttribute("error", null);
		getServletContext().getRequestDispatcher("/login.jsp?sucess=1").forward(req, resp);
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		getServletContext().getRequestDispatcher("/register.jsp?error=1").forward(req, resp);		
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
