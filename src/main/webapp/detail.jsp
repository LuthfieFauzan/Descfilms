<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
		<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
int id= Integer.parseInt(request.getParameter("id"));
Connection con = null;
ResultSet rs = null;
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement stmt=connection.createStatement();  
rs = stmt.executeQuery("select * from mytable where id="+id);
rs.next();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="header.jsp"></jsp:include>
        <title id="title"><%out.println(rs.getString(2));%>Descfilm</title>
	</head>
	<body onload="prefent()" id="page-top" style="background-color: #1f2833">
		<jsp:include page="navbar.jsp"></jsp:include>
		<br/><br/><br/><br/><br/>
		<div class="container">
			<table class="table table-responsive table-borderless table-sm" style="color: white;" id="tabel">
			 <tr>
			    	<td rowspan="12" style="vertical-align: middle"><img src="getImageDetails.jsp?your_id=<%out.println(rs.getInt(1));%>" width="300px"></td>
			    	<td class="text-uppercase"><h2><%out.println(rs.getString(2));%></h2></td>
			    	<td class="text-uppercase"style="text-align: center;" ><h2>Score:  <%out.println(rs.getString(17));%></h2></td>
			    	
				</tr>
			    <tr>
					<td colspan="2"><%out.println(rs.getString(13));%></td>
				</tr>
			    <tr>
			    	<td ><h5>Genre</h5></td>
			        <td>: <%out.println(rs.getString(4));%></td>
				</tr>
			    <tr>
					<td><h5>Language</h5></td>
			        <td>: <%out.println(rs.getString(5));%></td>
				</tr>
				<tr>
					<td><h5>Runtime</h5></td>
			        <td>: <%out.println(rs.getString(6));%></td>
				</tr>
				<tr>
					<td><h5>Producer</h5></td>
					<td>: <%out.println(rs.getString(7));%></td>
			    </tr>
				<tr>
					<td><h5>Director</h5></td>
			        <td>: <%out.println(rs.getString(8));%></td>
				</tr>
				<tr>
					<td><h5>Distributor</h5></td>
					<td>: <%out.println(rs.getString(9));%></td>
				</tr>
				<tr>
					<td><h5>Year</h5></td>
			        <td>: <%out.println(rs.getString(10));%></td>
	            </tr>
				<tr>
					<td><h5>Rating</h5></td>
			        <td>: <%out.println(rs.getString(11));%></td>
				</tr>
				<tr>
					<td><h5>Casts</h5></td>
					<td>: <%out.println(rs.getString(12));%></td>
				</tr>
			</table>
		</div>
		<div class="container">
			<div class="flip-container">
				<button id="flip" class="btn btn-block btn-dark rounded-1" style="background-color: orange; color: white;">Open trailer video</button>
				<button id="btn" class="btn btn-block btn-dark rounded-1" style="display: none; background-color: orange; color: white;">Close trailer video</button>
				<div id="panel">
					<div class="video-container" id="yutub">
					<iframe src="<%out.println(rs.getString(16));%>" frameborder="0" allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>
		<br/><br/>
		<div class="container" style="color: white;">
			<h4>Synopsis</h4><hr/>
			<div style="background-color: #0f0f0f;padding: 20px">
			<p style="text-align: justify" id="line1">
			<%out.println(rs.getString(14));%>
			</p>
			<p style="text-align: justify" id="line2">
			<%out.println(rs.getString(15));%>
			</p>
			</div>
			
		</div>
		<br/>
		<div class="container">
		<div class="card">
    <div class="row">
        <div class="col-10">
            <div class="comment-box ml-2">
                <h4>Add a Review</h4>
                <div class="rating">
                <select name="rate" id="rate">
  <option value="volvo">1</option>
  <option value="saab">2</option>
  <option value="mercedes">3</option>
  <option value="audi">4</option>
    <option value="audi">5</option>
    <option value="audi">6</option>
    <option value="audi">7</option>
    <option value="audi">8</option>
    <option value="audi">9</option>
    <option value="audi">10</option>
</select>
                </div>
                <div class="comment-area"> <textarea class="form-control" placeholder="what is your Review" rows="4"></textarea> </div>
                <div class="comment-btns mt-2">
                    <div class="row">
                        <div class="col-6">
                            <div class="Centered"> <button class="btn btn-success send btn-sm">Add review<i class="fa fa-long-arrow-right ml-1"></i></button> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
		</div>
		<%rs=stmt.executeQuery("SELECT `review`.*, `user`.`username`FROM review INNER JOIN user ON review.user_id = user.user_id WHERE review.movie_id='"+id+"'"); 
		while(rs.next()){
			%>
			<div class="container mt-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-12">
            <div class="d-flex flex-column comment-section">
                <div class="bg-white p-2">
                    <div class="d-flex flex-row user-info">
                    <img class="rounded-circle" src="getimguser.jsp?your_id=<%out.println(rs.getInt(6));%>" onerror="this.onerror=null; this.src='img/movie.png'" width="40">
                        <div class="d-flex flex-column justify-content-start ml-2">
                        <span class="d-block font-weight-bold name"><% out.println(rs.getString(7));%></span>
                        <span class="d-block font-weight-bold name">Rates: <% out.println(rs.getString(2));%> </span>
                        </div>                     
                    </div>
                   
                    <div class="d-flex flex-column justify-content-start ml-2">
                        <p><% out.println(rs.getString(3));%></p>
                    </div>
                </div>
                <div class="bg-white">
                    <div class="d-flex flex-row fs-12">
                        <div class="like p-2 cursor"><i class="fa fa-thumbs-o-up"><%out.println(rs.getString(4));%> Likes <button class="btn btn-success">Like<i class="fa fa-long-arrow-right ml-1"></i></div>
                        
                    </div>
                </div>                
            </div>
        </div>
    </div>
</div>
		<% }%>
		
		
		<br/>
		<jsp:include page="footer.jsp"></jsp:include>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideupdown.js"></script>
		<script src="js/detail.js"></script>
		<script src="js/prefent.js"></script>
	</body>
</html>