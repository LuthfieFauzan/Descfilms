<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
		<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
int id= Integer.parseInt(request.getParameter("id"));
Connection con = null;
int fav=0;
ResultSet rs = null;
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement stmt=connection.createStatement();  
	Statement st=connection.createStatement();
	ResultSet favcheck=stmt.executeQuery("SELECT COUNT(*) FROM `favourite` WHERE `movie_id` ="+id +" AND `user_id` ="+ session.getAttribute("idu"));
	favcheck.next();
	fav=favcheck.getInt(1);
	ResultSet likeset=null;
rs = stmt.executeQuery("select * from mytable where id="+id);
rs.next();
%>


<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		<jsp:include page="header.jsp"></jsp:include>
        <title id="title"><%out.println(rs.getString(2));%>Descfilm</title>
	</head>
	<body onload="prefent()" id="page-top" style="background-color: #1f2833">
		<jsp:include page="navbar.jsp"></jsp:include>
		<br/><br/><br/><br/><br/>
		<div class="container">
			<table class="table table-responsive table-borderless table-sm" style="color: white;" id="tabel">
			 <tr>
			    	<td rowspan="10" style="vertical-align: middle"><img src="getImageDetails.jsp?your_id=<%out.println(rs.getInt(1));%>" onerror="this.onerror=null; this.src='img/cover.jpg'" width="300px"></td>
			    	<td class="text-uppercase"><h2><%out.println(rs.getString(2));%></h2></td>
			    	<td class="text-uppercase"style="text-align: center;" ><h2>Score:  <%out.println(rs.getString(17));%> <i class="fa fa-star" aria-hidden="true"></i></h2></td>			    	
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
				<td>
				
				<%
						try{
						if(session.getAttribute("idu")!=null){
							if(fav==1){%>
								<form action="remove.jsp?no=1" method="post">
    							<input type="hidden" name="mid" value="<%=id%>">    							
    							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
    							<button class="btn btn-block btn-dark rounded-1" style="background-color: red; color: white;" type="submit">remove favorite <i class="fa fa-heart"></i></button>
    							</form>
							<%}else{%>
							<form action="favorite.jsp" method="post">
							<input type="hidden" name="mid" value="<%=id%>">    							
							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
							<button class="btn btn-block btn-dark rounded-1" style="background-color: red; color: white;" type="submit">Add to favorite <i class="fa fa-heart-o"></i></button>
							</form>
						<%
								
							}
						%>
						
						<%
						}else{
							%>
							<a href="login.jsp">
							<button class="btn btn-block btn-dark rounded-1" style="background-color: red; color: white;" type="button">Add to favorite <i class="fa fa-heart-o"></i></button>
							</a>
							<%
						}
						}catch(Exception e){	
						}
%>
				
				</td>
				
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
					<%
                    	if(rs.getString(16).matches("(.*).com(.*)")){
                    		%>	
                    		<iframe width="853" height="480" src="<% out.println(rs.getString(16));%>"  frameborder="0" allowfullscreen></iframe>                        	
                    	<%}else{
                    		%>	
                    		<iframe width="853" height="480" src="https://www.youtube.com/embed/JfVOs4VSpmA" frameborder="0" allowfullscreen></iframe>                        	                    		
                    		<%}
                    	%></div>
				</div>
			</div>
		</div>
		<br/><br/>
		<div class="container" style="color: white;">
			<h4>Synopsis</h4><hr/>
			<div style="background-color: #0f0f0f;padding: 20px;border-radius: 10px ">
			<p style="text-align: justify" id="line1">
			<%out.println(rs.getString(14));%>
			</p>
			<p style="text-align: justify" id="line2">
			<%out.println(rs.getString(15));%>
			</p>
			</div>
			
		</div>
		<br/>
		<div class="container" id="review">
		<form action="review" method="post">
		<input type="hidden" name="idu" value="<%= session.getAttribute("idu")%>">
		<input type="hidden" name="idm" value="<%= id%>">
		<div class="card">
    <div class="row">
        <div class="col-12">
            <div class="comment-box ml-2">
                <h4>Write a Review</h4>
                <div class="rating">Score the movie :
                <select name="rate" id="rate" class="form-select">
  <option value="10" selected="selected">10</option>
  <option value="9">9</option>
  <option value="8">8</option>
  <option value="7">7</option>
    <option value="6">6</option>
    <option value="5">5</option>
    <option value="4">4</option>
    <option value="3">3</option>
    <option value="2">2</option>
    <option value="1">1</option>
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
		<div class="card">
		<%
		
		rs=stmt.executeQuery("SELECT `review`.*, `user`.`username`, `user`.`title`FROM review INNER JOIN user ON review.user_id = user.user_id WHERE review.movie_id='"+id+"'"); 
		while(rs.next()){
			%>
			
    <div class="d-flex justify-content-center row" id="review<%=rs.getInt(1)%>">
        <div class="col-md-12">
            <div class="d-flex flex-column comment-section">
                <div class="p-2" style="border-bottom: double;" >
                    <div class="d-flex flex-row user-info">
                    <form action="myprofile.jsp" method="post">
                    <input type="hidden" value="<%=rs.getInt(6) %>" name="other">
                    <button type="submit" style="border: none;background: none">
                    <img class="rounded-circle" src="getimguser.jsp?your_id=<%out.println(rs.getInt(6));%>" onerror="this.onerror=null; this.src='img/profile.png'" width="50">
                    </button>
                    </form>
                    
                        <div class="d-flex flex-column justify-content-start ml-2">
                        <span class="d-block font-weight-bold name"><% out.println(rs.getString(7));%><i class="fa fa-angle-double-right" style="color: black;font-size:26px"></i>&nbsp;&nbsp;<% out.println(rs.getString(8));%> </span>
                        <span class="d-block font-weight-bold name">Rates: <% out.println(rs.getString(2));%> <i class="fa fa-star" aria-hidden="true"></i></span>
                        </div>                     
                    </div>
                   <br/>
                    <div class="d-flex flex-column justify-content-start ml-2"  >
                        <p class="p-2"><% out.println(rs.getString(3));%></p>
                    </div>
                    <div class="d-flex flex-row fs-12">
                        <div class="like cursor"><%out.println(rs.getString(4));%> Like &nbsp;</div>
                        <% 
                        try{
                        	
    						if(session.getAttribute("idu")!=null){
    							
    							likeset =st.executeQuery("SELECT COUNT(*) FROM `like` WHERE `review_id` ="+rs.getString(1) +" AND `user_id` ="+ session.getAttribute("idu"));
    							likeset.next();
    							int like=likeset.getInt(1);
    							if(like==1){
    								%>
        							<form action="remove.jsp?no=2" method="post">
        							<input type="hidden" name="mid" value="<%=id%>">
        							<input type="hidden" name="rid" value="<%= rs.getString(1)%>">
        							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
        							<button type="submit" style="border: none;background: none"><i class="fa fa-heart" style="color: red"></i></button>
        						 
        							
        							</form>
        							
        							<%	
    							}else{
    								%>
        							<form action="like.jsp" method="get">
        							<input type="hidden" name="mid" value="<%=id%>">
        							<input type="hidden" name="rid" value="<%= rs.getString(1)%>">
        							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
        							<button type="submit" style="border: none;background: none"><i class="fa fa-heart-o" style="border: thick;"></i></button>
        						 
        							
        							</form>
        							
        							<%
    							}
    							}else{
    								%>
    								<a href="login.jsp">
    								<button type="button" style="border: none;background: none"><i class="fa fa-heart-o" style="border: thick;"></i></button>
    								</a>
    								<%
    							}
    							}catch(Exception e){	
    							} %>
                    </div>
                    <%
                    if(rs.getString(6).equals(session.getAttribute("idu"))){
                    	%>
                    	<div class="d-flex flex-row fs-12">
                        <form action="remove.jsp?no=3" method="post">
        							<input type="hidden" name="mid" value="<%=id%>">
        							<input type="hidden" name="rid" value="<%= rs.getString(1)%>">
        							<input type="hidden" name="uid" value="<%=session.getAttribute("idu")%>">
        							<button type="submit" style="border: none;background: none"><i class="fa fa-trash" style="border: thick;"></i>&nbsp;Delete</button>      					        							
        							</form>
                    </div>
                    	
                    <%}
                    %>
                </div>
                               
            </div>
        </div>
    </div>
	
		<% }%>
		</div>
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