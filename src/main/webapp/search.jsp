<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
	
	<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">
	<%
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement stmt=connection.createStatement();  
	String search=request.getParameter("search");
	ResultSet rs=stmt.executeQuery("SELECT * FROM `mytable` WHERE title REGEXP '"+search+"' OR genre REGEXP '"+search+"' OR year REGEXP '"+search+"' OR language REGEXP '"+search+"'"); 
	String a=null;
%>

<head>
		<jsp:include page="header.jsp"></jsp:include>
		<title>Search | Descfilm</title>
	</head>
	<body id="page-top" style="background-image: url('img/test.jpg');" onload="prefent()">
	
		<jsp:include page="navbar.jsp"></jsp:include>
    	<br/><br/><br/>
    	<div class="slideshow-container" id="home" onmouseover="other()">
	        <img class="mySlides" src="img/b.jpg" style="width:100%">
	        <img class="mySlides" src="img/a.jpg" style="width:100%">
	        <img class="mySlides" src="img/c.jpg" style="width:100%">
	        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	        <a class="next" onclick="plusSlides(1)">&#10095;</a>
	        <div style="text-align:center">
	            <span class="dot" onclick="currentSlide(1)"></span> 
	            <span class="dot" onclick="currentSlide(2)"></span>
	            <span class="dot" onclick="currentSlide(3)"></span>
        	</div>
    	</div>
    	<br/><br/><br/>
	    <header class="bg-transparent" onmouseover="other()">
	        <div class="container text-center">
	            <h1 style="color: white">Source on Most of Movie Details</h1>
	            <p class="lead" style="color: white">Getting detail of many popular movies made easier with Descfilm</p>
	        </div>
		</header>
		<br/><br/>
		<div class="container">
			<form action="search.jsp" method="get">
			<div class="row">
				<div class='col-md-10'>
					<input class="form-control" type="text" placeholder="Search movie..." aria-label="Search" id="search" name="search">    
				</div>    
				<div class='col-md-2'>
					<input type="submit" class="btn btn-outline-white btn-block"  style="background-color: orange; color: white;" value="Search">					
				</div>
			</div>
			</form>
		</div>
		
		<section onmouseover="other()" id="sears">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-8">
	                    <h2 class="section-heading" style="color: white" id="namasearch">Search <%= search%></h2>
	                </div>
	            </div>
	            <div class="row" id="searsi">
	            <% while(rs.next()){%>	        	   	        	 		
	            <div class="col-md-4 mb-4 box-item" >
				<a class="box-link" data-toggle="modal" href="#portfolio1Modal<%out.println(rs.getInt(1));%>">
	            	<div class="box-hover">
	                	<div class="portfolio-hover-content">
	                    	<i class="fa fa-plus fa-3x"></i>
	                    </div>
	                </div>
	                <img class="img-fluid" src="getImageDetails.jsp?your_id=<%out.println(rs.getInt(1));%>" width="640px" height="426px">
	            </a>
	            <div class="portfolio-caption">
	            	<h4 style="text-align: center; color: white"><%out.println(rs.getString(2));%></h4>
	                <p style="text-align: center; color: white"> <%out.println(rs.getString(4));%> </p>
	            </div>
	        </div>
	       <%} %>
	            </div>
			</div>
		</section>
		<br/><br/>
		<%rs=stmt.executeQuery("SELECT * FROM `mytable` WHERE title REGEXP '"+search+"' OR genre REGEXP '"+search+"' OR year REGEXP '"+search+"' OR language REGEXP '"+search+"'"); 
		while(rs.next()){%>				
			<div class="modal fade" id="portfolio1Modal<%out.println(rs.getInt(1));%>" tabindex="-1" role="dialog" aria-hidden="true">
        	<div class="modal-dialog modal-dialog-centered" role="document">
            	<div class="modal-content">
                	<div class="modal-header">
                    	<h3 class="modal-title text-uppercase"><% out.println(rs.getString(2));%></h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                        </button>
					</div>
					<div class="modal-body">
                    	<div class="video-container">
                        	<iframe width="853" height="480" src="<% out.println(rs.getString(16));%>" frameborder="0" donotallowfullscreen></iframe>
                        </div>
                        <p style="text-align: justify;"><% out.println(rs.getString(13));%></p>
                        <div class="text-center">
                        	<a href="detail.jsp?id=<%out.println(rs.getInt(1));%>">
                            	<button class="btn btn-dark" style="background-color: maroon;" type="button" onclick="sends(<%out.println(rs.getInt(1));%>))">
                                	Learn more
                                </button>
                            </a>
                        </div>
					</div>
				</div>
	        </div>
		</div>
		<% }
		rs.close();
		%>		
		<br/><br/>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideshow.js"></script>
		<script src="js/indexscript.js"></script>
		<script src="js/prefent.js"></script>
		
	</body>


</html>