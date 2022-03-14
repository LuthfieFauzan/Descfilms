<%@page import="jakarta.servlet.annotation.WebServlet"%>
<%@page import="jakarta.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="jakarta.servlet.annotation.WebServlet" %>

<%
try{
	if(session.getAttribute("idu")!=null){
		response.sendRedirect("index.jsp");
	}
}catch(Exception e){	
}
%>
<%
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
Statement st= connection.createStatement();
ResultSet rs=null;
String a,b,c,d,e,f,g,i,j,k,l,m,n;
String id;
a="";
b="";
c="";
d="";
e="";
f="";
g="";
int h=1900;
i="";
j="";
k="";
l="";
m="";
n="";
%>

<html lang="en">
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/stylesheet.css" rel="stylesheet">
		<link href="img/movie.png" rel="shortcut icon"/>
        <title>Admin Zone | Descfilm</title>
    </head>
    <body onload="loads()" id="page-top" style="background-color: #1f2833" ng-app="validationApp" ng-controller="mainController">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: darkred" id="mainNav">
            <div class="container">           
	            <a href="index.jsp" class="navbar-brand" style="color: white">Descfilm</a>
	            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="background-color: firebrick; color: white;">
	            	<span class="navbar-toggler-icon my-toggler"></span>
				</button>
	            <div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
	                	<li class="nav-item dropdown">
	                		<a id="sectionnav" href="#" class="nav-link dropdown-toggle" id="sectionss" data-toggle="dropdown" style="display: <%if(session.getAttribute("ids")==""|| session.getAttribute("ids")==null||session.getAttribute("ed")!=""){out.println("none");}else{out.println("unset");} %>">Sections<b class="caret"></b></a>
	                		<ul class="dropdown-menu multi-column columns-3" style="background: darkred">
	                			<li>
	                				<div>
	                					<ul style="list-style-type: none; padding: 0px;">
	                						<li class="nav-item">
	                							<a class="nav-link js-scroll-trigger" href="#table1">Movie List</a>
	                						</li>
	                						<li class="nav-item">
	                							<a class="nav-link js-scroll-trigger" href="#table2">Visitor Message</a>
	                						</li>
	                					</ul>
	                				</div>
	                			</li>
	                		</ul>
	                	</li>
	                	<li class="nav-item">
				        	<a id="logoutnav" class="nav-link text-uppercase"  href="logout.jsp" style="display: <%if(session.getAttribute("ids")==""|| session.getAttribute("ids")==null){out.println("none");}else{out.println("unset");} %>"><b>logout</b></a>
				        </li>
					</ul>
				</div>
            </div>
        </nav>
        <br/><br/><br/><br/><br/><br/>
        <%
        if(session.getAttribute("ids")==""|| session.getAttribute("ids")==null){
        	%>
        	<div class="container" id="logen">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header text-center" style="background-color: darkred; color: white;">Login Admin</div>
                <div class="card-body">
					<form action="loginadmin.jsp" method="post">
					<div class="form-group">
						<div class="form-group">
							Username
							<input id="inputUsername" class="form-control" label="Username" name="id" required="true"/>
							<p for="inputUsername" style="color:red"></p>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="form-group">
                    		Password
							<input id="inputPassword" class="form-control" label="Password" name="pass" required="true" type="password" redisplay="true"/>
                            <p for="inputPassword" style="color:red"></p>
                        </div>
                    </div>
                    <p id="text" value="" style="color: red; text-transform: uppercase; align-content: center"><%if(session.getAttribute("val")=="0"|| session.getAttribute("val")==null){out.println("");}else{out.println("Wrong username and password");}  %></p>
                    <input type="submit" class="btn btn-block btn-warning" style="color: white;" value="Login"  />
					</form>
                   </div>
            </div>
        </div> 
        	<% 
        }
        %>    
        <div class="container">
        	<div id="table1" style="display: <%if(session.getAttribute("ids")==""|| session.getAttribute("ids")==null||session.getAttribute("ed")!=""){out.println("none");}else{out.println("unset");} %>">
        		<div class="row">
	                <div class="col-md-12" >
	                    <h3 class="mt-5 mb-5 text-center text-uppercase" style="color: white;">movie list</h3>
	                    <button id="add" class="btn btn-info" onclick="adds()">Add a new movie</button><br/><br/>
						<table class="text-center table table-bordered pb-5" id="movietbl" width="100%" cellspacing="0" style="background-color:white">
	                        <thead style="background-color: brown; color:white">
	                        	<tr>
		                        	<th>#ID</th>
		                        	<th>Title</th>
		                            <th>Genre</th>
		                            <th>Language</th>
		                            <th>Runtime</th>
		                            <th>Year</th>
		                            <th>Image</th>
		                            <th>Action</th>
								</tr>
	                        </thead>
	                        <%
	                        rs= st.executeQuery("SELECT * FROM `mytable`");
	                        while(rs.next()){
	                        	%>
	                        	<tr onclick="call(<%out.println(rs.getInt(1));%>)">
						<td><% out.println(rs.getInt(1));%></td>
				        <td><% out.println(rs.getString(2));%></td>
				        <td><% out.println(rs.getString(4));%></td>
				        <td><% out.println(rs.getString(5));%></td>
				        <td><% out.println(rs.getString(6));%></td>
				        <td><% out.println(rs.getString(10));%></td>
				        <td><img class="img-fluid" src="getImageDetails.jsp?your_id=<%out.println(rs.getInt(1));%>" width="90px" height="120px"></td>
				        <td>
				        <form action="edit.jsp" method="post">
				        <input type="hidden" value="<%out.println(rs.getInt(1));%>" name="movie">
				        <a href="#forms" onclick="edit()"><input type="submit" style="color:black;background-color:orange" class="btn  btn-block" value="Edit"></a>
				        
				        </form>
			        		<br/>
			        		<form action="deletem" method="post" onsubmit="return confirm('Are you sure you want to Delete?');">
				        <input type="hidden" value="<%out.print(rs.getInt(1));%>" name="movie">
				        
				        <input type="submit" class="btn btn-danger btn-block" value="Delete">		        
				        </form>
			        	</td>
				        </tr>
	                        <%}
	                        %>
	                    </table>
	                </div>
	            </div>
        	</div>
        </div>
        <br/>
        <div class="container" style="background-color: brown; color: white">
        	<div id="forms" style="display: <%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("none");}else{out.println("unset");} %>">
	        	<div class="col-md-12">
		        	<h4 class="text-center mb-3">Movie Data Form</h4>
		        	<%if(session.getAttribute("ed")!=""|| session.getAttribute("ed")!=null){
		        		String idz="" ;		        		
		        			try{idz=session.getAttribute("ed").toString();
		        			rs = st.executeQuery("SELECT * FROM `mytable` WHERE `id` ='"+idz+"'");
				        	rs.next();				        	
				        	a= rs.getString(2);		        	
				        	b= (rs.getString(4));
				        	c= (rs.getString(5));
				        	d= (rs.getString(6));
				        	e= (rs.getString(7));
				        	f= (rs.getString(8));
				        	g= (rs.getString(9));
				        	h= rs.getInt(10);
				        	i= (rs.getString(11));
				        	j= (rs.getString(12));
				        	k= (rs.getString(13));
				        	l= (rs.getString(14));
				        	m= (rs.getString(15));
				        	n= (rs.getString(16));	
		        			}catch(Exception se){		        				
		        			}        			
		        	}
		        	
		        	%>		        	
		        	<form id="tesform" name="movieForm" enctype="multipart/form-data"  class="form-group needs-validation" action="<%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.print("addservlet");}else{out.print("editservletm");} %>" method="post" novalidate>
		            	<div class="row">
		            	<input type="text" name="id" value="<%out.print(session.getAttribute("ed")); %>" style="display: none" >	                	
		                    <div class="col-md-7 mb-3" ng-class="{ 'has-error' : movieForm.title.$invalid && !movieForm.title.$pristine }">
		                    	<label for="title">Title</label>
		                        <input type="text" id="title" value="<%out.println(a);%>" name="title" class="form-control" ng-minlength="1" placeholder="*required" required >
		                        <p ng-show="movieForm.title.$invalid && !movieForm.title.$pristine" class="help-block" style="color: orange">Title required.</p>
							</div>
		                    <div class="col-md-5 mb-3" ng-class="{ 'has-error' : movieForm.genre.$invalid && !movieForm.genre.$pristine }">
								<label for="genre">Genre</label>
								<input type="text" id="genre" name="genre" class="form-control" ng-minlength="1" value="<%out.println(b);%>"  placeholder="*required" required>		                        
								<p ng-show="movieForm.genre.$invalid && !movieForm.genre.$pristine" class="help-block" style="color: orange">Genre required.</p>
							</div>
						</div>
		                <div class="row">
							<div class="col-md-2 mb-3" ng-class="{ 'has-error' : movieForm.language.$invalid && !movieForm.language.$pristine }">
		                    	<label for="language">Language</label>
								<input type="text" id="language" name="language" class="form-control" ng-minlength="1" value="<%out.println(c);%>"  placeholder="*required" required>		                        		                    			                     
								<p ng-show="movieForm.language.$invalid && !movieForm.language.$pristine" class="help-block" style="color: orange">Language required.</p>
							</div>
		                    <div class="col-md-2 mb-3" ng-class="{ 'has-error' : movieForm.runtime.$invalid && !movieForm.runtime.$pristine }">
		                    	<label for="runtime">Runtime (minutes)</label>
		                        <input type="text" id="runtime" name="runtime" class="form-control" ng-minlength="2" value="<%out.println(d);%>" placeholder="*required" required>
								<p ng-show="movieForm.runtime.$invalid && !movieForm.runtime.$pristine" class="help-block" style="color: orange">Runtime required.</p>
							</div>
		                    <div class="col-md-8 mb-3" ng-class="{ 'has-error' : movieForm.producer.$invalid && !movieForm.producer.$pristine }">
		                    	<label for="producer">Producer</label>
		                        <input type="text" id="producer" name="producer" class="form-control" ng-minlength="1" value="<%out.println(e);%>" placeholder="*required" required>
								<p ng-show="movieForm.producer.$invalid && !movieForm.producer.$pristine" class="help-block" style="color: orange">Producer required.</p>
							</div>
						</div>
		                <div class="row">
		                	<div class="col-md-3 mb-3" ng-class="{ 'has-error' : movieForm.director.$invalid && !movieForm.director.$pristine }">
		                    	<label for="director">Director</label>
		                        <input type="text" id="director" name="director" class="form-control" ng-minlength="1" value="<%out.println(f);%>" placeholder="*required" required>
								<p ng-show="movieForm.director.$invalid && !movieForm.director.$pristine" class="help-block" style="color: orange">Director required.</p>
							</div>
		                    <div class="col-md-5 mb-3" ng-class="{ 'has-error' : movieForm.distributor.$invalid && !movieForm.distributor.$pristine }">
		                    	<label for="distributor">Distributor</label>
		                        <input type="text" id="distributor" name="distributor" class="form-control" ng-minlength="1" value="<%out.println(g);%>" placeholder="*required" required>
								<p ng-show="movieForm.distributor.$invalid && !movieForm.distributor.$pristine" class="help-block" style="color: orange">Distributor required.</p>
							</div>
		                    <div class="col-md-2 mb-3" ng-class="{ 'has-error' : movieForm.year.$invalid && !movieForm.year.$pristine }">
		                    	<label for="year">Year</label>
		                        <input type="number" id="year" name="year" class="form-control" ng-minlength="4" value="<%out.print(h);%>" placeholder="*required" required>
								<p ng-show="movieForm.year.$invalid && !movieForm.year.$pristine" class="help-block" style="color: orange">Year required.</p>
							</div>
		                    <div class="col-md-2 mb-3" ng-class="{ 'has-error' : movieForm.rating.$invalid && !movieForm.rating.$pristine }">
		                    	<label for="rating">Rating</label>
								<select class="custom-select d-block w-100" id="rating" name="rating" class="form-control" ng-model="movie.rating" required>
	                                <option value="" selected>Rating...</option>
	                                <option value="E">E</option>
	                                <option value="PG">PG</option>
	                                <option value="PG-13">PG-13</option>
	                                <option value="R">R</option>
	                            </select>
								<p ng-show="movieForm.rating.$invalid && !movieForm.rating.$pristine" class="help-block" style="color: orange">Rating required.</p>
							</div>
						</div>
		                <div class="row">
		                	<div class="col-md-12 mb-3" ng-class="{ 'has-error' : movieForm.casts.$invalid && !movieForm.casts.$pristine }">
		                    	<label for="casts">Casts</label>
		                        <textarea id="casts" name="casts" class="form-control" ng-minlength="1"   placeholder="*required" rows="1" required><%out.println(j);%></textarea>
								<p ng-show="movieForm.casts.$invalid && !movieForm.casts.$pristine" class="help-block" style="color: orange">Casts required.</p>
							</div>
		                    <div class="col-md-12 mb-3" ng-class="{ 'has-error' : movieForm.synopsisshort.$invalid && !movieForm.synopsisshort.$pristine }">
		                    	<label for="synopsisshort">Synopsis Short</label>
		                        <textarea id="synopsisshort" name="synopsisshort" class="form-control" ng-minlength="1"  placeholder="*required" rows="2" required><%out.println(k);%></textarea>
								<p ng-show="movieForm.synopsisshort.$invalid && !movieForm.synopsisshort.$pristine" class="help-block" style="color: orange">Short synopsis required.</p>
							</div>
						</div>
		                <div class="row">
		                	<div class="col-md-12 mb-3" ng-class="{ 'has-error' : movieForm.synopsisline1.$invalid && !movieForm.synopsisline1.$pristine }">
		                    	<label for="synopsisline1">Synopsis Line 1</label>
		                        <textarea id="synopsisline1" name="synopsisline1" class="form-control" ng-minlength="1"  placeholder="*required" rows="5" required><%out.println(l);%></textarea>
								<p ng-show="movieForm.synopsisline1.$invalid && !movieForm.synopsisline1.$pristine" class="help-block" style="color: orange">Synopsis Line 1 required.</p>
							</div>
		                    <div class="col-md-12 mb-3">
		                    	<label for="synopsisline2">Synopsis Line 2</label>
		                        <textarea id="synopsisline2" name="synopsisline2"  class="form-control" rows="5"><%out.println(m);%></textarea>
							</div>
						</div>
		                <div class="row">
		                	<div class="col-md-6 mb-3" ng-class="{ 'has-error' : movieForm.videourl.$invalid && !movieForm.videourl.$pristine }">
		                    	<label for="videourl">Video URL</label>
		                        <input type="text" id="videourl" name="videourl" class="form-control" ng-minlength="1" value="<%out.println(n);%>"  placeholder="*required" required>
								<p ng-show="movieForm.videourl.$invalid && !movieForm.videourl.$pristine" class="help-block" style="color: orange">Video URL required.</p>
							</div>
							<div class="col-md-6 mb-3">
		                    	<label for="files">Image</label>
		                    	<input type="file" id="files" accept="image/*"  name="files"  class="form-control">
		                    	<textarea style="display: none" id="a" name="a" rows="" cols="">0</textarea>
							</div>
						</div>
						<div class="col-md-12 mb-6">
		                	<ul class="row list-inline">
								<li class="list-inline-item">
									<button id="addBtn" style="display: <%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("unset");}else{out.println("none");} %>" class="btn btn-info btn-block" type="submit" value="Add movie" name="addBtn">Add movie</button>
								</li>
								<li class="list-inline-item">
									<button style="display: <%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("none");}else{out.println("unset");} %>" id="updateBtn" class="btn btn-warning btn-block" type="submit" value="Update movie data" name="updateBtn">Edit movie data</button>
								</li>
								<li class="list-inline-item">
									<button style="display: <%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("none");}else{out.println("unset");} %>" id="removeBtn" class="btn btn-danger btn-block" type="submit" value="Remove movie" name="deleteBtn">Delete movie</button>
								</li>
								<li class="list-inline-item">
									<button id="clearBtn" style="display: <%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("unset");}else{out.println("none");} %>;background-color: grey; color: white" class="btn btn-block" type="reset" value="Clear form" name="clearBtn">Clear form</button>
								</li>
								<li class="list-inline-item">
								<a href="<%if(session.getAttribute("ed")==""|| session.getAttribute("ed")==null){out.println("");}else{out.println("edit.jsp?c=1");} %>">
									<button id="cancel"  style="background-color: black; color: white" type="button" class="btn btn-block" value="Cancel" name="cancel" onclick="">Cancel</button>		
								</a>
						        </li>
							</ul>
						</div>
					</form>
	        	</div>
			</div>
        </div>
        <br/>
		<div class="container">
			<div id="table2" style="display: <%if(session.getAttribute("ids")==""|| session.getAttribute("ids")==null||session.getAttribute("ed")!=""){out.println("none");}else{out.println("unset");} %>">
				<div class="row">
	                <div class="col-md-12" >
	                    <h3 style="color: white">Visitor Message</h3>
	                    <table class="text-center table table-bordered pb-5" id="suggestiontbl" width="100%" cellspacing="0" style="background-color: white">
	                        <thead>
	                        	<tr>
		                        	<th style="background-color: brown; color: white">Name</th>		                        	
		                        	<th style="background-color: brown; color: white">Message</th>
								</tr>
								<%
								rs = st.executeQuery("select feedback.feedbacks,user.username from feedback INNER JOIN user on feedback.user_id = user.user_id ");
								while(rs.next()){%>	
								<tr>
		                        	<td ><%out.print(rs.getString(2)); %></td>		                        	
		                        	<td ><%out.print(rs.getString(1)); %></td>
								</tr>							
								<%}
								%>
	                        </thead>
	                    </table>
	                </div>
	            </div>
			</div>
        </div>
        <br/><br/><br/>
        <footer class="py-5 text-center text-small" style="background-color: firebrick" onmouseover="other()">
			<div class="container">
				<p style="color: white;">Copyright &copy; Descfilm 2020</p>
				<ul class="list-inline">
					<li class="list-inline-item">
						<a href="#" style="color: white">Privacy Policy</a>
					</li>
					<li class="list-inline-item">
						<a href="#" style="color: white">Terms of Use</a>
		            </li>
				</ul>
			</div>
		</footer>
		<a id="scroll" style="display: none;"><span></span></a>
        <jsp:include page="scripts.jsp"></jsp:include>
        <script src="js/angular.js"></script>
        <script src="js/angular-validatemovie.js"></script>
        <script src="js/logicadmin.js"></script>
        
        
       <script type="text/javascript">
       var input = document.querySelector('input[type=file]');
       var textarea = document.getElementById('a');

       function readFile(event) {
         textarea.textContent = "1";
         console.log(event.target.result);
       }

       function changeFile() {
         var file = input.files[0];
         var reader = new FileReader();
         reader.addEventListener('load', readFile);
         reader.readAsText(file);
       }
       input.addEventListener('change', changeFile);
       </script>
    </body>
</html>