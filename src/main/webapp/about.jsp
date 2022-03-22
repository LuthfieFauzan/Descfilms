<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="header.jsp"></jsp:include>
        <title>About Us | Descfilm</title>
    </head>
    <body onload="prefent()" id="page-top" style="background-color: #1f2833" ng-app="validationApp" ng-controller="mainController">
        <jsp:include page="navbar.jsp"></jsp:include>
        <br/><br/><br/>
       
        <br/><br/><br/>
        <div class="container">
            <h1 class="text-center" style="color: white;"><b>About Descfilm</b></h1>
            <br/><br/>
            <h5 style="text-align: justify; color: white;">Descfilm is an established website to let you know on movie release informations. In here user can share their comment / thought of the movie so other people can see their comment / thought about the movie</h5>
            <h5 style="text-align: justify; color: white;">More movies will be added, so keep in touch with us!</h5>
            <br/>
            <h6 style="text-align: right; color: white;"><i>Happy watching!</i></h6>
            <br/><br/><br/>
            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 mb-5">
                            <h2 style="color: white;">Our Base</h2><hr/>
                           
                            <iframe width="100%" height="400px" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCBxS680K7oSbq5Qbh9_dNhWKy7FKXgEOg&q=Asia+e+university" donotallowfullscreen></iframe>
                        </div>
                        <div class="col-lg-6">
                            <form name="userForm" action="feedback" method="post" onsubmit="return confirm('Confirm?');"  novalidate="novalidate">
                                <h2 style="color: white;">Leave a Feedback for Us</h2><hr/>                              
                                <div class="form-group row" >
                                <input type="hidden" name="idu" value="<%=session.getAttribute("idu")%>">
                                    <div class="col-md-12">
                                        <label for="message" style="color: white"><b>Your Feedback</b></label>
                                        <textarea type="text" id="message" name="message" class="form-control" placeholder="*required" cols="15" rows="5" required></textarea>
                                        
                                        <p id="text" style="color: orange; text-transform: uppercase; align-content: center">
                    <%
                    
                    if(request.getParameter("sucess")!=null){out.print("Feedback sucess");}	
                    %>
                    </p>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 mr-auto">
                                    	<%
						try{
						if(session.getAttribute("idu")!=null){
						%>
						<input type="submit" class="btn btn-block btn-dark rounded-1" style="background-color: orange; color: white;" value="Submit my Message">
						<%
						}else{
							%>
							<a href="login.jsp">
							<button class="btn btn-success send btn-sm" style="background-color: orange; color: white;" type="button">Login</button>
							</a>
							<%
						}
						}catch(Exception e){	
						}
%>
                                    	
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <footer class="py-5 text-center text-small" style="background-color: firebrick">
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
				<a href="admin.jsp" style="color: firebrick">Login Admin</a>
			</div>
		</footer>
        <a id="scroll" style="display: none;"><span></span></a>
        <jsp:include page="scripts.jsp"></jsp:include>
        <script src="js/slideshow.js"></script>
        <script src="js/angular.js"></script>
        <script src="js/angular-validatesuggestion.js"></script>
        <script src="js/prefent.js"></script> 
         
    </body>
</html>