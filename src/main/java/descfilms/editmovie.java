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


@WebServlet("/editservletm")
@MultipartConfig(maxFileSize = 16177215)
public class editmovie extends HttpServlet{
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
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
		int img=Integer.parseInt(request.getParameter("a"));
		InputStream is=null;
		PreparedStatement pstmt = null; 
		Part file =request.getPart("files");
		is = file.getInputStream();
		Connection con=null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con= DriverManager.getConnection(connectionURL, "root", "");
			if(img==1) {
				pstmt = con.prepareStatement("UPDATE `mytable` SET `id`=?,`title`=?,`img`=?,`genre`=?,`language`=?,`runtime`=?,`producer`=?,`director`=?,`distributor`=?,`year`=?,`rating`=?,`casts`=?,`synopsisshort`=?,`synopsisline1`=?,`synopsisline2`=?,`videourl`=? WHERE id="+id);
				pstmt.setInt(1, id);
				pstmt.setString(2, a);	
					pstmt.setBlob(3, is);								
				pstmt.setString(4, b);
				pstmt.setString(5, c);
				pstmt.setString(6, d);
				pstmt.setString(7, e);
				pstmt.setString(8, f);
				pstmt.setString(9, g);
				pstmt.setInt(10, Integer.parseInt(year));
				pstmt.setString(11, h);
				pstmt.setString(12, i);
				pstmt.setString(13, j);
				pstmt.setString(14, k);
				pstmt.setString(15, l);
				pstmt.setString(16, m);			
				pstmt.executeUpdate();			
			}else {
				pstmt = con.prepareStatement("UPDATE `mytable` SET `id`=?,`title`=?,`genre`=?,`language`=?,`runtime`=?,`producer`=?,`director`=?,`distributor`=?,`year`=?,`rating`=?,`casts`=?,`synopsisshort`=?,`synopsisline1`=?,`synopsisline2`=?,`videourl`=? WHERE id="+id);
				pstmt.setInt(1, id);
				pstmt.setString(2, a);						
				pstmt.setString(3, b);
				pstmt.setString(4, c);
				pstmt.setString(5, d);
				pstmt.setString(6, e);
				pstmt.setString(7, f);
				pstmt.setString(8, g);
				pstmt.setInt(9, Integer.parseInt(year));
				pstmt.setString(10, h);
				pstmt.setString(11, i);
				pstmt.setString(12, j);
				pstmt.setString(13, k);
				pstmt.setString(14, l);
				pstmt.setString(15, m);			
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