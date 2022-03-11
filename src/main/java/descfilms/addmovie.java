package descfilms;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addservlet")
@MultipartConfig(maxFileSize = 16177215)
public class addmovie extends HttpServlet {
	String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		String a,b,c,d,e,f,g,h,i,j,k,l,m;
		a=request.getParameter("title");
		b=request.getParameter("genre");
		c=request.getParameter("language");
		d=request.getParameter("runtime");
		e=request.getParameter("producer");
		f=request.getParameter("director");
		g=request.getParameter("distributor");
		String year=request.getParameter("year");
		h=request.getParameter("rating");
		i=request.getParameter("casts");
		j=request.getParameter("synopsisshort");
		k=request.getParameter("synopsisline1");
		l=request.getParameter("synopsisline2");
		m=request.getParameter("videourl");
		InputStream is=null;
		PreparedStatement pstmt = null; 
		Part file =request.getPart("files");
		is = file.getInputStream();
		Connection con=null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con= DriverManager.getConnection(connectionURL, "root", "");
			pstmt = con.prepareStatement("INSERT INTO `mytable`(`id`, `title`, `img`, `genre`, `language`, `runtime`, `producer`, `director`, `distributor`, `year`, `rating`, `casts`, `synopsisshort`, `synopsisline1`, `synopsisline2`, `videourl`, `scores`)"+"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, null);
			pstmt.setString(2, a);	
			
				pstmt.setBlob(3, is);
			
			pstmt.setString(4, b);
			pstmt.setString(5, c);
			pstmt.setString(6, d);
			pstmt.setString(7, e);
			pstmt.setString(8, f);
			pstmt.setString(9, g);
			pstmt.setString(10, year);
			pstmt.setString(11, h);
			pstmt.setString(12, i);
			pstmt.setString(13, j);
			pstmt.setString(14, k);
			pstmt.setString(15, l);
			pstmt.setString(16, m);
			pstmt.setString(17, "0");
			pstmt.executeUpdate();
			getServletContext().getRequestDispatcher("/admin.jsp").forward(request, resp);
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
