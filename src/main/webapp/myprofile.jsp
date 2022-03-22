<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<%

String id =null;
if(session.getAttribute("idu")!=null){
	id=session.getAttribute("idu").toString();
	try{
		if(request.getParameter("other")!=null){
			id=request.getParameter("other");
		}
	}catch(Exception e){
		
	}
}else{
	response.sendRedirect("login.jsp");
}

String connectionURL = "jdbc:mysql://localhost:3306/descfilm";
Connection connection = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
Statement stmt = connection.createStatement();
ResultSet rs = null;
rs = stmt.executeQuery("SELECT * FROM `user` WHERE user_id="+id);
rs.next();
%>

<head>
<jsp:include page="header.jsp"></jsp:include>
<title>My profile | Descfilm</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body id="page-top" style="background-color: #1f2833"
	onload="prefent()">

<%
if(request.getParameter("other")!=null&&request.getParameter("other")!=session.getAttribute("idu")){
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
}else{
%>

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: darkred" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="index.jsp" style="color: white;">Descfilm</a>
		        	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="background-color: firebrick; color: white;">
		            	<span class="navbar-toggler-icon my-toggler"></span>
					</button>
		            <div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">		                	
				    	<li class="nav-item">
				        	<a class="nav-link" href="changepass.jsp">Change password</a>
				        </li>
				        <li class="nav-item">
				        	<a class="nav-link" href="editprofile.jsp">Edit Profile</a>
				        </li>
				        <li class="nav-item">
				             <a class="nav-link" href="logout.jsp">Logout</a>
				        </li>
					</ul>
				</div>
			</div>
		</nav>
			<%
}
%>
	<br/><br/><br/><br/><br/>
	
	<section class="bg-transparent text-light p-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 d-flex justify-content-center">
                    
                    <img width="200px" height="200px" class="img rounded-circle" src="getimguser.jsp?your_id=<%=id%>" onerror="this.onerror=null; this.src='img/profile.png'" alt="upload image" class="img-thumbnail">
                    
                </div>
                <div class="col-8 ">
                	
                    <p class="mb-0">
                    		<%=rs.getString(9) %>  
                    </p>
                    <p class="lead mb-0">
                       <%=rs.getString(4) %> 
                    </p>
                    <p class="lead mb-0">
                        EXP :
                    </p>
                    <div class="progress mb-3">
					    <div style="color: black"  class="progress-bar progress-bar-striped bg-warning" role="progressbar" aria-valuenow="<%=rs.getString(10) %>" aria-valuemin="0" aria-valuemax="1000" style="width:<%=rs.getInt(10)*100/1000 %>%">
					      <%=rs.getString(10) %>/1000
					    </div>
					</div>
                    <div class="bg-light text-dark p-2 mb-10 rounded" style="min-height: 10em;">
                        <div class="row">
	                    	<div class="col-1">
			               		<p class="small">
			               			Gender
			               		</p>
	                    	</div>
	                    	<div class="col-1">
			               		<p class="small">
			               			:
			               		</p>
	                    	</div>
	                    	<div class="col-3">
	                    		<p class="small text-muted">
	                    			<%=rs.getString(5) %> 
	                    		</p>
	                    	</div>
	                    	<div class="col-3">
			               		<p class="small">
			               			Date of Birth
			               		</p>
	                    	</div>
	                    	<div class="col-1">
			               		<p class="small">
			               			:
			               		</p>
	                    	</div>
	                    	<div class="col-3">
	                    		<p class="small text-muted">
	                    			<%=rs.getString(6) %>
	                    		</p>
	                    	</div>
	                    </div>
	                    <p>
                        My Description:
                         </p>
                        <p class="ml-1">
                        <%=rs.getString(8) %>
                         </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%rs.close(); %>
    <!-- TODO: favorite -->
    <section id="myfav">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-8">
	                    <h2 class="section-heading" style="color: white" id="namasearch">My Favorite <i class="fa fa-heart"></i></h2>
	                </div>
	            </div>
	            <div class="row" id="searsi">
	            <%rs=stmt.executeQuery("SELECT * FROM mytable INNER JOIN favourite ON favourite.movie_id=mytable.id WHERE favourite.user_id="+id);
	            while(rs.next()){%>	        	   	        	 		
	            <div class="col-md-4 mb-4 box-item" >
				<a class="box-link" data-toggle="modal" href="#portfolio1Modal<%out.println(rs.getInt(1));%>">
	            	<div class="box-hover">
	                	<div class="portfolio-hover-content">
	                    	<p style="text-align: center; color: white"> <%out.println(rs.getString(17));%> <i class="fa fa-star" aria-hidden="true"></i> </p>
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
    <%rs=stmt.executeQuery("SELECT * FROM mytable INNER JOIN favourite ON favourite.movie_id=mytable.id WHERE favourite.user_id="+id);
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
	<br />
	<br />
	<a id="scroll" style="display: none;"><span></span></a>
	<jsp:include page="scripts.jsp"></jsp:include>
	<script src="js/slideshow.js"></script>

	<script src="js/prefent.js"></script>
	

</body>


</html>