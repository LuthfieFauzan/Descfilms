package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
 
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/review")

public class review extends HttpServlet {
	
	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int iduser,idmovie,rate;
	String review;
	iduser=Integer.parseInt(req.getParameter("idu"));
	idmovie=Integer.parseInt(req.getParameter("idm"));
	rate=Integer.parseInt(req.getParameter("rate"));
	review=req.getParameter("review");
	
	PreparedStatement pstmt=null;
	Connection con=null;
	try {
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		con= DriverManager.getConnection(connectionURL, "root", "");
		pstmt = con.prepareStatement("INSERT INTO `review`(`review_id`, `rates`, `review_content`, `like`, `movie_id`, `user_id`)"+"VALUES(NULL,?,?,0,?,?)");
		pstmt.setInt(1, rate);
		pstmt.setString(2, review);
		pstmt.setInt(3, idmovie);
		pstmt.setInt(4, iduser);
		pstmt.executeUpdate();
		getServletContext().getRequestDispatcher("/detail.jsp?id="+idmovie).forward(req, resp);
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
