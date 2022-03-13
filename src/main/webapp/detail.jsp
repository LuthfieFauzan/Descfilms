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
		<form action="review" method="post">
		<input type="hidden" name="idu" value="<%= session.getAttribute("idu")%>">
		<input type="hidden" name="idm" value="<%= id%>">
		<div class="card">
    <div class="row">
        <div class="col-12">
            <div class="comment-box ml-2">
                <h4>Write a Review</h4>
                <div class="rating">Score the movie
                <select name="rate" id="rate" class="form-select">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10" selected="selected">10</option>
</select>
                </div>
                <br/>
                <div class="comment-area"><textarea class="form-control" name="review" placeholder="what is your Review" rows="4" required="required"></textarea> </div>
                <div class="comment-btns mt-2">
                    <div class="row">
                        <div class="col-6" style="padding: 12px;">
                        <%
						try{
						if(session.getAttribute("idu")!=null){
						%>
						<input type="submit" class="btn btn-success send btn-sm" value="Post your review">
						<%
						}else{
							%>
							<a href="login.jsp">
							<button class="btn btn-success send btn-sm" type="button">Login</button>
							</a>
							<%
						}
						}catch(Exception e){	
						}
%>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
		</form>
		</div>
		<div class="container mt-5">
		<%rs=stmt.executeQuery("SELECT `review`.*, `user`.`username`FROM review INNER JOIN user ON review.user_id = user.user_id WHERE review.movie_id='"+id+"'"); 
		while(rs.next()){
			%>
			
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
                        <p class="p-2"><% out.println(rs.getString(3));%></p>
                    </div>
                    <div class="d-flex flex-row fs-12">
                        <div class="like cursor"><%out.println(rs.getString(4));%> Likes  </div>
                        <%try{
    						if(session.getAttribute("idu")!=null){
    							%>
    							<form action="like.jsp" method="get">
    							<input type="hidden" name="mid" value="<%=id%>">
    							<input type="hidden" name="rid" value="<%= rs.getString(1)%>">
    							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
    							<input type="submit" class="btn btn-success send btn-sm" value="Like">
    							</form>
    							
    							<%
    							}else{
    								%>
    								<a href="login.jsp">
    								<button class="btn btn-success send btn-sm">Like</button>
    								</a>
    								<%
    							}
    							}catch(Exception e){	
    							} %>
                    </div>
                </div>
                               
            </div>
        </div>
    </div>
	<br/>
		<% }%>
		</div>
		
		<br/>
		<jsp:include page="footer.jsp"></jsp:include>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideupdown.js"></script>
		<script src="js/detail.js"></script>
		<script src="js/prefent.js"></script>
	</body>
</html>