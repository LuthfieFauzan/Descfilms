<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    		<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
String id =null;
	if(session.getAttribute("idu")!=null){
		id=session.getAttribute("idu").toString();		
	}else{
		response.sendRedirect("login.jsp");
	}


Connection con = null;
ResultSet rs = null;
String connectionURL = "jdbc:mysql://localhost:3306/descfilm"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement stmt=connection.createStatement();  
	Statement st=connection.createStatement();
	rs=stmt.executeQuery("SELECT `username`, `gender`, `date_of_birth`,`desc` FROM `user` WHERE user_id="+id);
	rs.next();
try{
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<jsp:include page="header.jsp"></jsp:include>
		<link href="css/jquery-ui.css" rel="stylesheet">
<title id="title">Edit Profile</title>

</head>

<body id="page-top" style="background-color: #1f2833">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: darkred" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="index.jsp" style="color: white;">Descfilm</a>
		        	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="background-color: firebrick; color: white;">
		            	<span class="navbar-toggler-icon my-toggler"></span>
					</button>
		            <div class="collapse navbar-collapse" id="navbarResponsive">					
				</div>
			</div>
		</nav>
    	<br/><br/><br/>   	
        <form action="editservletu" enctype="multipart/form-data"  method="post">
    	<div class="container" id="regist">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header text-center" style="background-color: darkred; color: white;">Edit my profile</div>
                <div class="card-body">
					<input name="id" type="hidden" value="<%= session.getAttribute("idu")%>">
                    <div class="form-group">
                    	<div class="form-group">
                    		Username
							<input id="inputUsername" name="name" class="form-control" label="Username" placeholder="Username" required="true" value="<%=rs.getString(1) %>"/>
                            <p for="inputUsername" style="color:red"></p>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-md-6 mb-3">
		                    	<label for="gender">Gender</label>
								<select class="custom-select d-block w-100" id="gender" name="gender" class="form-control" required>
	                                <option value="Male">Male</option>
	                                <option value="Female">Female</option>	                              
	                            </select>
	                            <script type="text/javascript">
	                            document.getElementById("gender").value = <%out.print("'"+rs.getString(2)+"'"); %>;
	                            </script>								
							</div> 
					<div class="col-md-6 mb-3">
		                    	<label for="DOB">Date of birth</label>
								<input type="date" name="date" placeholder="YYYY/MM/DD" class="form-control" required value="<%=rs.getString(3) %>" min="1900-01-01" max="2021-01-01">							
							</div> 		                                 
                    </div>
                    	<div class="form-group">
                    		Description							
		                        <textarea id="Description" name="description" class="form-control"   placeholder="Your description" rows="2" required><%=rs.getString(4) %></textarea>
                            
                        </div>
                        <div class="form-group">
                    	<label for="files">Profile Image</label>
		                    	<input type="file" id="files" accept="image/*"  name="file"  class="form-control">
		                    	<textarea style="display: none" id="a" name="a" rows="" cols="">0</textarea>
                        </div>
                        <p id="text" value="" style="color: red; text-transform: uppercase; align-content: center"></p>
                    <input type="submit" value="Confirm" class="btn btn-block btn-info" style="color: white;">
                    <br/>
                     <a href="myprofile.jsp">
                     <button class="btn btn-block btn-danger" style="color: white;" type="button" value="cancel" >Cancel</button>
                     </a>        
                    </div>                                              
                </div>
            </div>
        </div>
        </form>
        <%
}catch(Exception e){
	
}
        %>
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
        <br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideupdown.js"></script>
		
</body>
</html>