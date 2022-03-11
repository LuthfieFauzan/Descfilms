<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<jsp:include page="header.jsp"></jsp:include>
		<link href="css/jquery-ui.css" rel="stylesheet">
<title id="title">Login</title>
</head>

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
    	<form action="loginuser.jsp" method="post">
    	<div class="container" id="login">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header text-center" style="background-color: darkred; color: white;">Login</div>
                <div class="card-body">
					<div class="form-group">
						<div class="form-group">
							Email / Username
							<input id="inputEmails" name="name" class="form-control" label="Email" required="true"/>
							<p for="inputEmail" style="color:red"></p>
                        </div>
                    </div>
                    <div class="form-group">
                    	<div class="form-group">
                    		Password
							<input id="inputPasswords" class="form-control" name="pass" label="Password" required="true" type="password" redisplay="true"/>
                            <p for="inputPassword" style="color:red"></p>
                        </div>
                    </div>
                    <p id="text" value="" style="color: red; text-transform: uppercase; align-content: center"></p>
                    <input type="submit" value="Login" class="btn btn-block btn-warning" style="color: white;">                    
                     <br/>
                     <a href="index.jsp">
                     <button class="btn btn-block btn-danger" style="color: white;" value="cancel" >Cancel</button>
                     </a>
                </div>
            </div>
        </div>
    	</form>
    	<br/>
       <a href="register.jsp">
        <button class="btn btn-block" style="color: white;">Doesn't have an account?<br/>Register</button>
        </a>     
        <br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
		<a id="scroll" style="display: none;"><span></span></a>
		<jsp:include page="scripts.jsp"></jsp:include>
		<script src="js/slideupdown.js"></script>
		<script src="js/loginscript.js"></script>
		
</body>
</html>