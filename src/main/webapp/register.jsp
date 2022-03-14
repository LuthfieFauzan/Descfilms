<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<jsp:include page="header.jsp"></jsp:include>
		<link href="css/jquery-ui.css" rel="stylesheet">
<title id="title">Register</title>

</head>
<%
try{
	if(session.getAttribute("idu")!=null){
		response.sendRedirect("index.jsp");
	}
}catch(Exception e){	
}
%>
<body id="page-top" style="background-color: #1f2833">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: darkred" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="index.jsp" style="color: white;">Descfilm</a>
		        	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation" style="background-color: firebrick; color: white;">
		            	<span class="navbar-toggler-icon my-toggler"></span>
					</button>
		            <div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
		                	
				    	<li class="nav-item">
				        	<a class="nav-link" href="about.jsp">About Us</a>
				        </li>
					</ul>
				</div>
			</div>
		</nav>
    	<br/><br/><br/>   	
        <form action="regis"   method="post">
    	<div class="container" id="regist">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header text-center" style="background-color: darkred; color: white;">Register</div>
                <div class="card-body">
					<div class="form-group">
						<div class="form-group">
							Email
							<input id="inputEmail" name="email" class="form-control" label="Email" type="email" required="true"/>
							<p for="inputEmail" style="color:red"></p>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="form-group">
                    		Username
							<input id="inputUsername" name="name" class="form-control" label="Username" required="true"  />
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
							</div> 
					<div class="col-md-6 mb-3">
		                    	<label for="DOB">Date of birth</label>
								<input type="date" name="date" placeholder="YYYY/MM/DD" class="form-control" required>							
							</div> 		                                 
                    </div>
                    	<div class="form-group">
                    		Password
							<input id="inputPassword" name="pass" class="form-control" label="Password" required="true" type="password" redisplay="true"/>
                            <p for="inputPassword" style="color:red"></p>
                        </div>
                        <div class="form-group">
                    		Confirm password
							<input id="inputcPassword" name="cpass" class="form-control" label="cPassword" required="true" type="password" redisplay="true"/>
                            <p for="inputcPassword" style="color:red"></p>
                        </div>
                        <p id="text" value="" style="color: red; text-transform: uppercase; align-content: center"><%if(request.getParameter("error")!=null){out.print("Email already exist");}%></p>
                    <input type="submit" value="Register" class="btn btn-block btn-info" style="color: white;">        
                    </div>
                                                
                </div>
            </div>
        </div>
        </form>
        <br/>
        <a href="login.jsp">
        <button class="btn btn-block" style="color: white;">Already have account?</button>
        </a> 
        <br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideupdown.js"></script>
		<script src="js/register.js" type="text/javascript"></script>
</body>
</html>